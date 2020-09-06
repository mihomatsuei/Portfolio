// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  // Likeボタンクリック
  $('.LikesIcon').on('click', function() {
    let $btn = $(this);
    // Likeボタンがonクラス持っていたら
    if ($btn.hasClass('on')) {

      $btn.removeClass('on');

      // 白抜きアイコンに戻す
      $btn.children("i").attr('class', 'far fa-heart LikesIcon-fa-heart');

    } else {

      $btn.addClass('on');

    // ポイントは2つ！！
    // ①アイコンを変更する
    // far fa-heart（白抜きアイコン）
    // ⇒ fas fa-heart（背景色つきアイコン）
    // ②アニメーション+アイコン色変更用のheartクラスを付与する
      $btn.children("i").attr('class', 'fas fa-heart LikesIcon-fa-heart my-heart');
  
    }
});

});
