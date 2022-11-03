<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>커뮤니티 글</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>

<!-- 댓글 modal script -->
<script>
function replyInit() {
	$('#_delReplyBtn_').click(() => {
	    $('#modalHeadMsg').text('댓글 삭제')
	    
	    $('#modalBodyMsg').text('해당 댓글을 삭제하시겠습니까?')
	    $('#inspectionReasonInput').hide()
	
	    $('#delReplyYesBtn').show()
	    $('#delReplyNoBtn').show()
	    $('#delReplyOkBtn').hide()
	    $('#inspectionCancelBtn').hide()
	    $('#inspectionCheckBtn').hide()
	    $('#inspectionOkBtn').hide()
	
	    $('#replyModal').modal()
	})

	$('#delYesBtn').click(() => {
	    $('#modalBodyMsg').text('댓글이 삭제 되었습니다.')
	
	    $('#delReplyYesBtn').hide()
	    $('#delReplyNoBtn').hide()
	    $('#delReplyOkBtn').show()
	
	    $('replyModal').modal()
	})

	$('#_inspectionReplyBtn_').click(() => {
	    $('#modalHeadMsg').text('댓글 신고')
	
	    $('#modalBodyMsg').text('신고 사유를 입력해주세요.')
	    $('#inspectionReasonInput').show()
	
	    $('#delReplyYesBtn').hide()
	    $('#delReplyNoBtn').hide()
	    $('#delReplyOkBtn').hide()        
	    $('#inspectionCancelBtn').show()
	    $('#inspectionCheckBtn').show()
	    $('#inspectionOkBtn').hide()
	
	    $('#replyModal').modal()
	})

	$('#inspectionYesBtn').click(() => {
	    $('#modalBodyMsg').text('신고해주셔서 감사합니다. 신고된 내용은 내부 검토를 통해 삭제여부를 확인해보도록 하겠습니다.')
	    $('#inspectionReasonInput').hide()
	  
	    $('#inspectionCancelBtn').hide()
	    $('#inspectionCheckBtn').hide()
	    $('#inspectionOkBtn').show()
	
	    $('#replyModal').modal()
	})
}
</script>

<!-- 동적리스트 진행중 -->
<script>
function listReplies() {
	replies = []
	replies.push(
		'<div class="row" id="reply">' +
	    '<div class="col mb-1">' +
	            '<li id="replyBg" class="list-group-item d-flex justify-content-between">' +
	                '<div>' + '__닉네임 __아이디' + '</div>' +
	                '<div>' + '__작성일'  +
	                    '<button class="ml-0" id="replyMenu" data-toggle="dropdown"><i class="bi bi-gear-fill"></i></button>' + 
	                    '<div class="dropdown-menu">' +
	                        '<a class="dropdown-item" id="__delReplyBtn">삭제</a>' +
	                        '<div class="dropdown-divider"></div>' +
	                        '<a class="dropdown-item" id="__inspectionReplyBtn">신고</a>' +
	                    '</div></div></li>'+
	             '<li id="replyBg" class="list-group-item"><div class="col mb-3">' +
                        '__댓글내용' +
                    '<div><a href="#"> <i id="__empathy" class="bi bi-hand-thumbs-up-fill"></i></a>' +
                        '__해당댓글공감기록' + 
                    '<a href="#"> <i id="__nonEmpathy" class="bi bi-hand-thumbs-down-fill"></i></a>' +
        '</div></li></div></div>')                             
	        	
	$('#replyList').append(replies.join(''))
}

$(() => {
	$('#regReplyBtn').click(() => {
		$(listReplies)
		$(replyInit)
	})	
})	

$(listReplies)
$(replyInit)
</script>
</head>

    
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

.board-box {
    height: 250px;
    margin-bottom: 20px;
    padding: 50px;
    border-width: 200px;
}

#replyBg {
        background: rgb(209, 208, 208);
    }

#replyMenu {
    color:black;
    background-color: rgb(209, 208, 208);
    border: 0px;
}

#boardMenu {
    color:black;
    background-color: rgb(209, 208, 208);
    border: 0px;
}

#empathy{
    color:black;
}

#nonEmpathy{
    color:black;
    transform:scaleX(-1);
    transform:scaleY(-1);
}

#regReplyBtn {
    width: 110%;
}

#modalBodyMsg{
    text-align: center;
}
</style>

