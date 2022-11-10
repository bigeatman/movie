<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<head>
    <title>회원</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css' />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css' />
    <script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
</head>
<script>
function checkLogin() {
<%
	if(session.getAttribute("user") != null) {
%>
	$('#myModal').modal('hide')
	$('#loginBtn').attr({
   		class: "btn btn-secondary",
   		onclick: "location.href='../logout'"	
	})
<%
	} else {
%>
	$('button[name="page"]').attr({
		onclick: "location.href"	
	})
<%
	}
%>
}

const users =[]
let user = 0

function isVal(field){
    let isGood = false
    let errMsg
    $('#modalMsg').text('')

    if (!field.length) errMsg = '유저를 선택하세요.'
    else isGood = true

    if (!isGood) {
        $('#modalMsg').text(errMsg)
        $('#noBtn').text('확인')
        $('#yesBtn').hide()
        $('#yesDelBtn').hide()
        $('#modal').modal()
    }
    return isGood
}

function listUsers(){
    $('input').not(':radio').val('')
    $('#userList').empty()


    $.ajax({
    	method:'Get',
		url: 'users/list',
		dataType: 'json',
		success: userList => {
			if(userList.length){
		        userArr = []
		        userList.forEach(user => {
					userArr.push( 
						`<tr>
                            <td><input type='radio' name='userNum' id='userNum'
                                   value='\${user.userNum}'/></td>
                            <td id='userNum'>\${user.userNum}</td> 
                            <td id='userId'>\${user.userId}</td>                                  
                            <td id='pw'>\${user.pw}</td>
                            <td id='nickname'>\${user.nickname}</td>                                  
                            <td id='phoneNum'>\${user.phoneNum}</td>                                  
                            <td id='email'>\${user.email}</td>
                        </tr>`
			        )
				})	

		        $('#userList').append(userArr.join(''))
		    } else $('#userList').append(
		        '<tr><td colspan=7 class=text-center>회원이 없습니다.</td></tr>'
		    )
		}
	})
}	
// 유저 닉네임 수정
    function init() {
    	listUsers()

        $('#fixBtn').click(() => {
            $('#yesDelBtn').hide()
        	$('#fixMag').remove()
            
        	if(isVal($('#userNum:checked'))){ 
            	if (!$('#fixNickname').val()){
            		$('#modalMsg').text('수정할 닉네임을 입력하세요')
                    $('#noBtn').text('확인')
                    $('#yesBtn').hide() 
                    $('#modal').modal()
            	} else { 					// ModalMsg 글씨크기좀;
            		$('#modalMsg').append('<h4 id ="fixMsg">','[' ,$('#userNum:checked').parent().next().next().next().next().text(),'] 을/를 <br> [' ,$('#fixNickname').val(), ']으로 수정하시겠습니까?</h4>')
                	$('#noBtn').text('취소')
                    $('#yesBtn').show()
                    $('#yesBtn').attr('class', 'col btn btn-block btn-primary')
                    $('#modal').modal() 
            	}
            }
        })
    
//수정 확인
        $('#yesBtn').click(() => {
        	$.ajax({
               	url: 'users/fix',
            	method: 'patch',
            	contentType: 'application/json',
            	data: JSON.stringify({
            		userNum: $('#userNum:checked').val(),
            		nickname: $('#fixNickname').val()
            	}),
                success: listUsers
       		})   
        })

    // 유저 삭제
        $('#delBtn').click(() => {
            $('#modalMsg').text(`해당 회원을 삭제하시겠습니까?`)
            $('#yesBtn').hide()
            $('#yesDelBtn').show()
            $('#noBtn').text('취소')
            $('#modal').modal()
        })
        
    //삭제 확인
        $('#yesDelBtn').click(() => {
        	$.ajax({
               	url: 'users/addWithDrawal',
            	method: 'Post',
            	contentType: 'application/json',
            	data: JSON.stringify({userNum: $('#userNum:checked').val()}),
                success: listUsers
       		})  
        })

// 수정할 아이디 칸에 자동입력
		$('#userList').on({
			change(){
	            $('#fixNickname').val($('#userNum:checked').parent().next().next().next().next().text())
			}
		}, '#userNum')      	
}

    $(init)
    $(checkLogin)
