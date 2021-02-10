# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create(title: 'Ruby')
test = Test.create(title: 'Основы языка Ruby.', level: 1, category_id: cat.id)
question1 = Question.create(body: 'Чем отличается puts от print:', test_id: test.id)
question2 = Question.create(body: 'Какой метод позволяет перевести строку в нижний регистр:', test_id: test.id)
question3 = Question.create(body: "Что выведет этот код: \n some = 25 \n print(“Переменная: ” + some)", test_id: test.id)
Answer.create(body: 'а) Ничем, оба делают одно и тоже', question_id: question1.id, correct: false)
Answer.create(body: 'б) print без пропуска строки, а puts с пропуском', question_id: question1.id, correct: true)
Answer.create(body: 'в) puts позволяет выводить переменные, а print только текст', question_id: question1.id, correct: false)
Answer.create(body: 'а) lowercase()', question_id: question2.id, correct: true)
Answer.create(body: 'б) dcase()', question_id: question2.id, correct: false)
Answer.create(body: 'в) downcase() +', question_id: question2.id, correct: false)
Answer.create(body: 'а) Выведет: “Переменная: some”', question_id: question3.id, correct: false)
Answer.create(body: 'б) Выведет: “Переменная: 25”', question_id: question3.id, correct: true)
Answer.create(body: 'в) Будет выведена ошибка', question_id: question3.id, correct: false)
tom = User.create(name: 'Tom', email: 'tom@gmail.com')
tim = User.create(name: 'Tim', email: 'tim@gmail.com')
jhon = User.create(name: 'Jhon', email: 'jhon@gmail.com')
UserTest.create( test_id: test.id, user_id: tom.id)
UserTest.create( test_id: test.id, user_id: tim.id)U
