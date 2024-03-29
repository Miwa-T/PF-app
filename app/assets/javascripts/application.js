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

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require moment
//= require fullcalendar

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/* global $*/

  $(document).on('turbolinks:load', function (){

      $('#calendar').fullCalendar({
          events: '/post_images/mypost_images.json',
                //ボタンのレイアウト
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                //イベントの時間表示を24時間表示に
                timeFormat: "HH:mm",
                //カレンダーの色を変える
                eventColor: '#008db7',
                //イベントの文字色を変える
                eventTextColor: '#ffffff'
      });
    })


