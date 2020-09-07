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

// 画像プレビューに関する記述
$(document).on('turbolinks:load',function(){
    $('#user_profile_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".image-choice").attr('src', e.target.result);
    }


    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
    });
    $(".default-image").on('click', function (e) {
    	var url=$(this).attr("src");
    	console.log(e)
        $(".image-choice").attr('src', url);
        $("#user_default_image").val($(this).attr("data-value"))
    })
});

$(window).load(function(){
    var height = window.innerHeight,
  x= 0, y= height/2,
    curveX = 10,
    curveY = 0,
    targetX = 0,
    xitteration = 0,
    yitteration = 0,
    menuExpanded = false;
    
    blob = $('#blob'),
    blobPath = $('#blob-path'),

    hamburger = $('.hamburger');

    $(this).on('mousemove', function(e){
        x = e.pageX;
        
        y = e.pageY;
    });

    $('.hamburger, .menu-inner').on('mouseenter', function(){
        $(this).parent().addClass('expanded');
        menuExpanded = true;
    });

    $('.menu-inner').on('mouseleave', function(){
        menuExpanded = false;
        $(this).parent().removeClass('expanded');
    });

    function easeOutExpo(currentIteration, startValue, changeInValue, totalIterations) {
        return changeInValue * (-Math.pow(2, -10 * currentIteration / totalIterations) + 1) + startValue;
    }

    var hoverZone = 150;
    var expandAmount = 20;
    
    function svgCurve() {
        if ((curveX > x-1) && (curveX < x+1)) {
            xitteration = 0;
        } else {
            if (menuExpanded) {
                targetX = 0;
            } else {
                xitteration = 0;
                if (x > hoverZone) {
                    targetX = 0;
                } else {
                    targetX = -(((60+expandAmount)/100)*(x-hoverZone));
                }           
            }
            xitteration++;
        }

        if ((curveY > y-1) && (curveY < y+1)) {
            yitteration = 0;
        } else {
            yitteration = 0;
            yitteration++;  
        }

        curveX = easeOutExpo(xitteration, curveX, targetX-curveX, 100);
        curveY = easeOutExpo(yitteration, curveY, y-curveY, 100);

        var anchorDistance = 200;
        var curviness = anchorDistance - 40;

        var newCurve2 = "M60,"+height+"H0V0h60v"+(curveY-anchorDistance)+"c0,"+curviness+","+curveX+","+curviness+","+curveX+","+anchorDistance+"S60,"+(curveY)+",60,"+(curveY+(anchorDistance*2))+"V"+height+"z";

        blobPath.attr('d', newCurve2);

        blob.width(curveX+60);

        hamburger.css('transform', 'translate('+curveX+'px, '+curveY+'px)');
    
    $('h1').css('transform', 'translateY('+curveY+'px)');
        window.requestAnimationFrame(svgCurve);
    }

    window.requestAnimationFrame(svgCurve);
    
});