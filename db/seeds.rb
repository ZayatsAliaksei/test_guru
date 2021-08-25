# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  users = User.create([{ name: 'Alex', email: 'user1@mail.com' }, { name: 'Pol', email: 'user2@mail.com' }])
  categories = Category.create([{title:'Ruby'},{title:'PHP'},{title:'GO'}])
  test = Test.create([
   {title:'About Ruby',level:1,category_id: categories[0].id,user_id:1},
   {title:'About PHP',level:2,category_id: categories[1].id,user_id:1},
   {title:'About GO',level:3,category_id: categories[2].id,user_id:2}
  ])
  questions = Question.create([
   {body:"What year was the Ruby-language created?",test_id:test[0].id},
   {body:"Who created the Ruby language?",test_id:test[0].id},
   {body:"What is depicted on the emblem of the language?",test_id:test[0].id},
   {body:"What year was the PHP-language created?",test_id:test[1].id},
   {body:"Who created the PHP-language?",test_id:test[1].id},
   {body:"What is depicted on the emblem of the PHP-language?",test_id:test[1].id},
   {body:"What year was the GO-language created?",test_id:test[2].id},
   {body:"Which company created the GO-language?",test_id:test[2].id},
   {body:"What is depicted on the emblem of the GO-language?",test_id:test[2].id}
  ])
  answers = Answer.create([
   {body: '1995',correct:true, question_id: questions[0].id},
   {body: '1993', question_id: questions[0].id},
   {body: '2004', question_id: questions[0].id},
   {body: 'Yukihiro Matsumoto',correct:true, question_id: questions[1].id},
   {body: 'David Heinemeier Hansson', question_id: questions[1].id},
   {body: 'Miyamoto Musashi', question_id: questions[1].id},
   {body: 'Gem',correct:true, question_id: questions[2].id},
   {body: 'Stone', question_id: questions[2].id},
   {body: 'Diamond', question_id: questions[2].id},
   {body: '1994',correct:true, question_id: questions[3].id},
   {body: '1997', question_id: questions[3].id},
   {body: '2000', question_id: questions[3].id},
   {body: 'Rasmus Lerdorf',correct:true, question_id: questions[4].id},
   {body: 'Linus Torvalds', question_id: questions[4].id},
   {body: 'Stellan Skarsgard', question_id: questions[4].id},
   {body: 'Elephant',correct:true, question_id: questions[5].id},
   {body: 'Giraffe', question_id: questions[5].id},
   {body: 'Mammoth', question_id: questions[5].id},
   {body: '2007',correct:true, question_id: questions[6].id},
   {body: '1998', question_id: questions[6].id},
   {body: '2010', question_id: questions[6].id},
   {body: 'Google',correct:true, question_id: questions[7].id},
   {body: 'Apple', question_id: questions[7].id},
   {body: 'Facebook', question_id: questions[7].id},
   {body: 'Hamster',correct:true, question_id: questions[8].id},
   {body: 'Mouse', question_id: questions[8].id},
   {body: 'Rat', question_id: questions[8].id}
  ])


  users[0].tests << test[0..1]
  users[1].tests << test




#Rasmus Lerdorf