</script>
<style>
    #yesBtn,
    #noBtn,
    #yesDelBtn {
        margin: auto;
        width: 80%;
        max-width: 10rem;
        height: 100%;
    }

    table{
        table-layout:fixed; 
        word-break:break-all;
    }
    
    #logoutBtn{
	height: 1.5rem;
	font-size: 14px;		
	}
	
	#fixMsg{
		font-size: 3Rem;
		font-weigt: 1px;
	}
</style>
<body>
    <div class='container'>
            <div class='header'>
                <div class='float-left mt-3'>
                    <h5>| 회원</h5>
                </div>
                <div id='btn_group' class='float-right mt-3'>
                    <span id='id' style='font-size:13'>${userId}님 ${nickname}님</span>&emsp;
                    <span id='sessionTime' style='font-size:12'>(08:23)세션시간 </span>&emsp;
					<button id='logoutBtn' type='button' class='btn btn-primary btn-block' onclick='location.href="login"'>
	         			<span id='loginSpan'>로그아웃</span>
	         		</button>
                </div><br>
                <div class='row mt-5'>
                    <div class='col'>
                        <div class='container'>
                            <div class='row'>
                                <div class='col-12 text-center'>
                                    <div class='btn-group btn-block'>
                                        <button type='button' class='btn btn-secondary'
                                            onclick='location.href="../main.html" '>홈</button>
                                        <button type='button' class='btn btn-secondary'>회 원</button>
                                        <button type='button' class='btn btn-secondary'
                                            onclick='location.href="../movie/01.html" '>영 화</button>
                                        <button type='button' class='btn btn-secondary'
                                            onclick='location.href="../inspection/01.html" '>신고 조회</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            &nbsp;
            <div class='row'>
                <div class='col'>
                    <form class='mt-3'>
                        <div class='col form-group d-flex justify-content-end'>
                            <input class='form-control w-25' type='text' placeholder='검색' />
                            <button type='button' class="btn ml-3 border">
                                <i class='fa-solid fa-magnifying-glass'></i>
                            </button>
                        </div>
                    </form>
                    <table class='table'>
                        <thead style='text-align: center'>
                            <tr class="bg-light">
                                <th></th>
                                <th>No</th>
                                <th>ID</th>
                                <th>비밀번호</th>
                                <th>닉네임</th>
                                <th>연락처</th>
                                <th>이메일</th>
                            </tr>
                        </thead>
                        <tbody id='userList' style='text-align: center'>
                        </tbody>
                    </table>
                </div>
            </div>
            <hr>
            <div class='row'>
                <div class='col d-flex align-items-center justify-content-end'>
                    <input type='text' placeholder='수정할 닉네임' id='fixNickname' maxlength='8'>
                    <input type='button' value='회원 수정' id='fixBtn' class='mx-3 btn btn-primary' data-toggle='modal'
                        data-target='#modal'>
                    <input type='button' value='회원 삭제' id='delBtn' class='btn btn-warning'>
                </div>
            </div>
            <div class='row footer'>
                <nav id='nav' aria-label="Page navigation example" style='width: 100%;'>
                    <ul id="paging" class="pagination" style="justify-content: center;">
                        <li class="page-item"><a class="page-link" href="#"><</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">></a></li>
                    </ul>
                </nav>
            </div>
    </div>
</body>
<div class='modal fade' tabindex='-1' id='modal'>
    <div class='modal-dialog modal-dialog-centered' id='myModal'>
        <div class='modal-content'>
            <div class='modal-header'></div>
            <div class='modal-body' style='text-align: center;'>
                <p id='modalMsg'></p>
                <div class='row'>
                    <button type='button' class='col btn btn-block btn-secondary' data-dismiss='modal'
                        id='noBtn'>취소</button>
                    <button type='button' data-dismiss='modal' id='yesBtn' class='btn btn-block btn-primary'>확인</button>
                    <button type='button' data-dismiss='modal' id='yesDelBtn' class='btn btn-block btn-warning'>확인</button>
                    
                </div>
            </div>
        </div>
    </div>
</div>