<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	String root = request.getContextPath();
%>

<title>Insert title here</title>

<link rel="stylesheet" href="<%=root%>/static/css/style.css">

<script>
	//웹소켓 객체 생성
	var socket = new WebSocket("ws://localhost:8080/Chat/chatting");
	//웹소켓 연결 시호출 메소드
	socket.onopen = function () {
	console.log("WebSocket 연결 성공.");
	};

	//메시지 수신 시 호출 메소드
	socket.onmessage = function(event){
	console.log("메시지 수신 " + event.data);
	//서버로부터 수신된 메소드 처리
	//에를 들어 수신된 메시지를 채팅 영역에 표시
	var charArea = document.getElementById("chatArea");
	charArea.innerHTML += "<div>" + event.data + "</div>";
	//패팅영역 스크롤 맨 아래로 이동
	charArea.scrollTop = chatArea.scrollHeight;
	};
	// 메시지 연결 종료
	socket.onclose = function(){
	console.log("WebSocket 연결 종료");
	};

	//메시지를 서버로 전송하기 위한 함수
	function sendMessage(){
		var messageInput = document.getElementById("messageInput");
		var message = messageInput.value;
		var name = document.getElementById("name").value;
	
		if(name == ''){
			alert('이름을 입력해주세요')
			return
		}
		//메시지 전송 요청 함수 호철
		socket.send (name + " : " + message);
	
		//메시지 전송한 후 입력 필드를 지움
		messageInput.value = "";
		//채팅영역 스크롤 맨 아래로 이동
		var chatArea = document.getElementById("chatArea");
		chatArea.scrollTop = chatArea.scrollHeight;

	};
	//엔터키 누를 때 sendMessage함수 호찰
	function handleKeyPress(event) {
	    if (event.keyCode == 13) {
	    	sendMessage();
	    }
	}
</script>

     <style>
        .calendar {
            width: 300px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }
        .calendar table {
            width: 100%;
        }
        .calendar th, .calendar td {
            text-align: center;
            padding: 5px;
            cursor: pointer; /* 마우스 커서를 포인터로 변경하여 클릭 가능한 것으로 보이게 함 */
        }
        .calendar .current-month {
            background-color: #eee;
        }
        .today {
            background-color: yellow; /* 오늘 날짜에 적용할 스타일 */
        }
        .highlighted {
            color: red; /* 특정 날짜에 적용할 글꼴 색상 */
            font-weight: bold; /* 특정 날짜에 적용할 글꼴 두껍게 */
        }
    </style>
    
</head>
<body>
	<div id="chatArea" style="height: 200px; overflow-y: scroll;"></div>
	<input type="text" id="name" name="name" placeholder="이름" />
	<br>
	<input type="text" id="messageInput" placeholder="메시지를 입력하세요." onKeyPress="handleKeyPress(event)">
	<button onclick="sendMessage()">보내기</button>
	
	   <div class="calendar">
        <h2>2024년 4월 달력</h2>
        <table>
            <thead>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
            </thead>
            <tbody>
                <tr class="current-month">
                    <%-- 2024년 4월 1일의 요일을 가져옵니다. --%>
                    <% java.util.Calendar calendar = java.util.Calendar.getInstance();
                       calendar.set(2024, 3, 1); // 년도는 0부터 시작하므로 2024년은 3
                       int firstDayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                       int maxDayOfMonth = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
                       int today = calendar.get(java.util.Calendar.DAY_OF_MONTH); // 오늘 날짜
                    %>
                    <%-- 빈 공간을 추가합니다. --%>
                    <% for (int i = 1; i < firstDayOfWeek; i++) { %>
                        <td></td>
                    <% } %>
                    <%-- 달의 일 수만큼 반복하여 달력을 만듭니다. --%>
                    <% for (int day = 1; day <= maxDayOfMonth; day++) { %>
                        <%-- 새로운 주가 시작될 때마다 행을 추가합니다. --%>
                        <% if ((day + firstDayOfWeek - 1) % 7 == 1) { %>
                            </tr><tr>
                        <% } %>
                        <%-- 특정 날짜에는 'highlighted' 클래스를 추가합니다. --%>
                        <td <%= day == today ? "class='today'" : "" %> <%= day == 13 ? "class='highlighted'" : "" %> onclick="showScheduleInput('<%= day %>')"><%= day %></td>
                    <% } %>
                    <%-- 다음 달로 넘어가는 날짜를 채웁니다. --%>
                    <% for (int i = 0; i < (7 - ((maxDayOfMonth + firstDayOfWeek - 1) % 7)); i++) { %>
                        <td></td>
                    <% } %>
                </tr>
            </tbody>
        </table>
    </div>
    
    
     <!-- 오늘의 날씨 정보 -->
    <div id="weatherInfo" style="margin-bottom: 20px;"></div>

