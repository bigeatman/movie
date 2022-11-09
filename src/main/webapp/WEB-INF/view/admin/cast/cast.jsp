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

.circle {
	width: 100px;
	height: 100px;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	border : 2px solid black;
}

.cast-info {
	margin : 10px;
	font-size : 16px;
	text-align : center;
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
		
		request(true);
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
		
		request(false);
	}
	
	function disableActor() {
		actor.style.setProperty('background-color', '#6c757d');
		actorSelected = false;
	}
	
	function request(isDirector) {
		var targetUrl;
		
		if(isDirector) {
			targetUrl = "../cst/getdirector";
		} else {
			targetUrl = "../cst/getactor";
		}
		
		$.ajax({
			url : targetUrl,
			method : "post",
			type : 'application/json',
			data : 	JSON.stringify ({
				startIndex : 0,
				rowCount : 1000
			}),
			success : function(result) {
				writeData(JSON.parse(result), isDirector);
				console.log(JSON.parse(result));
			}
		});
		
	}
	
	function writeData(result, isDirector) {
		var view = document.querySelector("#view");
		var lineDiv = createLineDiv();
		view.innerHTML = "";
		view.appendChild(lineDiv);
		
		for(var i = 0; i < result.length; i++) {
			var imgElem = createImgElement(result[i], isDirector);
			var nameElem = createNameElement(result[i], isDirector);
			
			var imgDiv = createImgDiv();
			imgDiv.appendChild(imgElem);
			imgDiv.appendChild(nameElem);
			lineDiv.appendChild(imgDiv);
			
			if(isOverflown(lineDiv)) {
				imgDiv.remove();
				lineDiv = createLineDiv();
				view.appendChild(lineDiv);
				lineDiv.appendChild(imgDiv);
			}
		}
		
		view.appendChild(lineDiv);
	}
	
	function createLineDiv() {
		var lineDiv = document.createElement('div');
		lineDiv.style.setProperty('display', 'flex');
		return lineDiv;
	}
	
	function createImgElement(result, isDirector) {
		var imgElem = document.createElement('img');
		imgElem.setAttribute('alt', 'Avatar');
		imgElem.classList.add('w3-col');
		imgElem.classList.add('s6');
		imgElem.classList.add('circle');
		imgElem.style.setProperty('border-radius', '50%');
		
		if(isDirector) {
			imgElem.setAttribute('src', result.directorImgFileName);
		} else {
			imgElem.setAttribute('src', result.castImgFileName);
		}
		
		return imgElem;
	}
	
	function createNameElement(result, isDirector) {
		var nameElem = document.createElement('div');
		nameElem.classList.add('cast-name');
		
		if(isDirector) {
			nameElem.innerHTML = result.directorName;
		} else {
			nameElem.innerHTML = result.castName;
		}
		
		return nameElem;
	}
	
	function createImgDiv() {
		var imgDiv = document.createElement('div');
		imgDiv.classList.add('cast-info');
		imgDiv.style.setProperty('overflow', 'hidden;');
		return imgDiv;
	}
	
	function isOverflown(element) {
		return element.scrollHeight > element.clientHeight
		|| element.scrollWidth > (element.clientWidth);
	}
	
</script>
</html>