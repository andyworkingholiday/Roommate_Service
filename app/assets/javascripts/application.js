// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs



       

                 
           
           /*$('#content').on('click', '#event a', function(e) {  //행사클릭
          
              e.preventDefault();  //페이지 이동 취소 
              var loc = this.id.toUpperCase();  //id 특성 값을 가져온다.
         
              var newContent = ' ';    //시간표를 생성한다. 
              for (var i = 0; i < times[loc].length; i++) {
                newContent += '<li><span class="time">' 
                               +times[loc][i].time + '</span>';
                newContent += '<a href = "description.html#';
                newContent += times[loc][i].title.replace(/ /g, '-') = '">';
                newContent += times[loc][i].title + '</a></li>';
              }
        
             $('#sessions').html('<ul>' + newContent + '</ul>');
             //페이지에 시간표를 출력한다
        
             $('#event a.current').removeClass('current'); //현재메뉴수정
             $(this).addClass('current');
        
             $('#datails').text(' ');  //세번째 열을 비운다. 
           });*/
            
          /*$('#myTab a:last').tab('show').on('click',  function(e) {
             e.preventDefault();
             $('#myTab a.current').removeClass('current'); //현재메뉴수정
             $(this).addClass('current');
             $('#second').remove();
             
          });
          
          
        //   상원형 해브룸 코드
          $('#sujung').on('click', function(e) {
            e.preventDefault();
            
            
            $('#info').remove();
            $('#info2').load('/mypage/test.html').hide().fadeIn('slow');
          });
          
        
          
          
          
          
          
          $('#submit').on('click', function(e) { 
              $('#second').remove();
              $.ajax({
                        type: 'POST',
                        url: "/mypage/create",
                        data: $('#come').serialize(),
                   }).console.log(data)
                   .done( function(data) {
                     $('#second').load('/mypage/result.html');
                   }).fail( function() {
                     $('#second').html('데이터를 가져오지 못했습니다.');
              });
          });      
           
          


   $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').focus()
    })*/
