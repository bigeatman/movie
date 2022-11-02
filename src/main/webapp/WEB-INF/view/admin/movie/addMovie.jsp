<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>addMovie</title>
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

	td {
		height: 30px;
		width: 150px;
	}

	#story {
		height: 250px;

	}

	#orButton{
		padding-top: 200px;
		margin-top: 200px;
	}
</style>
<div class='container-fluid'>
	<div class='header'>
		<div class='float-left mt-3'><h5>| 영화</h5></div>
		 <div id='btn_group' class='float-right mt-3'>
			  <label style='font-size:13'>관리자님</label>&emsp;
			  <span style='font-size:12'>(08:23)</span>&emsp;
			  <a href='#'><button style='font-size:13'>로그아웃</button></a>
		  </div><br>
	  <div class='row mt-5'>
		  <div class='col'>
			 <div class='container'>
				 <div class='row'>
					 <div class='col-12 text-center'>
						 <div class='btn-group btn-block'>
							<button type='button' class='btn btn-secondary' onclick='location.href=".." '>홈</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>회 원</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="../movie/listMovie" '>영 화</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>신고 조회</button>
						 </div>
					 </div>
				 </div>
			 </div>
		  </div>
	 </div>
</div><hr>
	<div class='col p-5'>
		<form class=' form' method='post'>
			<div class='col'>
				<h5 style='color:#0f56ba'><b>| 영화 추가</b></h5>
				<hr>
			</div>
			<div class='form-group mt-1' >
				<label for='#movieName'>작품명</label><input type='text' id='movieTitle' class='text-area form-control' placeholder='작품명을 2자 이상 20자 이하로 입력하세요.' required/>
				<span id='errmsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label for='#movieReleasedate'>개봉일</label><input type='date' class='form-control' required/>
				<span id='errmsg2'></span>
			</div>
			<div class='form-group mt-1'>
				 <label for='#movieGenre'>장르</label>
				<span id='errmsg3'></span>
				<div class='col'>
                    <div class='col d-flex justify-content-center align-items-center'></div>
						<table>
						<tr>
						<td><label><input type='checkbox'>액션</input></label></td>
						<td><label><input type='checkbox'>범죄</input></label></td>
						<td><label><input type='checkbox'>SF</input></label></td>
						<td><label><input type='checkbox'>스릴러</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>공포</input></label></td>
						<td><label><input type='checkbox'>전쟁</input></label></td>
						<td><label><input type='checkbox'>미스터리</input></label></td>
						<td><label><input type='checkbox'>판타지</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>코미디</input></label></td>
						<td><label><input type='checkbox'>로맨스</input></label></td>
						<td><label><input type='checkbox'>멜로</input></label></td>
						<td><label><input type='checkbox'>드라마</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>뮤지컬</input></label></td>
						<td><label><input type='checkbox'>음악</input></label></td>
						<td><label><input type='checkbox'>스포츠</input></label></td>
						<td><label><input type='checkbox'>애니</input></label></td>
						</tr>
						</table>
                    </div>
                </div>
            <div class='form-group mt-1'>
				<label for='#movieCountry'>국가</label><input type='text' class='form-control' placeholder='국가를 입력하세요.' required/>
				<span id='errmsg3'></span>
			</div>
			<div class='form-group mt-1'>
				<label for='#movieDirector'>감독</label><input type='text' class='form-control' placeholder='감독명을 입력하세요.' required/>
				<span id='errmsg3'></span>
			</div>
			<div class='form-group mt-1'>
				<label for='#movieActor'>출연진</label><input type='text' class='form-control' placeholder='출연진을 입력하세요.' required/>
			</div>
			<div class='form-group mt-1'>
				<label for='#hashtag'>태그</label><input type='text' class='form-control'/>
			</div>
			<div class='form-group mt-1'>
			<label for="moviePoster">포스터</label>
			<input type="file" id="moviePoster" name='moviePoster' accept='image/png, image/jpeg'>
			</div>
			<div class='row form-group m-0 mt-1'>
				<label for='#movieRunningtime'>상영시간</label><input type='number' min='0' class='form-control w-25 ml-3 mr-3'/>분
			</div>
			<div class='form-group m-0 mt-2'>
				<label for='#movieStory'>줄거리</label><textarea id='story' type='text' class='form-control'></textarea>
			</div> 
			<div class='row p-5 ml-5 justify-content-end'>
				<div class='p-1'>
				<button class='btn btn-secondary btn-block h-100 w-100 mr-5' onclick='location.href="../movie/listMovie"'>취소</button>
				</div>
				<div class='p-1'>
				<button type='submit' class='btn btn-success btn-block h-100 w-100 mr-5'>추가</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>