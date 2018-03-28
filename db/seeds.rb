3.times do |n|
  author = User.create name: "User #{n}", country: "Vietnam"
  genre = Genre.create name: "Genre #{n}"
  2.times do |m|
    Book.create name: "Book #{m}", user: author, genre: genre
  end
end

