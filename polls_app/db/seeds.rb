# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Response.destroy_all
AnswerChoice.destroy_all
Question.destroy_all
Poll.destroy_all
User.destroy_all


u1 = User.create!(username: 'rhino123')
u2 = User.create!(username: 'giraffe217')
u3 = User.create!(username: 'donkey45')
u4 = User.create!(username: 'hippo28')
u5 = User.create!(username: 'sloth420')

p1 = Poll.create!(author_id: u1.id, title: "Pizza")
p2 = Poll.create!(author_id: u2.id, title: "Vacation")
p3 = Poll.create!(author_id: u3.id, title: "Movie")

q1 = Question.create!(poll_id: p1.id, text: 'how many slices?') #poll_id, txt
q2 = Question.create!(poll_id: p1.id, text: 'toppings?') #poll_id, txt
q3 = Question.create!(poll_id: p2.id, text: 'destination?') #poll_id, txt
q4 = Question.create!(poll_id: p2.id, text: 'how many days?') #poll_id, txt
q5 = Question.create!(poll_id: p3.id, text: 'what genre?') #poll_id, txt
q6 = Question.create!(poll_id: p3.id, text: 'favorite actor?') #poll_id, txt

a1 = AnswerChoice.create!(question_id: q1.id, text: '2 slices') #question_id, txt
a2 = AnswerChoice.create!(question_id: q1.id, text: '3 slices') #question_id, txt

a3 = AnswerChoice.create!(question_id: q2.id, text: 'pepperoni') #question_id, txt
a4 = AnswerChoice.create!(question_id: q2.id, text: 'mushrooms') #question_id, txt
a5 = AnswerChoice.create!(question_id: q2.id, text: 'peppers') #question_id, txt

a6 = AnswerChoice.create!(question_id: q3.id, text: 'Paris') #question_id, txt
a7 = AnswerChoice.create!(question_id: q3.id, text: 'London') #question_id, txt

a8 = AnswerChoice.create!(question_id: q4.id, text: '5 days') #question_id, txt
a9 = AnswerChoice.create!(question_id: q4.id, text: '7 days') #question_id, txt

a10 = AnswerChoice.create!(question_id: q5.id, text: 'horror') #question_id, txt
a11 = AnswerChoice.create!(question_id: q5.id, text: 'action') #question_id, txt
a12 = AnswerChoice.create!(question_id: q5.id, text: 'romance') #question_id, txt

a13 = AnswerChoice.create!(question_id: q6.id, text: 'Brad Pitt') #question_id, txt
a14 = AnswerChoice.create!(question_id: q6.id, text: 'Angelina Jolie') #question_id, txt

#Q1
r1 = Response.create!(answer_choice_id: a1.id, user_id: u3.id) #user_id, answer_choice_id
r2 = Response.create!(answer_choice_id: a1.id, user_id: u4.id) #user_id, answer_choice_id
r3 = Response.create!(answer_choice_id: a1.id, user_id: u5.id) #user_id, answer_choice_id

r5 = Response.create!(answer_choice_id: a2.id, user_id: u2.id) #user_id, answer_choice_id

#Q2
r6 = Response.create!(answer_choice_id: a3.id, user_id: u1.id) #user_id, answer_choice_id
r7 = Response.create!(answer_choice_id: a3.id, user_id: u4.id) #user_id, answer_choice_id

r8 = Response.create!(answer_choice_id: a4.id, user_id: u5.id) #user_id, answer_choice_id
r9 = Response.create!(answer_choice_id: a4.id, user_id: u3.id) #user_id, answer_choice_id

r10 = Response.create!(answer_choice_id: a5.id, user_id: u2.id) #user_id, answer_choice_id

#Q3
r11 = Response.create!(answer_choice_id: a6.id, user_id: u2.id) #user_id, answer_choice_id

r12 = Response.create!(answer_choice_id: a7.id, user_id: u4.id) #user_id, answer_choice_id
r13 = Response.create!(answer_choice_id: a7.id, user_id: u5.id) #user_id, answer_choice_id

#Q4
r14 = Response.create!(answer_choice_id: a8.id, user_id: u3.id) #user_id, answer_choice_id
r15 = Response.create!(answer_choice_id: a8.id, user_id: u1.id) #user_id, answer_choice_id

r16 = Response.create!(answer_choice_id: a9.id, user_id: u2.id) #user_id, answer_choice_id

#Q5
r17 = Response.create!(answer_choice_id: a10.id, user_id: u4.id) #user_id, answer_choice_id
r18 = Response.create!(answer_choice_id: a10.id, user_id: u2.id) #user_id, answer_choice_id

r19 = Response.create!(answer_choice_id: a11.id, user_id: u1.id) #user_id, answer_choice_id

r20 = Response.create!(answer_choice_id: a12.id, user_id: u3.id) #user_id, answer_choice_id

#Q6
r21 = Response.create!(answer_choice_id: a13.id, user_id: u3.id) #user_id, answer_choice_id
r22 = Response.create!(answer_choice_id: a13.id, user_id: u5.id) #user_id, answer_choice_id

r23 = Response.create!(answer_choice_id: a14.id, user_id: u1.id) #user_id, answer_choice_id
