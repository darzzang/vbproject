<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 안내문구 출력 -->
<!--  
	'이미 예약된 번호입니다'
	'입력하신 번호는 예약되어있지 않습니다'
-->

<div class="modal fade" id="errorBooking" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorBookingLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">예약하기 오류</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<img src="/resources/img/error.png" alt="오류 안내">
        <p>이미 예약된 번호입니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="errorChecking" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="errorCheckingLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">예약 조회 오류</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<img src="/resources/img/error.png" alt="오류 안내">
        <p>입력하신 번호는 예약되어있지 않습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
