3.times do |n|
  author = User.create name: "User #{n}", country: "Vietnam"
  Address.create person: author, street: "Street #{n}", city: "City #{n}"
  genre = Genre.create name: "Genre #{n}"
  event = Event.create name: "Event #{n}"
  EventParticipation.create user: author, event: event
  2.times do |m|
    Book.create name: "Book #{m}", author: author, genre: genre
  end
end
