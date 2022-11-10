<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>admin movie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='http://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
<link rel='preconnect' href="https://fonts.googleapis.com">
<link rel='preconnect' href="https://fonts.gstatic.com" crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@200&display=swap' rel='stylesheet'>
<!-- link rel='stylesheet' href='../res/font.css'/>  -->
<script>
function checkLogin() {
<%
	if(session.getAttribute("user") != null) { //로그인상태
%>
		$('#loginSpan').text('로그아웃')
		$('#id').text('${userId}님 ${nickname}님')
		$('#sessionTime').text('(08:23)세션시간 ')
		$('button[name="page"]').attr("data-target", "")
		$('#loginBtn').attr({
	   		class: "btn btn-secondary",
	   		onclick: "location.href='admin/user/logout'"	
	})
<%
	} else { //로그아웃 상태
%>
		$('button[name="page"]').attr("onclick", "")
<%
	}
%>
}
$(checkLogin)
</script>
<style>
.btn:hover{
    background-color: #b1c3e0;
}

th {
	height: 50;
}

td {
	height: 100;
	font-size: 20;
}
	
#loginBtn{
	height: 1.5rem;
	font-size: 14px;		
}
	
#yesBtn,
#noBtn{
    margin: auto;
    width: 100%;
    max-width: 10rem;
    height: 100%;
}
</style>
<body>
	<div class='container'>
		<div class='header'>
			<div class='float-left mt-3'><h5>| 홈</h5></div>
				<div id='loginBtnGroup' class='float-right mt-3'>
					<span id='id' style='font-size:13'></span>&emsp;
                    <span id='sessionTime' style='font-size:12'></span>&emsp;
	         		<button id='loginBtn' type='button' class='btn btn-primary btn-block' onclick='location.href="admin/user/login"'>
	         			<span id='loginSpan'>로그인</span>
	         		</button>
	         	</div><br>
	 		<div class='row mt-5'>
		        <div class='col'>
					<div class='container'>
						<div class='row'>
							<div class='col-12 text-center'>
								<div class='btn-group btn-block'>
									<button type='button' class='btn btn-secondary' onclick='location.href="admin"'>홈</button>
									<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
										name='page' onclick='location.href="admin/user/users"'>회 원</button>
									<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
										name='page' onclick='location.href="movie"'>영 화</button>
									<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
										name='page' onclick='location.href="inspection"'>신고 조회</button>
								</div>
							</div>
						</div>
					</div>
	     		</div>
			</div>
		</div><hr>
		<div class='row mt-5 justify-content-center'>
			<div class='col-11' id='adminStatus'>
				<h5 style='color:#5699f7'><b>| 현황</b></h5>
				<table class='table table-bordered mt-3 text-center'>
					<thead class='thead' style='background-color:#b1c3e0'>
						<tr>
							<th>회원 수</th>
							<th>영화평 수</th>
							<th>신고 수</th>
						</tr>
					</thead>
					<tbody id='Status' class='table-bordered'>
						<tr>
							<td>10</td>
							<td>5</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<div class='modal fade' tabindex='-1' id='modal'>
    <div class='modal-dialog modal-dialog-centered' id='myModal'>
        <div class='modal-content'>
            <div class='modal-header'></div>
            <div class='modal-body' style='text-align: center;'>
                <h4 id='modalMsg' style='color: red;'>로그인 하세요</h4>
                <div class='row'>
                    <button type='button' class='col btn btn-block btn-secondary' data-dismiss='modal'
                        id='noBtn'>취소</button>
                    <button type='button' class='col btn btn-block btn-primary' data-dismiss='modal'
                    	id='yesBtn' onclick='location.href="admin/user/login"'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>