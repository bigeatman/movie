<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>adminMain</title>
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
	if(session.getAttribute("user") != null) { //로그인상태
%>
		$('#loginSpan').text('로그아웃')
		$('#id').text('${user.userId}님')
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
		
	#yesBtn, #noBtn{
	    margin: auto;
	    width: 100%;
	    max-width: 10rem;
	    height: 100%;
	}
</style>
<div class='container-fluid'>
		<div class='header'>
			<div class='float-left mt-3'><h5>| 홈</h5></div>
			<div id='btn_group' class='float-right mt-3'>
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
								<button disabled type='button' class='btn btn-primary' onclick='location.href="#"'>홈</button>
								<button type='button' class='btn btn-secondary' name='page' data-toggle='modal' data-target='#modal' onclick='location.href="../admin/user/users"'>회 원</button>
								<button type='button' class='btn btn-secondary' name='page' data-toggle='modal' data-target='#modal' onclick='location.href="#"'>장 르</button>
								<button type='button' class='btn btn-secondary' name='page' data-toggle='modal' data-target='#modal' onclick='location.href="../admin/movie/listMovie"'>영 화</button>
								<button type='button' class='btn btn-secondary' name='page' data-toggle='modal' data-target='#modal' onclick='location.href="#"'>감독/출연진</button>
								<button type='button' class='btn btn-secondary' name='page' data-toggle='modal' data-target='#modal' onclick='location.href="#"'>신고 조회</button>
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
</html>
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