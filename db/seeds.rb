User.create!( name: "cess",
             username: "cess",
             email: "cess@gmail.com",
             password: "terrence",
             password_confirmation: "terrence",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


User.create!( name: "lawrence",
             username: "lawrence",
             email: "lawrence@gmail.com",
             password: "lawrence",
             password_confirmation: "lawrence",
             activated: true,
             activated_at: Time.zone.now)

100.times do  
  title = Faker::Book.title
  category = Faker::Book.genre
  quantity = Faker::Number.between(10, 20)
  author = Faker::Book.author
  publisher = Faker::Book.publisher

  Book.create!(title: title,
             category: category ,
            quantity: quantity,
            author: author,
            publisher: publisher)
end


