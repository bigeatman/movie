<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>MYPAGE</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script>
function logout() {
	$('#logoutBtn').click(() => {
		<% session.invalidate();%>
		location.href = "/"
	})
}
$(logout)
</script>
<style>
    label {
        font-size: 13px;
    }

    #cw {
        width: 75px;
    }
</style>
<h5><br><b>&nbsp;&nbsp;&nbsp;&nbsp;| 프로필</b></h5>
<hr>
<div class="container-fulid">
    <div id='join' class='col'>
        <form>
            <div class='form-group'>
                <label for='userId'>아이디</label><br>
                <label for='userId'>user</label>
            </div>
            <div class='form-group'>
                <label for='nickName'>닉네임</label><br>
                <label for='nickName'>안녕하세요</label>
            </div>
            <div class='form-group'>
                <label for='phoneNum'>연락처</label><br>
                <label for='phoneNum'>010 - 1234 - 5678</label>
            </div>
            <div class='form-group'>
                <label for='email'>이메일</label><br>
                <label for='email'>user@daum.net</label>
            </div>
            <div class='form-group'>
                <label for='genre'>관심장르</label><br>
                <div class='row' style='padding-left: 15px'>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <label for='genre'>액션</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>범죄</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>SF</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>스릴러</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <label for='genre'>공포</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>전쟁</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>미스터리</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>판타지</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <label for='genre'>코미디</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>로맨스</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>멜로</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>드라마</label>
                        </div>
                    </div>
                    <div class='row' style='padding-left: 15px; margin-left: 5px;'>
                        <div id='cw'>
                            <label for='genre'>뮤지컬</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>음악</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>스포츠</label>
                        </div>
                        <div id='cw'>
                            <label for='genre'>애니</label>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <button id='cancelBtn' type='button' class='btn btn-light' style='width: 90px; margin-left: 45px; margin-right: 30px; margin-bottom: 30px;'>
                    <span class='h6'>뒤로가기</span>
                </button>
                <button id='fixUserBtn' type='button' class='btn btn-primary' style='width: 90px; margin-left: 30px; margin-bottom: 30px;'>
                    <span class='h6'>회원수정</span>
                </button>
                <button id='delUserBtn' type='button' class='btn btn-warning' style='width: 90px; margin-left: 45px; margin-right: 30px;'>
                    <span class='h6'>회원탈퇴</span>
                </button>
                <button id='logoutBtn' type='button' class='btn btn-secondary' style='width: 90px; margin-left: 30px;'>
                    <span class='h6'>로그아웃</span>
                </button>
            </div>
        </form>
    </div>
</div>
<div class='modal fade' tabindex='-1' id='myPageModal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'></div>
            <div class='modal-body'>
                <p id='modalMsg'></p>
            </div>
            <div class='modal-footer justify-content-center'>
                <div class='col' id='delUserNoBtn'>
                    <button type='button' class='btn btn-secondary btn-block' id='delUserCencelBtn' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='delUserYesBtn'>
                    <button type='button' class='btn btn-primary btn-block' id='delUserOkBtn'>확인</button>
                </div>
                <div class='col' id='delUserCheckBtn'>
                    <button type='button' class='btn btn-primary btn-block' id='delUserCheckOkBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>