$(document).ready(function (){
$('#main').show(); //처음 페이지가 로딩되면 아이디 찾기 먼저 나옴
$('#main2').hide(); //처음 페이지가 로딩되면 비밀번호 찾기 페이지는 숨겨짐
$('#findpw').css("border-bottom","1px solid #b2b2b2");
$('#findpw').css("border-left","1px solid #b2b2b2");
});

$('#findpw').click(function (){
if($("#main").css("display")=="block"){
	$("#main").css("display", "none");
	$("#main2").css("display","block");	
	$('#findid').css("border-bottom","1px solid #b2b2b2");
	$('#findid').css("border-right","1px solid #b2b2b2");
	$('#findpw').css("border","none");

}else{
	return false;
}

});

$('#findid').click(function (){
if($("#main").css("display")=="none"){
	$('#main').css('display','block'); 
	$('#main2').css('display','none'); 
	$('#findpw').css("border-bottom","1px solid #b2b2b2");
	$('#findpw').css("border-left","1px solid #b2b2b2"); 
	$('#findid').css("border","none");
}else{
	return false;
}	
});
