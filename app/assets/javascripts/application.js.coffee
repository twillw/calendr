# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require fullcalendar
#= require twitter/bootstrap
#= require_tree .

formatTime = (time) ->
  if time[11] == "0"
    time.slice(12,16)
  else
    time.slice(11,16)


$ ->
  tempVar = ""
  
  $("#calendar")
    .fullCalendar
      dayClick: (date) ->
        
        #changing colour of selected cells only
        if tempVar == ""
          $(this).css('background-color', 'grey')
          tempVar = this
        else
          $(this).css('background-color', 'grey')
          $(tempVar).css('background-color', 'white')
          tempVar = this

        #setting single-day calendar attributes
        singleDay = $("#single-day")
        singleDay.html(' ')
        $(singleDay)
          .fullCalendar
            defaultView: 'agendaDay'
            allDaySlot: false
            firstHour: 9
            slotMinutes: 60
          #sets single-day calendar to date selected in full calendar
          .fullCalendar('gotoDate', date)

  $.ajax 
    url: "/dr_availabilities.json"
    dataType: 'json'
    success: (drAvailabilities) -> 
      for result in drAvailabilities
        day = result.day.slice(0,3)
        clinic_open = formatTime(result.clinic_open)+"am"
        clinic_close = formatTime(result.clinic_close)+"pm"
        if clinic_open != null
          $('.fc-'+day).not('.fc-day-header').append(clinic_open + '-' + clinic_close)

  


      


