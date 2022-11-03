<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<style>
nav {
	background-color: rgb(19, 19, 29);
}

nav a {
	text-decoration: none;
	color: lightgray;
}

.fa-compass, .fa-user, .fa-house, .fa-comments {
	color:rgb(221, 221, 221);
	font-size:28px;
}

.iconfont {
	font-size:12px;
}

.center {
	display: flex;
	flex-wrap: wrap;
	margin-bottom : 10px;
}

.poster {
	width: 100px;
	height: 125px;
	border: 1px solid #dee2e6;
	margin-right: 5px;
}

.movieinfo-all {
	width : 225px;
	height : 120px;
}

.movieinfo-line {
	width : 225px;
	height : 25px;
	margin : 0px;
}

.movieinfo-contents {
	width : 130px;
	height : 125px;
	margin : 0px;
}

.movieinfo-contents-detail {
	font-size : 12px;
	text-align : justify;
	margin-right : 10px;
	height : 70px;
	text-overflow: ellipsis;
	overflow: hidden;
	display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
}

.movieinfo-contents-more {
	font-style: italic;
	text-decoration: underline;
}

.movieinfo-actors {
	width : 200px;
	height : 125px;
	margin : 0px;
	padding : 0px;
}

.movieinfo-actor {
	width : 50px;
	height : 100px;
	padding : 5px;
	margin-top : 10px;
}

.movieinfo-actor-name {
	text-align : center;
	font-size : 13px;
	margin-top : 10px;
}

.movieinfo-actor-more {
	text-align : center;
	font-size: 25px;
	padding-left : 2px;
}

.moreinfo-contents-button {
	text-align : center;
	margin : 0px;
	margin-top : 5px;
	padding : 0px;
	width : 120px;
	height : 20px;
	font-size : 14px;
	color : white;
	border : 0px solid gray;
	background-color: #007bff;
}

.menu {
	font-size : 18px;
	font-weight : bold;
	width: 225px;
	height: 25px;
	margin-bottom:5px;
}

.submenu {
	font-size : 13px;
	font-weight : bold;
	width : 60px;
	height : 25px;
}

.submenu-content {
	font-size : 13px;
	width : 165px;
	text-align : right;
}

.write-review {
	font-size : 12px;
	width : 105px;
	text-align : right;
	margin-top : 4px;
}

.like-unlike-panel {
	width : 120px;
	text-align : right;
	padding-right : 5px;
}

.review-id {
	width : 203px;
	margin : 0px;
	padding : 0px;
	font-size : 13px;
	font-weight : bold;
}

.review-content {
	font-size : 11px;
	width: 260px;
}

.comment-panel {
	font-size : 11px;
	width : 60px;
	border : 1px solid gray;
	height : 20px;
}

.dialog-margin-top {
	height : 290px;
}

.dialog-menu {
	font-size : 18px;
	font-weight : bold;
}

#circle {
	width: 40px;
	height: 40px;
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	border : 1px solid gray;
}

.rectangle {
	width : 330px;
	height : 50px;
	border : 1px solid gray;
	padding-left : 5px;
	margin-bottom : 5px;
}

.like-button {
	border : 0px solid gray;
	background : white;
	font-size : 12px;
	padding : 0px;
	background-color : rgba(0, 0, 0, 0);
}

.comment-like {
	font-size : 11px;
}

#dialog {
	height : 150px;
	background-color : rgb(237, 237, 237);
	border-radius: 5px;
}

.input-text {
	width : 100%;
	height : 60px;
	margin-top : 5px;
	border-radius: 5px;
}

