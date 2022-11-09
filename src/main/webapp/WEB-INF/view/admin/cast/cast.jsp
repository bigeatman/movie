<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>addMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
	
</script>
<style>
html, body {
	height: 90%;
}

.btn:hover {
	background-color: rgb(134, 136, 243);
}

.backgroundLayout {
	margin-top: 20px;
	margin-left: 10%;
	margin-right: 10%;
	width: 80%;
	height: 100%;
}

.viewLayout {
	height: 78%;
	margin-top: 2%;
	border : 1px solid gray;
	border-radius : 0.25rem;
}
</style>
<body>
	<div class='container-fluid'>
		<div class='header'>
			<div class='float-left mt-3'>
				<h5>| 영화</h5>
			</div>
			<div id='btn_group' class='float-right mt-3'>
				<label style='font-size: 13'>관리자님</label>&emsp; <span style='font-size: 12'>(08:23)</span>&emsp; <a href='../main.html'><button
						style='font-size: 13'>로그아웃</button></a>
			</div>
			<br>
			<div class='row mt-5'>
				<div class='col'>
					<div class='container'>
						<div class='row'>
							<div class='col-12 text-center'>
								<div class='btn-group btn-block'>
									<button type='button' class='btn btn-secondary' onclick='location.href=".." '>홈</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="#" '>회 원</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="#" '>장 르</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="../movie/listMovie" '>영 화</button>
									<button disabled type='button' class='btn btn-primary' onclick='location.href="#" '>감독/배우</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="#" '>신고 조회</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="backgroundLayout">
		<div style="display:flex">
			<input class='form-control' type='text' placeholder='검색' style="width:65%"/>
			<button type='button' class="btn ml-3 mr-3 border" style="width:5%">
				<i class='fa-solid fa-magnifying-glass'></i>
			</button>
			<div class="btn-group" style="width:28%;">
				<button id="director" onclick="togleDirector()" type='button' class='btn btn-secondary' style="width:50%; border: 0px solid gray">감독</button>
				<button id="actor" onclick="togleActor()" type='button' class='btn btn-secondary' style="width:50%; border: 0px solid gray">배우</button>
			</div>
		</div>
		<div id="view" class="viewLayout">
			
		</div>
	</div>
</body>
<script>
	var directorSelected = false;
	var actorSelected = false;
	
	function togleDirector() {
		var director = document.querySelector("#director");
		var actor = document.querySelector("#actor");
		
		if(directorSelected == false) {
			enableDirector();
		} else {
			disableDirector();
		}
	}
	
	function togleActor() {
		var actor = document.querySelector("#actor");
		
		if(actorSelected == false) {
			enableActor();
		} else {
			disableActor();
		}
	}
	
	function enableDirector() {
		director.style.setProperty('background-color', '#5aaaff');
		directorSelected = true;
		
		if(actorSelected) {
			actor.style.setProperty('background-color', '#6c757d');
			actorSelected = false;
		}
	}
	
	function disableDirector() {
		director.style.setProperty('background-color', '#6c757d');
		directorSelected = false;
	}
	
	function enableActor() {
		actor.style.setProperty('background-color', '#5aaaff');
		actorSelected = true;
		
		if(directorSelected) {
			director.style.setProperty('background-color', '#6c757d');
			directorSelected = false;
		}
	}
	
	function disableActor() {
		actor.style.setProperty('background-color', '#6c757d');
		actorSelected = false;
	}
	
</script>
</html>