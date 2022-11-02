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
</style>
<div class='container-fluid'>
	   <div class='header'>
		<div class='float-left mt-3'><h5>| 홈</h5></div>
			<div id='btn_group' class='float-right mt-3'>
         		<label style='font-size:13'>관리자님</label>
				<span style='font-size:12'>(08:23)</span>&emsp;
         		<a href='#'><button style='font-size:13'>로그인</button></a>
         	</div><br>
 		<div class='row mt-5'>
	         <div class='col'>
				<div class='container'>
					<div class='row'>
						<div class='col-12 text-center'>
							<div class='btn-group btn-block'>
								<button type='button' class='btn btn-secondary' onclick='location.href="#"'>홈</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="#"'>회 원</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="../admin/movie/listMovie"'>영 화</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="#"'>신고 조회</button>
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