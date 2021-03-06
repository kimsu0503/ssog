<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
.btn-custom {
  background-color: hsl(0, 0%, 16%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#5b5b5b", endColorstr="#282828");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#5b5b5b), to(#282828));
  background-image: -moz-linear-gradient(top, #5b5b5b, #282828);
  background-image: -ms-linear-gradient(top, #5b5b5b, #282828);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5b5b5b), color-stop(100%, #282828));
  background-image: -webkit-linear-gradient(top, #5b5b5b, #282828);
  background-image: -o-linear-gradient(top, #5b5b5b, #282828);
  background-image: linear-gradient(#5b5b5b, #282828);
  border-color: #282828 #282828 hsl(0, 0%, 11%);
  color: #fff !important;
  border-radius: 0px;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33);
  -webkit-font-smoothing: antialiased;
}
.btn-custom2 {
  background-color: hsl(0, 0%, 95%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#10b10b10b", endColorstr="#f2f2f2");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#10b10b10b), to(#f2f2f2));
  background-image: -moz-linear-gradient(top, #10b10b10b, #f2f2f2);
  background-image: -ms-linear-gradient(top, #10b10b10b, #f2f2f2);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #10b10b10b), color-stop(100%, #f2f2f2));
  background-image: -webkit-linear-gradient(top, #10b10b10b, #f2f2f2);
  background-image: -o-linear-gradient(top, #10b10b10b, #f2f2f2);
  background-image: linear-gradient(#10b10b10b, #f2f2f2);
  border-color: #f2f2f2 #f2f2f2 hsl(0, 0%, 92.5%);
  color: #333 !important;
  border-radius: 0px;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.16);
  -webkit-font-smoothing: antialiased;
}
</style>
<div style="padding-top: 20px;">
	<h4 style="font-size: 17px; text-align: left;">
		<span class="glyphicon glyphicon-info-sign"
			style="padding-right: 10px;"></span><b style="padding-right: 10px;">비밀번호
			수정</b><small>개인정보 보호를 위하여 비밀번호는 주기적으로 변경하여 주시기 바랍니다.</small>
	</h4>
</div>
<div class="row">
	<div class="col-sm-12" align="left">
		<hr style="margin: 8px; border-top: 3px solid black;">
		<b
			style="font-size: 12px; padding-right: 35px; padding-left: 10px; color: #262626;">기존
			비밀번호</b> <input name="pass" id="pass"/> <small
			style="font-size: 12px; color: #8c8c8c">* 회원님의 기존 비밀번호를 입력해
			주십시오</small>
		<hr style="margin: 8px;" />
		<b
			style="font-size: 12px; padding-right: 47px; padding-left: 10px; color: #262626;">새
			비밀번호</b> <input type="password" name="newpass" id="newpass"/> <small
			style="font-size: 12px; color: #8c8c8c">* 영문 또는 숫자 조합(8자이상)</small>
		<hr style="margin: 8px;" />
		<b
			style="font-size: 12px; padding-right: 20px; padding-left: 10px; color: #62626;">새
			비밀번호 확인</b> <input type="password" name="newpass2"0 id="newpass2"/> <small
			style="font-size: 12px; color: #8c8c8c">* 새 비밀번호를 다시 입력하십시오.</small>
		<hr style="margin: 8px;" />
		<div align="center" style="padding-top: 10px;">
		<button type="submit" style="font-size: 12px;" id="revise" class="btn btn-custom">비밀번호 변경하기</button>
		<button type="button"
			style="font-size: 12px; padding-left: 45px; padding-right: 45px;"class="btn btn-custom2">취소</button>
			</div>
			</div>
</div>
<script>
$("#revise").on("click",function () {
	var passrule = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/;
	if($("#newpass").val()==$("#newpass2").val()){
	if($("#newpass").val().match(passrule)){
	
	$.ajax({
		url:"/member/myinfo/userpass_rst.j",
		method : "post",
		data : {
			"pass" : $("#pass").val(),
			"newpass" : $("#newpass").val()
		}
	}).done(function (result) {
		if(result==true){
			window.alert("비밀번호가 변경되었습니다.다시로그인해주시기 바랍니다.");
			location.href = "/member/logout.j";
		}else{
			window.alert("현재비밀번호가 맞지않습니다.");
			location.href = "/member/myinfo/userpass.j";
		}
	});
	}else{
		window.alert("영문 또는 숫자 조합(8자이상)");
	}
	}else{
		window.alert("비밀번호가 일치하지 않습니다.");		
	}
});

</script>
