<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>장르</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function isVal(field) {
    let isGood = false
    let errMsg

    if(!field.val()) errMsg = '장르를 입력하세요.'
    else isGood = true

    if(!isGood) {
        $('#modalMsg').text(errMsg).css('color', 'red')
        $('#modalBtn').hide()
        $('#modal').modal()
    }

    return isGood
}

function init() {
	$('#addGenreBtn').click(() => {
	    if(isVal($('#genre'))) {
	        $.ajax({
	        	url: 'admin/genre/addGenre',
	        	method: 'post',
	        	data: { 
	                genre: $('#genre').val(),
	            },
	        	success: console.log('성공')
	        })
	    }
	})
}
$(init)
</script>
<body>
	<div class='container-fluid'>
		<div class='header'>
            <div class='float-left mt-3'><h5>| 장르</h5></div>
			 <div id='btn_group' class='float-right mt-3'>
				  <label style='font-size:13'>admin님</label>&emsp;
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
								<button disabled type='button' class='btn btn-primary' onclick='location.href="#" '>장 르</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="#" '>영 화</button>
								<button type='button' class='btn btn-secondary' onclick='location.href="#" '>감독/배우</button>
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
                            <input type='text' class='form-control' name='genre' id='genre' placeholder='장르를 입력하세요.' style=''/>
                        </div>
                        <div class='col'>
                            <nav class='d-flex'>
                            	<button type='button' class='btn flex-fill border'id='addGenreBtn'>
                                    <span class='label  d-md-inline'>추가</span>
                                </button>
                            </nav>
                        </div>
                    </div>
                    <div class='col'>
                        <h5 style='color:#0f56ba'><b>| 장르 목록</b></h5>
                    </div>
                    <div class='row'>
                        <div class='col'>
                            <table class='table table-bordered' id='BoardTable'>
                                <thead><tr><th>NO</th><th>장르명</th><th>대상 영화 수</th><th>관심 등록 수</th></tr></thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>액션</td>
                                        <td>1</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>범죄</td>
                                        <td>1</td>
                                        <td>1</td>
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

<div id='modal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p id='modalMsg'></p>
			</div>
			<div class='modal-footer' id='modalBtn'>
				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
				<button type='button' class='btn btn-primary' data-dismiss='modal' id='delMovieOkBtn'>확인</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>