<!--   간단한 날씨 어플 -->
  <div class="container">
        <h1>지금 날씨는</h1>
        <span class="weatherInfo"></span>
        <img class="weatherIcon">
    </div>
    <!--   간단한 날씨 어플 보여주고 끝~!!~@!! -->
    
    <script src="<%=root%>/static/js/app.js"></script>
    
     <!-- 스케줄 입력 모달 -->
    <div id="scheduleModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; border: 1px solid #ccc;">
        <h3 id="scheduleDate"></h3>
        <textarea id="scheduleInput" rows="4" cols="50"></textarea>
        <br>
        <button onclick="saveSchedule()">저장</button>
        <button onclick="hideScheduleInput()">취소</button>
    </div>
    
     <script>
        // 스케줄 입력 모달 표시
        function showScheduleInput(day) {
            var modal = document.getElementById("scheduleModal");
            var dateHeader = document.getElementById("scheduleDate");
            dateHeader.innerText = "일정 입력 - 2024년 4월 " + day + "일";
            modal.style.display = "block";
        }

        // 스케줄 저장
        function saveSchedule() {
            var input = document.getElementById("scheduleInput").value;
            // 여기에서 입력된 스케줄을 저장하는 로직을 추가할 수 있습니다.
            // 이 예제에서는 간단히 콘솔에 출력합니다.
            console.log("스케줄 저장: " + input);
            hideScheduleInput();
        }

        // 스케줄 입력 모달 닫기
        function hideScheduleInput() {
            var modal = document.getElementById("scheduleModal");
            modal.style.display = "none";
        }
    </script>
    
    
     <script>
        // 현재 날짜와 시간을 표시하는 함수
        function displayCurrentDateTime() {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var day = now.getDate();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            // 날짜와 시간을 형식에 맞게 조합하여 표시
            var dateTimeString = year + "년 " + month + "월 " + day + "일 " + hours + "시 " + minutes + "분 " + seconds + "초";
            document.getElementById("currentDateTime").innerText = "현재 시간: " + dateTimeString;
        }
        // 페이지 로드 시 현재 날짜와 시간을 표시
        window.onload = function() {
            displayCurrentDateTime();
        };
    </script>
    
     <script>
        // 날씨 정보 가져오기
        fetchWeather();

        function fetchWeather() {
            var apiKey = "a8ddf9f338ee8581c2e4adb2ed084df6";
            var apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=" + apiKey + "&units=metric";

            fetch(apiUrl)
                .then(response => response.json())
                .then(data => {
                    var weatherInfo = document.getElementById("weatherInfo");
                    var temperature = data.main.temp;
                    var description = data.weather[0].description;
                    weatherInfo.innerHTML = "오늘의 날씨: " + description + ", 기온: " + temperature + "°C";
                })
                .catch(error => {
                    console.error('날씨 정보를 가져오는 중 오류 발생:', error);
                    var weatherInfo = document.getElementById("weatherInfo");
                    weatherInfo.innerHTML = "날씨 정보를 가져오지 못했습니다.";
                });
        }
    </script>
    
</body>
</html>