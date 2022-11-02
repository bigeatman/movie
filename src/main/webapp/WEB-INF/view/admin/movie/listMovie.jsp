<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>listMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
<<<<<<< HEAD

</script>
<style>
    .btn:hover{
        background-color: rgb(134, 136, 243);
    }
=======
function listMovies() {
	$('#movies').empty()
	
	$.ajax({
		method: 'post',
		url: "<%=request.getContextPath() %>/admin/movie/listMovie"
	}).done(movies => {
		if(movies.length) {
			const movieArr = []
	
			$.each(movies, (i, movie) => {
				movieArr.unshift(
					`<tr>
						<td> 
							<input type='checkbox' value='\${movie.movieNum}' name='movieNum' id='movieNum'/>
						</td>
						<td>\${movie.movieNum}</td>
						<td>\${movie.movieName}</td>
						<td>\${genre.genreName}</td>
						<td>\${movie.movieReleasedate}</td>
						<td>\${director.directorName}</td>
						<td>\${actor.actorName}</td>
					</tr>`
				);
			})
	
			$('#movies').append(movieArr.join(''))
		} else {
			$('#movies').append('<tr><td colspan=6 class=text-center>등록한 영화가 없습니다.</td></tr>')
		}
	})
}

function init() {
	$(listMovies)
	$('#delMovieBtn').click(() => {
		if($('#movieNum:checked').val()) {
			$('#modalMsg').empty();
			$('#modalMsg').text('영화를 삭제하시겠습니까?');
			$('#confirmModal').modal();
			$('#okBtn').hide();
			$('#noBtn').show();
			$('#yesBtn').show();
		} else {
			$('#modalMsg').empty();
			$('#modalMsg').text('영화를 선택해주세요.');
			$('#confirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		}
	})
	$('#yesBtn').click(() => {
		$('#confirmModal').modal('hide')
			$.ajax({
				url: 'del/' + $('#movieNum:checked').val(),
				method: 'delete'
			}).done(listMovies)
	})
}

$(init)
</script>
<style>
>>>>>>> 9105c89 (movie 정리)

    #searchMovieBtn,#fixMovieBtn,#delMovieBtn,#addMovieBtn{
        background-color: #b1c3e0;
    }

    #addBoardBtn:hover,#searchMovieBtn:hover,#fixMovieBtn:hover,#delMovieBtn:hover,#addMovieBtn:hover{
        background-color: #5699f7;
    }
</style>

<body>
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
								 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>영 화</button>
								 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>신고 조회</button>
							 </div>
						 </div>
					 </div>
				 </div>
			  </div>
		 </div>
   </div><hr>

        <div class='row mt-5'>
            <div class='col'>
                <form>
                    <div class='row mb-3'>
                        <div class='col'>
                            <input type='text' class='form-control' name='boardTitle' id='boardTitle' placeholder='검색'/>
                        </div>
                        <div class='col'>
                            <nav class='d-flex'>
                                <button type='button' class='btn flex-fill border' id='searchMovieBtn'>
                                    <span class='label  d-md-inline'>조회</span>
                                </button>
                                <button type='button' class='btn flex-fill border' id='fixMovieBtn' onclick="location.href='fixMovie' ">
                                    <span class='label  d-md-inline'>수정</span>
                                </button>
                                <button type='button' class='btn flex-fill border' id='delMovieBtn'
<<<<<<< HEAD
                                    data-toggle='modal' data-target='#delMovieModal'>
=======
                                    data-toggle='modal' data-target='#confirmModal'>
>>>>>>> 9105c89 (movie 정리)
                                    <span class='label d-md-inline'>삭제</span>
                                </button>
                                <button type='button' class='btn flex-fill border'id='addMovieBtn' onclick="location.href='addMovie' ">
                                    <span class='label  d-md-inline'>추가</span>
                                </button>
                            </nav>
                        </div>
                    </div>
                    <div class='col'>
                        <h5 style='color:#0f56ba'><b>| 영화 목록</b></h5>
                    </div>
                    <div class='row'>
                        <div class='col'>
                            <table class='table table-bordered' id='BoardTable'>
                                <thead><tr><th></th><th>NO</th><th>작품명</th><th>개봉일</th><th>장르</th><th>감독</th><th>출연진</th></tr></thead>
                                <tbody>
                                    <tr>
<<<<<<< HEAD
                                        <td><input type='radio' name='BoardId'/></td>
=======
                                        <td><input id='movieNum' type='radio' name='BoardId'/></td>
>>>>>>> 9105c89 (movie 정리)
                                        <td>1</td>
                                        <td>블랙 아담</td>
                                        <td>2022.10.19.</td>
                                        <td>액션</td>
                                        <td>자움 콜렛 세라</td>
                                        <td>드웨인 존슨, 노아 센티네오</td>
                                    </tr>
                                    <tr>
                                        <td><input type='radio' name='BoardId'/></td>
                                        <td>2</td>
                                        <td>공조2: 인터내셔날</td>
                                        <td>2022.09.07.</td>
                                        <td>액션</td>
                                        <td>이석훈</td>
                                        <td>현빈, 유해진, 윤아</td>
                                    </tr>
                                    <tr>
                                        <td><input type='radio' name='BoardId'/></td>
                                        <td>...</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><input type='radio' name='BoardId'/></td>
                                        <td>...</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

<nav aria-label="Page navigation example">		
    <ul id="paging" class="pagination" style="justify-content: center;">
      <li class="page-item"><a class="page-link" href="#">＜</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">＞</a></li>
    </ul>
</nav>

<<<<<<< HEAD
<div id='delMovieModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
=======
<div id='confirmModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h5 id='modalTitle'>영화 삭제</h5>
>>>>>>> 9105c89 (movie 정리)
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
<<<<<<< HEAD
				<p>[영화작품명] 삭제하시겠습니까?</p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
				<button type='button' class='btn btn-primary' data-dismiss='modal' id='delMovieOkBtn'>확인</button>
=======
				<p id='modalMsg' style='text-align: center'></p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-primary' data-dismiss='modal' id='yesBtn'>확인</button>
				<button type='button' class='btn btn-secondary' data-dismiss='modal' id='noBtn'>취소</button>
				<button type='button' class='btn btn-primary' data-dismiss='modal' id='okBtn'>확인</button>
>>>>>>> 9105c89 (movie 정리)
			</div>
		</div>
	</div>
</div>
</body>
</html>