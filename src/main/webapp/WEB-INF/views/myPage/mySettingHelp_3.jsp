<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<%@include file="../header.jsp"%>
</head>

<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">

		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">

			<!-- MypageSidebar -->
			<div class="row">
				<div class="col-3 p-0">
					<%@include file="mySettingSidebar.jsp"%>
				</div>


				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-0" style="background-color: white;">

						<div class="col-12 p-0 border border-black"
							style="float: none; margin: 0 auto;">
							<div class="row p-0">
								<div class="col-1 px-0 py-2" style="flex-direction: column;">
								</div>
								<div class="col-11 px-0 py-2" style="flex-direction: column;">도움말</div>
							</div>
						</div>

						<!-- 질문 카테고리 -->
						<div
							class="row p-3 border border-black d-flex justify-content-center align-items-center"
							style="float: none; margin: 0 auto">
							
							
							<div class="row p-0">
							<ul class="nav nav-pills flex-row mb-auto">
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/1" class="nav-link link-dark" > 
							<use xlink:href="#optionhelp_c1"></use>자주 묻는 질문
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/2" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c2"></use>프로필
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center"
							style="background-color:#5bb9eb;">
							<a href="/mySettingHelp/3" class="nav-link " style="color:white"> 
							<use xlink:href="#optionhelp_c3"></use>회원정보/인증
							</a></li>
							
							</ul>
							</div>
							
						<div class="row p-0">
						<ul class="nav nav-pills flex-row mb-auto">
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/4" class="nav-link link-dark" > 
							<use xlink:href="#optionhelp_c4"></use> ship설정
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/5" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c5"></use> ship멤버
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/6" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c6"></use> 콘텐츠
							</a></li>
							
						</ul>
						</div>
						</div>
						<!-- 카테고리 끝 -->
					</div>
					<br>



					<div class="col-10 p-0" style="background-color: white;">
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto; background-color: #d9dbdd">
							회원정보/인증</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">휴먼
							계정이라는 메일을 받았어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">계정을
							삭제(탈퇴)하고 싶어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">전화번호
							외에 다른 정보를 어떻게 등록하나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">로그아웃은
							어떻게 하나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">비밀번호가
							기억나지 않아요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">인증번호가
							오지 않아요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">도용된
							ship계정을 삭제 하고 싶어요.</div>



					</div>
				</main>
			</div>
		</div>
	</div>



</body>



</html>