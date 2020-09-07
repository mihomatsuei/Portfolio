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

//ラジオボタン
function getRadioValue(name){
  //ラジオボタンオブジェクトを取得する
  var radios = document.getElementsByName(name);
 
  //取得したラジオボタンオブジェクトから選択されたものを探し出す
  var result;
  for(var i=0; i<radios.length; i++){
    if (radios[i].checked) {
      //選択されたラジオボタンのvalue値を取得する
      result = radios[i].value;
      break;
    }
  }
 
  //value値を表示する
  console("value値は" + result + "です");
}


// 画像プレビューに関する記述
$(document).on('turbolinks:load',function(){
    // inputのidから情報の取得
    $('#user_profile_image').on('change', function (e) {
// ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".image-chice").attr('src', e.target.result);
    }

// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
    });
    $(".default-image").on('click', function (e) {
    	var url=$(this).attr("src");
    	console.log(e)
// ここから既存の画像のurlの取得
        $(".image-chice").attr('src', url);
// ここまで
        $("#user_default_image").val($(this).attr("data-value"))
    })
});

