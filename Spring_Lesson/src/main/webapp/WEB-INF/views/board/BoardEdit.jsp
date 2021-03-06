<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	이 페이지는 게시판에 글을 쓰는 페이지이다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board Edit Form</title>
<link rel="stylesheet" href="../css/w3.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style>
	.body {
		resize: none;
	}
	
	.mid {
		line-height: 0%;
	}
</style>
<script>
	<c:if test="${not empty LIST}">
		var lst = ${LIST};
		var ln = lst.length;
	</c:if>
	<c:if test="${empty LIST}">
		var ln = 0;
	</c:if>
	//alert('############ ln : ' + ln);
	
$(function(){
	/* $('#file1').change(function(event){
		var tmp = URL.createObjectURL(event.target.files[0]);
		$('#pic').attr('src', tmp);
	}); */
	
	$('.p1').change(function(){
		/* alert('########'); */
		if(ln < 4){
			ln = ln + 1;
			//alert(ln);
			$('.p1').append('<input type="file" class="w3-col w3-input w3-margin-top file" />');
		}
	});
	
	$('.fbtn').click(function(){
		var sname = $(this).attr('id');
		sname = sname.substring(1);
		$(location).attr('href', '../img/'+ sname);
	});
	
	$('#edit').click(function(){
		// 정규식 검사를 실행하세요...
		
		$('#frm').submit();
	});
	
	$('#reset').click(function(){
		$('#title').val('${DATA.title}');
		$('#body').val('${DATA.body}');
		$('.file').val('');
	});
});
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6">
		<h2 class="w3-pink w3-center w3-margin-top w3-margin-bottom w3-card-4 w3-round-large">H-Class 게시판 글쓰기</h2>
		<div class="w3-container w3-round-large w3-card-4">
			<form method="POST" action="./BoardEditProc.class" id="frm" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${DATA.no}" />
				<div class="w3-container w3-margin-top">
					<label for="title" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">제 목 : </h4></label>
					<input class="w3-col m10 w3-input w3-border" type="text" name="title" id="title" value="${DATA.title }"/>
				</div>
				<div class="w3-container w3-margin-top">
					<label for="id" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">I D : </h4></label>
					<div class="w3-col m10 w3-input w3-padding" type="text">${DATA.id }</div>
				</div>
				<c:if test="${not empty LIST}">
				<div class="w3-col w3-content">
					<div class="w3-col m2"><h4 class="w3-center w3-text-gray">이전파일 : </h4></div>
					
					<c:forEach var="VO" items="${LIST}">
					<div class="w3-col m3 w3-container">
						<div class="w3-col w3-button w3-small w3-lime w3-margin-top w3-margin-bottom fbtn" id="f${VO.sName}">${VO.oName}</div>
					</div>
					</c:forEach>
				</div>
				</c:if>
				<div class="w3-container w3-margin-top">
					<div class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">첨 부 : </h4></div>
					
					<div class="w3-col m10 p1">
						<c:if test="${not empty LIST}">
						<ol>
						<c:forEach var="VO" items="${LIST}">
							<li class="w3-col">
							<div class="w3-col flist" id="f${VO.sName}">
								<div class="w3-content w3-col m9"><h6>${VO.oName}</h6></div>
								<div class="w3-col m3 w3-button w3-lime fbtn">보기</div>
								<div class="w3-col m2 w3-button w3-red dfbtn">삭제</div>
							</div>
							</li>
						</c:forEach>
						</ol>
						</c:if>
						<input type="file" class="w3-col w3-input w3-margin-top file" />
					</div>
					
				</div>
				<div class="w3-container w3-margin-top w3-margin-bottom">
					<label for="body" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">본 문 : </h4></label>
					<textarea class="w3-col m10 w3-input w3-border body" cols="20" rows="8" name="body" id="body" >${DATA.reBody}</textarea>
				</div>
			</form>
		</div>
		<div class="w3-row w3-content w3-margin-top">
			<button class="w3-cell w3-half w3-button w3-blue w3-hover-aqua" id="reset">reset</button>
			<button class="w3-cell w3-half w3-button w3-red w3-hover-amber" id="edit">edit</button>
		</div>
	</div>
</body>
</html>