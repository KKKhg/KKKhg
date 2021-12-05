function countDownTimer(){
	var target = +new Date()+2000;
	var timer=null;
	var result; 		/* timeout 여부 */
	
	
	function count(){
		var now=new Date();
		var remain=(target-now);
		console.log(remain);
		
		var sec=Math.floor(remain/1000);
		var millisec=Math.floor(remain%1000/10);
		if (millisec<10){ millisec="0"+millisec; }
		
		document.getElementById("timer").innerHTML=sec+" : ";
		document.getElementById("timer").innerHTML+= millisec;
		
		if (remain <= 0){
			clearInterval(timer);
			document.getElementById("timer").innerHTML= "0 : 00";
			result=0;		/* timeout 여부 */
		
		}
		
	}
	timer=setInterval(count,10);
}