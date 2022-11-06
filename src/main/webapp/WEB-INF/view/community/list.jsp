<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>커뮤니티 목록</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
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

function CommunityList() {
   
   $.ajax({
      method: 'post',
      url: "<%=request.getContextPath() %>/community/list",
      success:communityList => {
  	 	  communities = []
   
      if(communities.length) {
         const communityArr = []
   
         communityList.forEach((community) => {
            communities.push(
               '<div>' + `\${community.communityNum}` + '<div>' +
               '<div>' + `\${community.communityTitle}` + '</div>' + 
                    '<td>1</td> <td>2</td> <td>3</td> </tr>'     
            );
            console.log(communityArr)
         })
   
         $('#communities').empty()
         $('#communities').append(communityArr.join(''))
      } else {
         $('#communities').append('<tr><td colspan=6 class=text-center>등록된 게시글이 없습니다.</td></tr>')
      }
   })
}
$(CommunityList)
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
	font-size:12px;
	margin-left: 5px;
}

nav a {
	text-decoration: none;
	color: white;
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
<div class="container">
    <h2><strong><br><center>커뮤니티</center></strong></h2>

    <hr style="border: double 1px black;">
    <h3><em><u><center>영화평</center></u></em></h3>

<table class='table table-boarded'>
	<thead><tr><th></th><th></th></tr></thead>
	<tbody id='communities'>
	</tbody>
</table>

<!-- <div class='justify-content-center'>
        <ul class='list-unstyled border-top'>
            <li class='border-bottom pt-3 pb-3'>
                <a href="content" id="communities" class='row justify-content-center align-items-center'>
                    <span class='col-1'></span>
                    <span class='col-8'></span>
                    <span class='col-3'></span>
                </a>
            </li>
            <li class='border-bottom pt-3 pb-3'>
                <a href="content" id="communityList" class='row justify-content-center align-items-center'>
                    <span class='col-1'></span>
                    <span class='col-8'></span>
                    <span class='col-3'></span>
                </a>
            </li>
            <li class='border-bottom pt-3 pb-3'>
                <a href="content" class='row justify-content-center align-items-center'>
                    <span class='col-1'></span>
                    <span class='col-8'></span>
                    <span class='col-3'></span>
                </a>
            <li class='border-bottom pt-3 pb-3'>
                    <a href="content" class='row justify-content-center align-items-center'>
                        <span class='col-1'></span>
                        <span class='col-8'></span>
                        <span class='col-3'></span>
                </a>
            <li class='border-bottom pt-3 pb-3'>
                    <a href="content" class='row justify-content-center align-items-center'>
                        <span class='col-1'></span>
                        <span class='col-8'></span>
                        <span class='col-3'></span>
                </a>
            <li class='border-bottom pt-3 pb-3'>
                    <a href="content" class='row justify-content-center align-items-center'>
                        <span class='col-1'></span>
                        <span class='col-8'></span>
                        <span class='col-3'></span>
                </a>
            </li>    
        </ul>
    </div> -->
        
    <button type="submit" onclick='location.href="write"' style="width: 245pt; HEIGHT: 25pt" class="btn btn-primary">글쓰기</button>

<!-- < 1,2,3,4,5 > -->
    <div class='row mt-5 justify-content-center'>
        <span class='col'>
            <i class="fa-solid fa-angle-left"></i>
        </span>
        <span class='col'>1</span>
        <span class='col'>2</span>
        <span class='col'>3</span>
        <span class='col'>4</span>
        <span class='col'>5</span>
        <span class='col'>
            <i class="fa-solid fa-angle-right"></i>
        </span><br><br>
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

<!-- 검색 -->
<div class="container">
    <div class="row">
        <form method="post" name="search" action="">
            <table class="pull-right">
                <tr>
                    <td><select class="form-control" name="searchField" style="width: 55pt; HEIGHT: 30pt">
                            <option value="0">선택</option>
                            <option value="bbsTitle">제목</option>
                            <option value="userID">작성자</option>
                    </select></td>
                    <td><input type="text" class="form-control"
                        placeholder="검색어 입력" name="searchText" maxlength="50"></td>
                    <td><button type="submit" onclick='location.href="#"' style="width: 50pt; HEIGHT: 25pt" class="btn btn-primary">검색</button></td>
                </tr>
            </table>
        </form>
    </div>
</div>    
    <hr style="border: double 1px grey;">
</div>
</body>
</html>
</html>

<!-- 하단내비바에 안깔리게 하려고 넣어둔 거 -->
<footer class='container-fulid border mt-5 p-3 '>
    <div class='row m-3'>
        <div class='col-sm-3 border d-flex justify-content-center align-items-center'>
            <div></div>
        </div>
    </div>
</footer>   