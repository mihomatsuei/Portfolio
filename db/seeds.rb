# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
 [
  {
  id: 1,
  name: 'もちもち',
  email: '1@1',
  beginner_thing: 'プログラミング',
  beginner_period: '3ヶ月',
  beginner_level: '簡単なアプリを作成できる',
  expert_thing: '英会話',
  expert_period: '2年',
  expert_level: 'アメリカに１年留学行ってました。日常会話を話せる',
  introduction: 'はじめまして！今年の６月からプログラミングを勉強しはじめました。
HTML&CSS、Ruby、Ruby on rails、Java Scriptを勉強中です。
プログラミング初心者の方と励まし合いたいと思って登録しました。
よろしくお願いいたします！
大学中にアメリカのニューヨークに１年留学に行っていたので、日常会話程度の
英会話ならできます。現在オンライン英会話を毎日行ってます。
英語の質問気軽にください〜！',
  password: '111111',
  password_confirmation: '111111',
  }
  ]
 )