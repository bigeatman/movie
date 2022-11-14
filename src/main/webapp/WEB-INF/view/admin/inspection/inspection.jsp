<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ADMIN.INSPECTION.신고조회</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
</head>
<script>
// 신고 상세페이지
function clickDetails(inspectionNum, inspectionContentNum, inspectionContentName) {
	$.get("/admin/inspections/" + inspectionNum + "/details", function(data, status) {
		//console.log('get data', data);
		$('#detailBody').empty();
		data.map((detail) => {
			$('#detailBody').append("<tr>"
					+ "<td>" + detail.inspectionDetailNum + "</td>"
					+ "<td>" + detail.userName + "</td>"
					+ "<td>" + detail.inspectionContent + "</td>"
					+ "</tr>"
				)
				
				$('#reportModal').modal("show");
		});
	})
	
	//신고반려	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dataString = year + '-' + month + '-' + day;
	
	$('#returnbtn').click(() => {
		$.ajax({
			url: '/admin/inspection/status',
			method: 'post',
			contentType: 'application/json',
			data: JSON.stringify({
				"inspectionNum" : inspectionNum,
				"inspectionStatus" : "1"
			}),
			success: function(data) {
				window.location.reload();
			},
			error: function(error, status) {
				console.log("error", error);
			}
		})
	})
	
	//신고삭제
	$('#delbtn').click(() => {
		$.ajax({
			url: '/admin/inspection/status',
			method: 'post',
			contentType: 'application/json',
			data: JSON.stringify({
				"inspectionNum" : inspectionNum,
				"inspectionStatus" : "2"
			}),
			success: function(data) {
				window.location.reload();
			},
			error: function(error, status) {
				console.log("error", error);
			}
		})
	})
}

</script>
<body>
<div class='container'>
    <div class='header'>
        <div class='float-left mt-3'>
            <h5>| 신고조회</h5>
        </div>
        <div id='btn_group' class='float-right mt-3'>
            <label style='font-size:13'>admin님</label>&emsp;
            <a href='../user/login'><button style='font-size:13'>로그아웃</button></a>
        </div><br>
        <div class='row mt-5'>
            <div class='col'>
                <div class='container'>
                    <div class='row'>
                        <div class='col-12 text-center'>
                            <div class='btn-group btn-block'>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../admin" '>홈</button> 
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../admin/user/list" '>회 원</button> <!-- 이동불가능 -->
                                <button type='button' class='btn btn-secondary'
                                	onclick='location.href="../admin/genre/addGenre" '>장 르</button>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../admin/movie/listMovie" '>영 화</button>
                                <button type='button' class='btn btn-secondary'
                                	onclick='location.href="../admin/" '>감독/배우</button> <!-- 이동불가능 -->
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../admin/inspection" '>신고 조회</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    &nbsp;
    <h5><b>신고 컨텐츠 목록</b></h5><br>
        <div class='row'>
            <div class='col'>
                <table class='table'>
                    <thead style='text-align: center'>
                        <tr class="bg-light">
                            <th>No.</th><th>종류</th><th>작성자ID</th><th>내용</th><th>상세 신고내용</th><th>처리결과</th>
                        </tr>
                    </thead>
                    <tbody style='text-align: center' id="inspectionTable">
                    <c:forEach items="${inspection}" var="inspection" varStatus="status">
                     <c:if test="${fn:length(inspection) == 0 }">
                        	<h5 style='text-align: center'>신고된 내용이 없습니다.</h5>
                    </c:if>
                        <tr>
                            <td>${status.count}</td>
                            <td>${inspection.inspectionContentName}</td>
                            <td>${inspection.nickname}<br>(${inspection.userId})</td>
                            <td>${inspection.anyContent}</td>
                            <td type='page-link' style="cursor: pointer;" onclick="clickDetails(${inspection.inspectionNum}, ${inspection.inspectionContentNum}, '${inspection.inspectionContentName}')"><i><u>${inspection.inspectionDetailsCount}건 상세보기</u></i></td>
                            <td><span class='inspectionStatus'>${inspection.inspectionStatusName}</span><c:if test="${inspection.inspectionStatus ne '0'}"><br>(${inspection.resultDate})</c:if></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table><hr>
                <span id="inspectionErrMsg" style="font-color:red;"></span>
                <nav aria-label="page nav-footer">
                    <ul id="paging" class="pagination" style="justify-content: center;">
                      <li class="page-item"><a class="page-link" href="#"><</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class='modal fade' tabindex='-1' id='reportModal'>
    <div class='modal-dialog modal-lg'>
        <div class='modal-content'>
            <div class='modal-body'><br>
                <h3><b>신고 사유 상세</b></h3>
                <a id='inspectionMove'>
                	<p style='text-align: end; cursor: pointer;' data-dismiss='modal' a href=""><u><i>신고된 컨텐츠로 이동</i></u></p>
                </a>
                <div style='width:100%; height:400px; overflow:auto'>
                <table class='table' width='100%' cellspacing='0' cellpadding='0'>
                    <thead style='text-align: center'>
                        <tr class="bg-light">
                            <th width="5%">No.</th><th>신고자ID</th><th width="50%">신고사유</th>
                        </tr>
                    </thead>
                    <tbody id='detailBody' style='text-align: center'>
					</tbody>
                </table>
            </div>
        </div>
            <div class='modal-footer'>
                <button id='returnbtn'type='button' class='btn btn-secondary' data-dismiss='modal'>신고 반려</button>
                <button id='delbtn' type='button' class='btn btn-primary' data-dismiss='modal'>컨텐츠 삭제</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>