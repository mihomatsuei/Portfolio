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
  image: open("./assets/images/default1.png")
  },

{
  id: 2,
  name: 'ぷにぷに',
  email: '2@2',
  beginner_thing: '英会話',
  beginner_period: '1ヶ月',
  beginner_level: '全くしゃべれません',
  expert_thing: '睡眠',
  expert_period: '20年',
  expert_level: 'その人に合った睡眠グッズを紹介できる',
  introduction: 'こんにちは！全く英語が喋れす、これからオンライン英会話に挑戦しよう
  と思っています。同じような方とお話できたらと思い登録いたしました。
  安眠に命をかけてます。睡眠グッズやベッド、布団など色々試したので力になれればと思います。
  よろしくお願いします！',
  password: '111111',
  password_confirmation: '111111',
  image: open("./assets/images/default2.png")
  },

  {
  id: 3,
  name: 'にこにこ',
  email: '3@3',
  beginner_thing: '着物',
  beginner_period: 'これから始めようと思ってます',
  beginner_level: '動画を見ながら何とか着付けができる',
  expert_thing: '筋トレ',
  expert_period: '半年',
  expert_level: 'パーソナルトレーニングジムに半年通っている',
  introduction: 'はじめまして！着物を一人で着られるようになって、
  カフェや美術館巡りしたいな〜と思ってます。筋トレと糖質制限で７キロ痩せました。
  筋トレ、オススメのプロテインなどなんでも聞いてください。よろしくお願いします！
  ',
  password: '111111',
  password_confirmation: '111111',
  image: open("./assets/images/default6.png")
  },

  id: 4,
  name: 'ふわふわ',
  email: '4@4',
  beginner_thing: 'プログラミング',
  beginner_period: 'これから始めようと思ってます',
  beginner_level: '完全に無知',
  expert_thing: '着物',
  expert_period: '５年',
  expert_level: '呉服屋で５年ほど働いてました',
  introduction: 'はじめまして！今の仕事を退職して、プログラミングを勉強して
  転職しようと考えています。趣味は着物で、毎日着物を着ています。
  以前呉服屋で働いていました。お着物のことなら相談乗れると思います。よろしくお願いいたします。
  ',
  password: '111111',
  password_confirmation: '111111',
  image: open("./assets/images/default5.png")
  },

  id: 5,
  name: 'ぷるぷる',
  email: '5@5',
  beginner_thing: 'ダイエット',
  beginner_period: '１ヶ月',
  beginner_level: '糖質制限と筋トレを自力で頑張っている',
  expert_thing: 'プログラミング',
  expert_period: '３年',
  expert_level: '自社開発企業で３年ほど働いてます',
  introduction: 'こんにちは！ダイエットを始めようと思い、ネットやyoutubeで糖質制限と
  筋トレを勉強して日々頑張っています。なかなか成果が出ず、くじけそうになっています・・・。
  同じような方とお話できたらと思います。よろしくお願いします！',
  password: '111111',
  password_confirmation: '111111',
  image: open("./assets/images/default5.png")
  },

  ]
 )

Post.create!(
 [
  {
  id: 1,
  user_id: 1,
  title: "プログラミングを始めて3ヶ月の初心者です",
  body:"HTML&CSS、Ruby、Ruby on rails、Java Scriptを勉強中です。心が折れてしまいそうな時があるのでどなたか励まし合いませんか？"
  },
  {
  id: 2,
  user_id: 2,
  title: "オンライン英会話についてアドバイスください",
  body:"こんにちは！全く英語が喋れす、これからオンライン英会話に挑戦しようと思っています。
  うさぎ英会話とくま英会話で迷っています・・・。金銭面ではうさぎ英会話なんですが、くま英会話のカリキュラムが魅力的です。
  くま英会話使われている方いらっしゃいますか？"
  },
  {
  id: 3,
  user_id: 5,
  title: "ダイエットくじけそうです・・・。",
  body:"こんにちは！ダイエットを始めようと思い、ネットやyoutubeで糖質制限と
  筋トレを勉強して日々頑張っています。なかなか成果が出ず、くじけそうです・・・。"
  },
  {
  id: 4,
  user_id: 4,
  title: "プログラミングの言語について",
  body:"はじめまして！今の仕事を退職して、プログラミングを勉強して
  転職しようと考えています。未経験からの転職でこれから勉強するにあたっておすすめの言語は何でしょうか？
  rubyかpythonかなと思っているのですが・・・！"
  },
  {
  id: 5,
  user_id: 3,
  title: "竺仙の絹紅梅に合わせる名古屋帯について",
  body:"こんにちは！
        最近着物にハマり、毎日ネットでアンティーク着物を見ています。
        まずは浴衣と半幅帯から始めてみようと思っています。
        そこで、竺仙の絹紅梅を買えば、浴衣としても着物としても着れていいな〜と思うのですが、
        名古屋帯を締めるとしたらどういった帯がぴったりなのでしょうか？
        リサイクルショップで金銀糸が入った夏帯（おそらく絽で色は白）を見つけたんですが、
        これだと格が違いすぎますか・・・？
        竺仙のHPでは博多紗八寸献上帯（白）がおすすめされていたのですが値段的に優しくなくて・・・
        有識者さんの回答お待ちしてます！"
  }
 ]
)

PostComent.create!(
 [
  {
  id: 1,
  user_id: 4,
  post_id: 1,
  comment: "こんにちは！私もこれからプログラミングを勉強して転職しようと思っています！
  どんな勉強されてますか？"
  },
  {
  id: 2,
  user_id: 2,
  post_id: 1,
  comment: "こんにちは！仲間ですね！Progateを一通りやってrailsチュートリアルを
  進めています！"
  },
  {
  id: 3,
  user_id: 2,
  post_id: 2,
  comment: "くまオンライン英会話を毎日使っている者です。おすすめです！
  テキストがしっかりしているので楽しいですよ。中学レベルの単語がわかればついていけると
  思います！"
  },
  {
  id: 4,
  user_id: 3,
  post_id: 3,
  comment: "こんにちは！糖質制限辛いですよね・・・！ファイトです！"
  },
  {
  id: 5,
  user_id: 4,
  post_id: 5,
  comment: "こんにちは！
          普段から着物を着て生活している者です。呉服屋で５年ほど働いてました。
          竺仙の絹紅梅素敵ですよね〜！
          竺仙の絹紅梅が浴衣と着物の間くらいの格だと思いますので、金糸銀糸が入っていると少し仰々しいかな？
          と思います。
          金糸銀糸が入っている名古屋帯は、附け下げですとか、紋なしの色無地に合わせてホテルランチとかに使うといいのかなと
          思います。
          竺仙さんのHPで紹介されている博多献上ですが、平織り（夏帯じゃないもの）を買えば夏以外も通年
          使えますのでオススメですよ！
          あとは、私だったら絹紅梅には麻帯に墨絵で秋の七草（季節の先取り）が描かれているものを合わせたいと思います！
          ただ麻帯は一般的に８月までとされているので、汎用性を求めるなら博多献上の平織り（白か茶が何にでも合いますよ！）
          がおすすめです！"
  }
 ]
)
