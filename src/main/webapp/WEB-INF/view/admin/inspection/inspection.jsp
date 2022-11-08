<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

function status() {
	//신고상세목록
	//InspectionDetail()

	// 신고반려
  $('#returnbtn').click( function() {
    if( inspection.setInspectionStatus("0")) {
    	inspection.setInspectionStatus("1")
    }
  });
});
/*
    // 신고반려
    $('#returnbtn').click(() => {
    	$(".inspectionStatus").val() == 1;
    	});

    // 신고삭제
    $('#delbtn').click(() => {
        if(isVal($('#laborerId:checked'))) {
            $('#modalMsg').text('노동자를 삭제하시겠습니까?')
            $('#modalBtn').show()
            $('#modal').modal()
        }
    })

    $('#delLaborerOkBtn').click(() => {
        let laborerId = $('#laborerId:checked').val()

        $.ajax({
        	url: 'laborer/delLaborer.jsp',
        	data: {laborerId: $('#laborerId:checked').val()},
        	success: listLaborers
        })
        $('#modal').modal('hide')
    })

    $('#laborers').on({
        change() {
            $('#laborerName').val($(this).parent().next().next().text())
            $('#hireDate').val($(this).parent().next().next().next().text())
        }
    }, '#laborerId')
}
*/
$(status)
</script>
<body>
<div class='container'>
    <div class='header'>
        <div class='float-left mt-3'>
            <h5>| 신고조회</h5>
        </div>
        <div id='btn_group' class='float-right mt-3'>
            <label style='font-size:13'>admin님</label>&emsp;
            <span style='font-size:12'>(08:23)</span>&emsp;
            <a href='../main.html'><button style='font-size:13'>로그아웃</button></a>
        </div><br>
        <div class='row mt-5'>
            <div class='col'>
                <div class='container'>
                    <div class='row'>
                        <div class='col-12 text-center'>
                            <div class='btn-group btn-block'>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../main.jsp" '>홈</button>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../user/.jsp" '>회 원</button>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../movie/listMovie.jsp" '>영 화</button>
                                <button type='button' class='btn btn-secondary'
                                    onclick='location.href="../inspection/inspection.jsp" '>신고 조회</button>
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
                        <tr>
                            <td>${status.count}</td>
                            <td>${inspection.inspectionContentName}</td>
                            <td>${inspection.nickname}<br>(${inspection.userId})</td>
                            <td>${inspection.anyContent}</td>
                            <td type='page-link' style="cursor: pointer;"
                                data-toggle='modal' data-value="${inspection.inspectionNum}" data-target='#reportModal'><i><u>${inspection.inspectionDetailsCount}건 상세보기</u></i></td>
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
                <p style='text-align: end; cursor: pointer;' data-dismiss='modal' a href=""><u><i>신고된 컨텐츠로 이동</i></u></p>
                <div style='width:100%; height:400px; overflow:auto'>
                <table class='table' width='100%' cellspacing='0' cellpadding='0'>
                    <thead style='text-align: center'>
                        <tr class="bg-light">
                            <th width="5%">No.</th><th>신고자ID</th><th width="50%">신고사유</th>
                        </tr>
                    </thead>
                    <tbody style='text-align: center'>
                    <c:forEach items="${inspectionDetail}" var="inspection" varStatus="status">
                        <tr>
                        	<td>${status.count}</td>
                            <td>${inspectionDetail.nickname}(${inspectionDetail.userId})</td>
                            <td>${inspectionDetail.inspectionDetailContent}</td>
						</tr>
					</c:forEach>
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