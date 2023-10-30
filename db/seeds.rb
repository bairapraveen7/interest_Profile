 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

names = [
  "Emma Smith",
  "Liam Johnson",
  "Olivia Brown",
  "Noah Wilson",
  "Ava Davis",
  "Jackson Miller",
  "Sophia Taylor",
  "Aiden Anderson",
  "Isabella Martinez",
  "Lucas Thomas",
  "Mia White",
  "Mason Harris",
  "Charlotte Lewis",
  "Elijah Walker",
  "Amelia Moore",
  "Logan Clark",
  "Harper Hall",
  "Ethan Lee",
  "Abigail King",
  "Benjamin Baker"
];

names.each{ |each_item|
  User.create(name: each_item, email: each_item + "@gmail.com", password: "foobar", password_confirmation: "foobar")
}

movies = [
    "Baahubali: The Beginning",
    "The Lion King",
    "Avatar",
    "Titanic",
    "Inception",
    "The Dark Knight",
    "Gladiator",
    "Jurassic Park",
    "Pirates of the Caribbean: The Curse of the Black Pearl",
    "The Shawshank Redemption",
    "The Godfather",
    "Forrest Gump",
    "Star Wars: The Empire Strikes Back",
    "The Matrix",
    "The Lord of the Rings: The Fellowship of the Ring",
    "E.T. the Extra-Terrestrial",
    "Schindler's List",
    "The Avengers",
    "The Dark Knight Rises",
    "The Terminator"
  ];

books = [
    {"name": "To Kill a Mockingbird", "author": "Harper Lee"},
    {"name": "1984", "author": "George Orwell"},
    {"name": "Pride and Prejudice", "author": "Jane Austen"},
    {"name": "The Great Gatsby", "author": "F. Scott Fitzgerald"},
    {"name": "The Catcher in the Rye", "author": "J.D. Salinger"},
    {"name": "Moby-Dick", "author": "Herman Melville"},
    {"name": "The Hobbit", "author": "J.R.R. Tolkien"},
    {"name": "The Hunger Games", "author": "Suzanne Collins"},
    {"name": "The Lord of the Rings", "author": "J.R.R. Tolkien"},
    {"name": "Brave New World", "author": "Aldous Huxley"},
    {"name": "The Alchemist", "author": "Paulo Coelho"},
    {"name": "Frankenstein", "author": "Mary Shelley"},
    {"name": "The Da Vinci Code", "author": "Dan Brown"},
    {"name": "The Shining", "author": "Stephen King"},
    {"name": "The Road", "author": "Cormac McCarthy"},
    {"name": "The Girl with the Dragon Tattoo", "author": "Stieg Larsson"},
    {"name": "Gone with the Wind", "author": "Margaret Mitchell"},
    {"name": "The Chronicles of Narnia", "author": "C.S. Lewis"},
    {"name": "The Grapes of Wrath", "author": "John Steinbeck"},
    {"name": "War and Peace", "author": "Leo Tolstoy"}
]


  

movies.each  { |movie|
    Movie.create(name: movie, director: ('a'..'z').to_a.shuffle[0..5].join(""))
}

names = [
  "alice",
  "bob",
  "charlie",
  "david",
  "eva",
  "frank",
  "grace",
  "helen",
  "isaac",
  "julia",
  "kevin",
  "linda",
  "michael",
  "nora",
  "oliver",
  "penny",
  "quincy",
  "rachel",
  "samuel",
  "tina"
]

names.each  { |name|

   User.create(name: name, email: name+"@gmail.com", password: "foobar", password_confirmation: "foobar")

}

 

books.each { |options|
   Book.create(name: options[:name],author: options[:author])
}

foods = [
  "Hamburger",
  "Sushi",
  "Spaghetti",
  "Fried Chicken",
  "Tacos",
  "Lasagna",
  "Pancakes",
  "Sushi",
  "Burrito",
  "Pizza",
  "Omelette",
  "Barbecue Ribs",
  "Beef Stir-Fry",
  "Clam Chowder",
  "Chicken Alfredo",
  "Lobster Bisque",
  "Beef Stroganoff",
  "Pad Thai",
  "Biryani",
  "Enchiladas"
];

foods.each  { |food|
    Food.create(name: food)
}


songs = [
  "Bohemian Rhapsody - Queen",
  "Imagine - John Lennon",
  "Hotel California - Eagles",
  "Stairway to Heaven - Led Zeppelin",
  "Like a Rolling Stone - Bob Dylan",
  "Billie Jean - Michael Jackson",
  "Yesterday - The Beatles",
  "Smells Like Teen Spirit - Nirvana",
  "Johnny B. Goode - Chuck Berry",
  "Purple Haze - Jimi Hendrix",
  "I Want to Hold Your Hand - The Beatles",
  "Boogie Wonderland - Earth, Wind & Fire",
  "Sweet Child o' Mine - Guns N' Roses",
  "Thriller - Michael Jackson",
  "Let It Be - The Beatles",
  "With or Without You - U2",
  "Don't Stop Believin' - Journey",
  "Rolling in the Deep - Adele",
  "Wonderwall - Oasis",
  "Hey Jude - The Beatles"
];

songs.each { |song| 
    Song.create(name: song)
}

