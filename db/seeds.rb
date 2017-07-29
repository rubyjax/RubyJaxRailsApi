#Create 25 records with default values for the development db
25.times do | title, category, description |
  Talk.create(
    title: 		 	 FFaker::Book.title,
    category: 	 FFaker::Lorem.sentence,
    description: FFaker::Lorem.paragraph(5)
  )
end