.dialog-button {
	width : 48%;
	border : 0px solid gray;
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- HEADER !-->
	<form class='mt-3'>
		 <div class='col form-group d-flex justify-content-center align-items-center'>
			<input  class='form-control w-75' type='text' placeholder='검색'/>
			<button type='button' class=" btn ml-3 border" onclick='location.href="../movie/01.html"'>
			   <i class='fa-solid fa-magnifying-glass'></i>
			   <span class='ml-2 d-none d-md-inline'>검색:</sapn>
			</button>
		 </div>
	  </form>
	<!-- MAIN CONTENT !-->
	<div class="container"><hr></div>
	<div style="overflow:scroll; height:464px; overflow-x:hidden;">
		<div class="container center">
			<div class="poster">영화포스터</div>
			<div class="movieinfo">
				<div class="menu">${review.movie.movieName }</div>
				<div class="row movieinfo-line">
					<div class="submenu" style="width:30px;">개요</div>
					<div class="submenu-content" style="width:195px;" >${review.summaryString }</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">상영시간</div>
					<div class="submenu-content">${review.movie.movieRunningtime }분</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">개봉</div>
					<div class="submenu-content">${review.movie.movieReleasedate }</div>
				</div>
				<div class="row movieinfo-line">
					<div class="submenu">누적 관객</div>
					<div class="submenu-content">${review.audienceString }명</div>
				</div>
			</div>
		</div>
		<!-- MOVIE INFO CONTENTS AND ACTORS !-->
		<div class="container center">
			<div class="movieinfo-contents">
				<div class="menu">줄거리</div>
				<div id="movieStory" class="movieinfo-contents-detail ">${review.movie.movieStory }</div>
				<button class="moreinfo-contents-button" onclick="createDetailContent()" type="button" data-toggle="modal" data-target='#dialogModal'>자세히</button>
			</div>
			<div class="movieinfo-actors">
				<div class="menu">출연진</div>
				<div class="container row movieinfo-actors">
					<div class="movieinfo-actor">
						<div id="circle" style="font-size:8px; padding-top:5px; text-align:center">감독이미지</div>
						<div class="movieinfo-actor-name">감독</div>
					</div>
					<div class="movieinfo-actor">
						<div id="circle" style="font-size:8px; padding-top:5px; text-align:center">주연이미지</div>
						<div class="movieinfo-actor-name">주연</div>
					</div>
					<div class="movieinfo-actor">
						<div id="circle" style="font-size:8px; padding-top:5px; text-align:center">주연이미지</div>
						<div class="movieinfo-actor-name">주연</div>
					</div>
					<div class="movieinfo-actor">
						<div id="circle" class="movieinfo-actor-more"><span>&#10097;&#10097;</span></div>
						<div class="movieinfo-actor-name movieinfo-contents-more" style="color:#007bff;"><a href='#'>더보기</a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- REVIEW AND REVIEW COMMENTS !-->
		<div class="container center" style="margin-bottom:0px;">
			<div class="menu">
				사용자 평 &nbsp;
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star" style="font-size:14px; color:#FF7F00"></i>
				<i class="fa fa-star-half-full" style="font-size:14px; color:#FF7F00""></i>
				<!-- <i class="fa fa-star-o" style="font-size:14px"></i> !-->
				<span style="font-size:14px; color:#FF7F00"">4.7</span>
			</div>
			<div class="write-review">
				<button class="btn-secondary" type="button" data-toggle="modal" data-target='#dialogModal' id="writereviewBtn" onclick="createReviewDialog()" style="border:1px solid gray">평 작성하기</button></div>
		</div>
		<div class="container center" id="reviewContainer">
			<div class="rectangle" id="review_10" isCommentOpened="false">
				<div class="row container" style="margin:0px; padding:0px;">
					<div class="review-id">즐거운 무지(mooji***)</div>
					<div class="like-unlike-panel">
						<button class="like-button"><i class="fa">&#xf087;</i></button>
						<span class="like-button">128&nbsp&nbsp</span>
						<button class="like-button"><span class="fa fa-thumbs-down"></span></button>
						<span class="like-button">Unlike</span>
						<button class="like-button" type="button" data-toggle="modal" data-target='#dialogModal' onclick="reportReview(10)"><i class="fa-solid fa-triangle-exclamation"></i></button>
					</div>
				</div>
				<div class="row container" style="margin:0px; padding:0px;">
					<span class="review-content">끝도 없이 달려 절망의 땅에서 찾는 구원</span>
					<button class="comment-panel btn-secondary">댓글 22</button>
				</div>
			</div>
			<div class="rectangle" id="review_11" isCommentOpened="false">
				<div class="row container" style="margin:0px; padding:0px;">
					<div class="review-id">개빡친 제이지 (jage***)</div>
					<div class="like-unlike-panel">
						<button class="like-button"><i class="fa">&#xf087;</i></button>
						<span class="like-button">78&nbsp&nbsp</span>
						<button class="like-button"><span class="fa fa-thumbs-down"></span></button>
						<span class="like-button">Unlike</span>
						<button class="like-button" type="button" data-toggle="modal" data-target='#dialogModal' onclick="reportReview(11)"><i class="fa-solid fa-triangle-exclamation"></i></button>
					</div>
				</div>
				<div class="row container" style="margin:0px; padding:0px;">
					<span class="review-content">언니 돔황챠!!</span>
					<button class="comment-panel btn-secondary">댓글 9</button>
				</div>
			</div>
		</div>
	</div>
	<!-- NAVGATION BAR !-->
	<div id='navBar' class='container-fulid'>
		<nav class='row fixed-bottom p-1'>
			<div class='col m-2 text-center'>
				<a id='goHome' href='../main.html' class='ml-1'>
					<i class='fa-solid fa-house fa-xl'></i>
					<span class='iconfont'>&nbsp;홈</span>
				</a>
			</div>
			<div class='col m-2 text-center'>
				<a id='blind' href='../community/01.html' class='ml-1'>
					<i class='fa-regular fa-comments fa-xl'></i>
					<span class='iconfont'>커뮤니티</span>
				</a>
			</div>
			<div class='col m-2 text-center'>
				<a id='chat' href='../movie/01.html' class='ml-1'>
					<i class='fa-solid fa-compass fa-xl'></i>
					<span class='iconfont'>&nbsp;&nbsp;탐색</span>
				</a>
			</div>
			<div class='col m-2 text-center'>
				<a id='user' href='../user/01.html' class='ml-1'>
					<i class='fa-regular fa-user fa-xl'></i>
					<span class='iconfont'>&nbsp;&nbsp;&nbsp;로그인</span>
				</a>
			</div>
		</nav>
	</div>
	<div class='modal fade' tabindex='-1' id='dialogModal'>
		<div class='modal-dialog modal-lg'>
			<div id="dialogUpperMargin" style="height:290px"></div>
			<div class="modal-content">
				<div id='dialog' style="padding:15px; background-color: white;"></div>
			</div>
		</div>
	</div>
<script>
	
	
	function createDetailContent() {
		var dialog = document.querySelector("#dialog");
		
		createDialogTopMargin(dialog, 0x01);
		createTitle(dialog, "상세 줄거리");
		createBody(dialog, 0x111);
		createButtons(dialog, 0x1000);
	}
	
	function createDialogTopMargin(dialog, code) {
		if((code & 0x01) == 0x01) {
			document.querySelector("#dialogUpperMargin").style.setProperty('height', '150px');
			dialog.style.setProperty('height', '300px');
		}
	}
	
	function createTitle(dialog, title) {
		var titleDiv = document.createElement('div');
		titleDiv.innerHTML = title;
		titleDiv.classList.add('menu');
		dialog.appendChild(titleDiv);
	}
	
	function createBody(dialog, code) {
		if((code & 0x10) == 0x10) {
			createTextBody(dialog, code);
		}
	}
	
	function createTextBody(dialog, code) {
		var textDiv = document.createElement('div');
		
		if((code & 0x100) == 0x100) {
			textDiv.innerHTML = document.querySelector('#movieStory').innerHTML;
			textDiv.style.setProperty('font-size', '12px');
			textDiv.style.setProperty('height', '200px');
			textDiv.style.setProperty('overflow', 'scroll');
		}
		
		dialog.appendChild(textDiv);
	}
	
	function createButtons(dialog, code) {
		var buttonDiv = document.createElement('div');
		buttonDiv.style.setProperty('height', '50px');
		buttonDiv.style.setProperty('padding-top', '10px');
		buttonDiv.style.setProperty('padding-bottom', '10px');
		
		if((code & 0x1000) == 0x1000) {
			createSingleButton(dialog, buttonDiv);
		}
		
		dialog.appendChild(buttonDiv);
	}
	
	function createSingleButton(dialog, buttonDiv) {
		var button = document.createElement('button');
		button.style.setProperty('height', '100%');
		button.style.setProperty('width', '100%');
		button.style.setProperty('border', '0px solid black');
		button.style.setProperty('background-color', '#007bff');
		button.style.setProperty('color', 'white');
		button.innerHTML = '확인';
		button.addEventListener('click', clearDialog);
		buttonDiv.appendChild(button);
	}
	
	function clearDialog() {
		dialog.innerHTML = '';
		$('#dialogModal').modal('hide');
	}
	
	
</script>
</body>
</html>