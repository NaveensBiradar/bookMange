# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", year_published: 1997, page_count: 309, description: "Harry Potter and the Philosopher's Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling's debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry. Harry makes close friends and a few enemies during his first year at the school, and with the help of his friends, Harry faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry's parents, but failed to kill Harry when he was just 15 months old.")
Book.create(title: "The Lion, the Witch and the Wardrobe", author: "C.S. Lewis", year_published: 1950, page_count: 105, description: "The Lion, the Witch and the Wardrobe is a fantasy novel for children by C. S. Lewis, published by Geoffrey Bles in 1950. It is the first published and best known of seven novels in The Chronicles of Narnia (1950–1956). Among all the author's books, it is also the most widely held in libraries. Although it was originally the first of The Chronicles of Narnia, it is volume two in recent editions that are sequenced by the stories' chronology. Like the other Chronicles, it was illustrated by Pauline Baynes, and her work has been retained in many later editions.")
b = Book.create(title: "The Tiger's Daughter", author: "K. Arsenault Rivera", year_published: 2017, page_count: 428, description: "The story takes place in a secondary world inspired by historical East and Central Asian cultures. The series is concerned with the adventures of, and the romantic relationship between, two young warrior noblewomen: Shizuka, the heir to the Hokkaran Empire, and Shefali, daughter of the ruler of the Qorin steppe nomads. The books take the form of a collection of letters between the two. The trilogy is part of a type of fantasy based on Middle Eastern, Central or East Asian history, sometimes called 'Silk Road fantasy'")

u = User.create(username: "Meg", email: "meg@email.com", password: "password")

r = Review.create(book_id: b.id, user_id: u.id, content: "One of my all time favorite books, reads like poetry", rating: 10)

