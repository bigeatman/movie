<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>커뮤니티 글쓰기</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function checkLogin() {
<%
	if(session.getAttribute("user") != null) {
%>
	$('#user').attr('href', '../user/mypage')
	$('#loginSpan').text('프로필')
<%
	}
%>
}
$(checkLogin)

$(() => {
	$('#writePostBtn').click(() => {
		if(isVal($('#title')) && isVal($('#contents'))) {
			$.ajax({
				url: 'add',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					userId: '${userId}',
					title: $('#title').val(),
					content: $('#content').val(),
					date: $('#communityDate').val())
				})
			}).done(function() {
				location.href='/list'
			})
		}
	})
})

</script>
<style>
nav {
   background-color: rgb(19, 19, 29);
}

.fa-compass, .fa-user, .fa-house, .fa-comments {
   color:rgb(221, 221, 221);
   font-size:28px;
}

.iconfont {
   font-size: 12px;
   margin-left: 5px;
}

nav a {
   text-decoration: none;
   color: lightgray;
}


.fa-tv {
	text-decoration: none;
	color: black;
}

label {
    font-size:12px;
    width: 1px;
}



</style>
</head>

<div class="container text-center">
    <h2><strong><br>커뮤니티</strong></h2>
    <!-- <hr style="border:1px color=rgba(3, 2, 2, 0);" width="90%"> -->
    <hr style="border: double 1px black;">

    <h3><em><u>영화평</u></em></h3>
    <div style="border:1px solid; padding:10px;">
    <form method="post">
      <div class="form-group">

        <input type="text" class="form-control" id="title"
         placeholder="제목 (2자 이상 30자 이하)" name="title"
         minlength="2" maxlength="30" required="required"
         pattern=".{2,30}">
         <hr style="border: double 1px grey;">
      </div>

   <div class="form-group">
     <label for="content"></label>
     <textarea class="form-control" rows="8" id="content"
      name="content" placeholder="글쓰기 (2자 이상 1000자 이하)"
      minlength="2" maxlength="1000" required="required"
      pattern=".{2,1000}"></textarea>

   </div>

   <div class="rows">
    <label for="input-file"></label>
      <input type="file" id="input-file"/></label>
      <div class='row mt-3 p-3 border-top'>
        <button id='writePostBtn' type='button' class='btn btn-success border btn-block' onclick='location.href="list"'>추가</button>
      </div>
  </div>

<!-- 네비게이션 바 -->
<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='..' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='list' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='#' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='../user/login' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>로그인</span>
               	</a>
           	</div>
      	</nav>
   	</div>
</form>
</div>
</div>
</body>
</html></html>

<!-- 하단내비바에 안깔리게 하려고 넣어둔 거 -->
<footer class='container-fulid border mt-5 p-3 '>
  <div class='row m-3'>
      <div class='col-sm-3 border d-flex justify-content-center align-items-center'>
          <div></div>
      </div>
  </div>
</footer>   