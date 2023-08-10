class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  has_many :book_lists
  has_many :lists, through: :book_lists 

  has_many :book_genres
  has_many :genres, through: :book_genres

  validates :title, presence: true, uniqueness: true 
  validates :author, presence: true

  accepts_nested_attributes_for :genres

  scope :sort_by_title, -> { order(title: :asc) }

  scope :highest_ranked, -> {joins(:reviews).group("books.id").order("AVG(reviews.rating)  DESC").limit(10)}


  def can_edit_and_delete?
    self.reviews.empty? && self.lists.empty?
  end

  def self.get_book_by_query(query)
    search = GoogleApi.search(query)
    if search["totalItems"] == 0 || search["error"]
      books = []
    else
      books = search["items"].map { |item| Book.find_or_create_book_by_api_hash(item["volumeInfo"]) }
      Book.where(id: books.pluck(:id))
    end
  end

  def self.find_or_create_book_by_api_hash(book)
    book_hash = self.response_to_book_attributes(book)
    response = self.find_or_create_by(book_hash)
end

  def self.response_to_book_attributes(response)
    book_hash = {}
    book_hash[:title] = response["title"]
    book_hash[:author] = response["authors"].join(", ") if response["authors"]
    book_hash[:year_published] = response["publishedDate"].to_i
    book_hash[:page_count] = response["pageCount"]
    book_hash[:description] = response["description"]
    return book_hash
  end

  # def self.find_or_create_book_by_api_hash(book)
  #     book_hash = self.response_to_book_attributes(book)
  #     response = self.find_or_create_by(book_hash)
  #     # puts response.errors.full_messages
  #     # unless response.errors.full_messages.empty?
  #     #   byebug
  #     # end
  #     # return response
  # end

  # def self.get_book_by_query(query)
  #   search = GoogleApi.search(query)
  #   #byebug
  #   if search["totalItems"] == 0 || search["error"]
  #     books = []
  #   else
  #     books = search["items"].map { |item| Book.find_or_create_book_by_api_hash(item["volumeInfo"]) }
  #     Book.where(id: books.pluck(:id))
  #   end
  # end

  def genres_attributes=(genres_attributes)
    genres_attributes.values.each do |genre_attribute|
      if genre_attribute.values.present?
        genre = Genre.new(genre_attribute)
        if genre.save
          self.genres << genre
        end
      end
    end
  end

end
