<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/moment@latest/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
    <div id="calendar"></div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialView: 'dayGridMonth' // 초기에 월간 달력으로 설정
            });

            calendar.render();
        });
    </script>
    
</body>
</html>