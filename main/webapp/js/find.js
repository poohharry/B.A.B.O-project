$(document).ready(function (){
$('#main').show(); //처음 페이지가 로딩되면 아이디 찾기 먼저 나옴
$('#main2').hide(); //처음 페이지가 로딩되면 비밀번호 찾기 페이지는 숨겨짐
$('.hr-id').show();
$('.hr-pw').hide();
console.log($('#findpw'));
console.log($("#main").css("display"));
});

$('#findpw').click(function (){
	console.log($('#findpw'));
	console.log($("#main").css("display"));
if($("#main").css("display")=="block"){
	$("#main").css("display", "none");
	$("#main2").css("display","block");	
	$(".hr-id").css("display","none");
	$(".hr-pw").css("display","block");
}else{
	return false;
}

});

$('#findid').click(function (){
if($("#main").css("display")=="none"){
	$('#main').css('display','block'); 
	$('#main2').css('display','none');  
	$('.hr-id').css('display','block'); 
	$('.hr-pw').css('display','none'); 
}else{
	return false;
}	
});
