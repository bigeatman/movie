<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>로그인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script>
function init(){
    $('#loginBtn').on('click', ()=>{
        return location.href='../main.html'
    })
}
$(init)
</script>
<style>
body{
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-group{
    max-width:30rem;
    margin: auto;
}
</style>
<body>
    <div class='container'>
		<div class='col'>
			<form class='m-4'>
				<div class='form-group'>
				<label for='userId'>아이디 </label>
				<input id='userId' type='text' class='form-control' placeholder='아이디를 입력하세요.'/>
				</div>
				<div class='form-group mt-3'>
					<label for='userPw'>비밀번호 </label>
					<input id='userPw' type='password' class='form-control mb-2'  placeholder='••••'/>
				</div>
				<div class='form-group mt-4'>
					<button id='loginBtn' type='button' class='btn border btn-block bg-success'>
						<span class='h5'>로 그 인</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