<body>
<!-- 네비게이션 바 -->
<div id='navBar' class='container-fluid'>
    <nav class='row fixed-bottom p-1'>
      <div class='col m-2 text-center'>
        <a id='goHome' href='../main.html' class='ml-1'>
          <i class='fa-solid fa-house fa-xl'></i>
          <span class='iconfont'>&nbsp;홈</span>
        </a>
      </div>
      <div class='col m-2 text-center'>
        <a id='blind' href='../community/01.html' class='ml-1'>
          <i class='fa-regular fa-comments fa-xl'></i>
          <span class='iconfont'>커뮤니티</span>
        </a>
      </div>
      <div class='col m-2 text-center'>
        <a id='chat' href='../movie/01.html' class='ml-1'>
          <i class='fa-solid fa-compass fa-xl'></i>
          <span class='iconfont'>&nbsp;&nbsp;탐색</span>
        </a>
      </div>
      <div class='col m-2 text-center'>
        <a id='user' href='../user/01.html' class='ml-1'>
          <i class='fa-regular fa-user fa-xl'></i>
          <span class='iconfont'>&nbsp;&nbsp;&nbsp;로그인</span>
        </a>
      </div>
    </nav>
</div>

<!-- 영화평 댓글 -->
<div id='replyList'>
    <div class='row mb-3 mt-3'>
        <div class='col'>
            <li class='list-group-item d-flex'>
                댓글
                __댓글수
            </li>
        </div>
    </div>
</div>
   
<div class='row mt-3'>
    <div class='col d-flex'>
        <textarea class='form-control col-10' rows='1' placeholder='댓글을 작성해주세요.'></textarea>
        <a>
        	<button id='regReplyBtn' type="button" class="btn btn-primary">등록</button>
        </a>                
    </div>
</div>
</body>

<!-- 하단내비바에 안깔리게 하려고 넣어둔 거 -->
<footer class='container-fulid mt-5 p-1'>
    <div class='row m-3'>
        <div class='col-sm-3 d-flex justify-content-center align-items-center'>
            <div></div>
        </div>
    </div>
</footer>

<!-- 댓글 modal-->
<div class='modal fade' tabindex='-1' id='replyModal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'>
                <p id='modalHeadMsg'></p>
            </div>
            <div class='modal-body'>
                <p id='modalBodyMsg'></p>
                <textarea id='inspectionReasonInput' class='form-control' rows='5' placeholder='내용을 입력해주세요.'></textarea>
            </div>
            <div class='modal-footer justify-content-center'>
                <div class='col' id='delReplyNoBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='delReplyYesBtn'>
                    <button type='button' id='delYesBtn' class='btn btn-primary btn-block'>확인</button>
                </div>                
                <div class='col' id='delReplyOkBtn'>
                    <button type='button' class='btn btn-primary btn-block' data-dismiss='modal'>확인</button>
                </div>
                <div class='col' id='inspectionCancelBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='inspectionCheckBtn'>
                    <button type='submit' id='inspectionYesBtn' class='btn btn-primary btn-block'>확인</button>
                </div>      
                <div class='col' id='inspectionOkBtn'>
                    <button type='button' class='btn btn-primary btn-block' data-dismiss='modal'>확인</button>
                </div>   
            </div>
        </div>
    </div>
</div>
</html>

<!-- 댓글 양식
<div class='row' id='reply'>
        <div class='col mb-1'>
            <li id='replyBg' class='list-group-item d-flex justify-content-between'>
                <div>
                    ㅎㅇ movie1415  <!-- 작성자의 닉네임 id 
                </div>
                <div>
                    2022-10-12  <!-- 해당 댓글의 작성일 
                    <button class='ml-0' id='replyMenu' data-toggle='dropdown'><i class="bi bi-gear-fill"></i></button>
                    <div class='dropdown-menu'>
                        <a class='dropdown-item' id='delReplyBtn'>삭제</a>
                        <div class='dropdown-divider'></div>
                        <a class='dropdown-item' id='inspectionReplyBtn'>신고</a>
                    </div>
                </div>
            </li>                    
            <li id='replyBg' class='list-group-item'>
                <div class='col mb-3'>
                    다음작품 벌써부터 기다려져요<br> <!-- 해당 댓글의 내용
                    현기증난단 말이에요<br>
                </div>
                <div>
                    <a href='/'> <i id='empathy' class="bi bi-hand-thumbs-up-fill"></i></a>
                    2   <!-- 공감표시 수
                    <a href='/'> <i id='nonEmpathy' class="bi bi-hand-thumbs-down-fill"></i></a>
                </div>
            </li>   
        </div>
    </div>
-->  
    
<!-- 더보기
    <div class='row mb-1'>
	<div class='col flex-low mt-3'>
        <a href='04.html'>
            <button id='listReplyBtn' type='button' class='btn btn-primary btn-block'>더보기</button>
        </a>
    	</div>
	</div>
 -->