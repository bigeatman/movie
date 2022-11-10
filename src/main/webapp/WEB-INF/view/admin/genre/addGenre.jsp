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

    if(!isGood) $('#errMsg').css('color', 'red').text(errMsg)

    return isGood
}

function init() {
	$('#addGenreBtn').click(() => {
	    if(isVal($('#genre'))) {
	        $.ajax({
	        	url: 'addGenre',
	        	method: 'post',
	        	contentType: 'application/json',
	        	data: JSON.stringify({
	                genreName: $('#genre').val()
	            }),
	        	success: console.log('성공')
	        })
	    }
	})
}
$(init)
</script>
<style>
#cw {
	width:25%;
	text-align : left;
}
</style>
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
            <div class='col' style='text-align: center'>
                <form>
                    <div class='row mb-3'>
                    	<div style='margin: 0 auto; width:350px;'>
	                    	<div class='row'>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='액션'/> <label for='genre'>액션</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='범죄'/> <label for='genre'>범죄</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='SF'/> <label for='genre'>SF</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='스릴러'/> <label for='genre'>스릴러</label>
		                        </div>
	                    	</div>
		                    <div class='row'>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='공포'/> <label for='genre'>공포</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='전쟁'/> <label for='genre'>전쟁</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='미스터리'/> <label for='genre'>미스터리</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='판타지'/> <label for='genre'>판타지</label>
		                        </div>
		                    </div>
		                    <div class='row'>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='코미디'/> <label for='genre'>코미디</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='로맨스'/> <label for='genre'>로맨스</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='멜로'/> <label for='genre'>멜로</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='드라마'/> <label for='genre'>드라마</label>
		                        </div>
		                    </div>
		                    <div class='row'>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='뮤지컬'/> <label for='genre'>뮤지컬</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='음악'/> <label for='genre'>음악</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='스포츠'/> <label for='genre'>스포츠</label>
		                        </div>
		                        <div id='cw'>
		                            <input type='checkbox' name='genre' value='애니'/> <label for='genre'>애니</label>
		                        </div>
		                    </div>
                    		<!-- <input type='text' class='form-control' name='genre' id='genre' 
                    			placeholder='장르를 입력하세요.' style='width: 300px; margin-left: -20px;'/> -->
                    		<!-- <button type='button' class='btn btn-success flex-fill border' id='addGenreBtn' style='width: 200px;'>
	                        	<span class='label d-md-inline'>추가</span>
	                        </button> -->
                    	</div>
                    	<div class='row'>
	                    	<button type='button' class='btn btn-success flex-fill border' id='addGenreBtn' style='width: 200px;'>
		                        	<span class='label d-md-inline'>추가</span>
		                    </button>
                    	</div>
                    </div>
                    <p id='errMsg'></p>
                    <div class='col'>
                        <h5 style='color:#0f56ba'><b class='d-flex'>| 장르 목록</b></h5>
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
</html>