<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 게임</title>
<link rel="stylesheet" type="text/css" href="/guguDan/css/shape.css">
<script>
	var answer=document.getElementById("answer");
	var action=0;		/* timer 실행여부 0=미실행,1=실행중*/
	var actionKey=0;    /* timer 실행여부에 따라 리셋해줌. */
	var n1;
	var n2;
	var inputN;
	var correct=0;		/* 일단 콘솔출력용 */
	
	function countDownTimer(){
		var target = +new Date()+1500;
		var timer=null;
		
		
		function count(){
			action=1;
			var now=new Date();
			var remain=(target-now);
			console.log(remain);
			
			var sec=Math.floor(remain/1000);
			var millisec=Math.floor(remain%1000/10);
			if (millisec<10){ millisec="0"+millisec; }
			
			document.getElementById("timer").innerHTML=sec+" : ";
			document.getElementById("timer").innerHTML+= millisec;
			
			if (remain <= 0 || actionKey==1){
				if (remain<=0){
					document.getElementById("message").innerHTML="~~ 시 간 초 과 ~~ ";
					document.getElementById("answer").disabled=true;
				}
				
				clearInterval(timer);
				document.getElementById("timer").innerHTML= "0 : 00";
				actionKey=0;
				action=0;
				console.log(inputN);
				console.log(correct);
			}
		}//count
		
		timer=setInterval(count,10);
	}//countDownTimer
	
	var randomGame = {}; 
		
		randomGame.gameStart=function() {
		
			n1 = Math.floor(Math.random()*9+1);
			n2 = Math.floor(Math.random()*9+1);
			
			document.getElementById("n1").innerHTML = n1;
			document.getElementById("x").innerHTML = "x";
			document.getElementById("n2").innerHTML = n2;
			document.getElementById("eq").innerHTML = "=";
		}//gameStart
		
		randomGame.check=function(){
			
			
		}//check
	
	function start() {
		document.getElementById("answer").disabled=false;
		answerFocus();
		randomGame.gameStart();
		if(action==1) {
			actionKey=1;
		}
		countDownTimer();
	}//start

	function input() {
		inputN=document.getElementById("answer").value;
		if (n1*n2==inputN) {
			correct=1;
			document.getElementById("message").innerHTML="**  정 답  **";
			start();
		}
		else {
		correct=0;
		actionKey=1;
		document.getElementById("message").innerHTML="~~ 오 답 ~~ ";
		document.getElementById("answer").disabled=true;
		
		}
		document.getElementById("answer").value=null;
	}
		
	function enterKey(){
		if(window.event.keyCode==13) input(); 
	}
	
	function answerFocus() {
		document.getElementById("answer").focus();
	}
	
	
	
	
	
	
/* 
	var gameButton = document.getElementById("gameButton");
	if (gameButton.addEventListener("click", function() {
		if (n1*n2==inputN) return true;
		else return false;
	})) score = 10;
	else socre=0; */
		
		
</script>


<style type="text/css">

/* 메인 */
.main{height: 40%; margin: 25px auto;   }

#timer{font-size: 40px; font-weight: 800;}

.startbutton {width: 100px; height: 30px; background-color: red; color: yellow; 
			 border-radius: 10%; font-size: 20px; font-weight: 300;}

.startbutton:hover { cursor: pointer; border: 2px solid yellow;}

.startbutton:active {border-width: 4px;}

#n1,#n2,#x,#eq { font-size: 50px; font-weight: 300; margin-right: 20px;}

#answer {width: 100px; height: 50px; outline-color: lightgray; outline-width: 1px; font-size: 40px;}

#answer:focus { outline-color: darkred; outline-width: 3px;}

#message {font-size: 30px; font-weight: 1000; color: red;}

/* 스코어보드 */




</style>

</head>
<body>
<div class="bodycon">
	<div class="cen content">
	
	
		<!-- 제목 -->
		<div class="subject"><h1>구구단 게임</h1></div>	
		<!-- 네비 -->
		<div class="nav right">
			<button class="nav-button now" type="button" onclick="">메인</button>
			<button class="nav-button" type="button" onclick="">내정보</button>
			<button class="nav-button" type="button" onclick="">로그아웃</button>
		</div>
		
		<!-- 메인 -->
		<div class="main">
			<span id="message">START 를 눌러 시작하세요.</span><br>
			<span id="timer">0 : 00</span><br>
			<button class="startbutton" onclick="start()">START</button>
			
			<div class="game">
				<span id="n1">0</span> <span id="x">x</span> <span id="n2">0</span> <span id="eq">=</span> 
				<input id="answer" type="text" autofocus="autofocus" onkeydown="enterKey()">
				<input id="hidden" type="hidden">
			</div>
			
		
		
		</div>
		
		<!-- 스코어보드 -->
		<div class="scoreboard">		
		
		
		</div>
		
		
	</div>
</div>







</body>
</html>