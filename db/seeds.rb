# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
  

movies.each  { |movie|
    Movie.create(name: movie, director: ('a'..'z').to_a.shuffle[0..5].join(""))
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

