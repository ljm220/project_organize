<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<!-- 아이콘 css(회원정보 아이콘) --> 
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<style>
/* .reply-read-profile a {
    background-color: #B3B3B3;
    border: 1px solid rgba(0,0,0,.05);
    border-radius: 50%;
    text-decoration: none;
    width: 45px;
    height: 45px;
   cursor: pointer;
} */
</style>

<head>

<%@include file="../header.jsp"%>

</head>

<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">

		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">

			<div class="row">
				<div class="col-3 p-0">

					<!-- MypageSidebar -->
					<%@include file="myPageSidebar.jsp"%>
					
				</div>

				<!-- 내 정보 메인 시작  -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-3" style="background-color: white;">

						<!-- 내 정보 상단 문구 -->
						<div class="card-body p-4 pb-2 border-bottom"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight:800;">내 정보</h5>
						</div>


						<div class="row p-3 pt-0 d-flex flex-row justify-content-between align-items-center text-secondary"
							style="float: none; margin: 0 auto; width: 100%; color: #333;">
							<div class="row-12">

																	
								<!-- 1. 개인정보 -->
								<div class="row my-3 border-bottom">
									<div class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">개인정보</span>
										<div class="col-10 d-flex flex-column justify-content-between">
										
											<!-- 이름 -->
											<div class="userModifyDiv m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">이름</span>
												<input class="originData col-6 p-0" readonly="readonly"/>

												<button onclick="modifyIntputsBtn(this)" class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기
												</button>
											</div>
											
											<!-- 닉네임 -->
											<div class="userModifyDiv m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">닉네임</span>
												<input class="originData col-6 p-0" readonly="readonly"/>

												<button onclick="modifyIntputsBtn(this)" class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기
												</button>
											</div>
											
											<!-- 생년월일 -->
											<div class="m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 ms-2 p-0">생년월일</span>
												<div class="col-6 p-0">
													<div class="login-birth-div justify-content-around">
														<input class="col-sm-5" size="20" type="text" placeholder="년(4자) " maxlength="4" onblur=""> 
														<select class="col-sm-3" id="" name="usrMonth" onchange="">
															<option value="00">월</option>
															<option value="01">1월</option>
															<option value="02">2월</option>
															<option value="03">3월</option>
															<option value="04">4월</option>
															<option value="05">5월</option>
															<option value="06">6월</option>
															<option value="07">7월</option>
															<option value="08">8월</option>
															<option value="09">9월</option>
															<option value="10">10월</option>
															<option value="11">11월</option>
															<option value="12">12월</option>
														</select> 
														<input readonly="readonly" class="col-sm-3 m-0" type="text" placeholder="일"maxlength="4" onblur="">
													</div>
												</div>
												<button onclick="modifyIntputsBtn(this)" class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
											
											<!-- 성별 -->
											<div class="m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">성별</span>
												<div class="col-6 p-0">
													<select disabled="" class="login-input text-end" onchange="">
														<option value="0">성별</option>
														<option value="female">여자</option>
														<option value="male">남자</option>
													</select>
												</div>

												<button class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
										</div>
									</div>
								</div>

								<!-- 2.로그인 계정 -->
								<div class="row my-3 border-bottom">

									<div class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">로그인 계정</span>

										<div class="col-10 d-flex flex-column justify-content-between">										
											<!-- 이메일 -->
											<div class="userModifyDiv m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2">이메일</span> 
												<input readonly="readonly" class="originData col-6" type="text" />
												<button onclick="modifyIntputsBtn(this)" class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
											<!-- 휴대폰 번호 -->
											<div class="userModifyDiv m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">휴대폰 번호</span> 
												<input readonly="readonly" class="originData col-6" type="text" />
												<button onclick="modifyIntputsBtn(this)" class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
											<!-- 현재 비밀번호 -->
											<div class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">현재 비밀번호</span> 
												<input class="col-6 fs-8" type="password"/>
												<button class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">확인</button>
											</div>
											
											<!-- 비밀번호 -->
											<div class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2">새 비밀번호</span> 
												<input class="col-6 fs-8" type="password"/>
												<div class="ms-2 col-3 p-2 m-1"
													style="width: 80px;"></div>
											</div>
											<!-- 비밀번호 확인-->
											<div class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">비밀번호 확인</span> 
												<input class="col-6" type="password" />
												<button class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
										</div>
									</div>
								</div>


								<!-- 3.관심 지역 -->
								<div class="row my-3 border-bottom">

									<div
										class="pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">관심 지역</span>
										<div class="col-10 my-3 d-flex justify-content-between align-items-center">

											<!-- 시/도 -->
											<div class="col-3 p-0">
												<select class="login-input text-end" name="cityNum" onchange="getTowns(this)">
													<option value="0">시/도</option>
													<c:forEach var="item" items="${ cities }">
														<option value="${ item.cityNum }">${ item.cityName }</option>
													</c:forEach>
												</select>
											</div>

											<!-- 군/구 -->
											<div class="col-3 p-0">
												<select class="login-input text-end" id="" name="townNum">
													<option value="0">군/구</option>
												</select>
											</div>

											<!-- 동 -->
											<div class="col-3 p-0">
												<select class="login-input text-end" id="" name="villageNum">
													<option value="0">읍/면/동</option>
												</select>
											</div>
											<button class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
												style="font-size: 13px; width: 80px;">수정하기
											</button>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
	
				</main>
			</div>
		</div>
	</div>



<script>



function modifyIntputsBtn(el){
	
	//이름, 이메일, 휴대폰 번호의 수정하기 버튼을 누르면 readOnly 해제로 수정 가능 (일단 input만)
 	let closestParenet = el.closest("div .userModifyDiv");
 	let originData = closestParenet.querySelector(".originData");
 	
 	if(originData != null){
		
		originData.readOnly = "";	
 	}
		
//생년월일

//성별

//관심지역
}

$(document).ready(function(){
		

});


</script>

</body>
				  				
</html>