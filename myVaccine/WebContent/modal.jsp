<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- datepicker sources -->
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
<script src="resources/js/datepicker_custom.js"></script>

<!-- (참고용) 검색 버튼 클릭 시 검색 결과 영역 출력 -->
<script type="text/javascript">
	
	/* '검색' 버튼에 onclick으로 이벤트 설정 --> 추후에 유효성 검사 후 이벤트 재설정 필요! */
	function showRes() {
		if ($('#modalResult').css('display') == 'none') {
			$('#modalResult').slideDown();
		} else {
			$('#modalResult').hide();
		}
	}
</script>


<div class="modal fade" id="bookingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">의료기관 찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="searchArea">
        	<div class="container-fluid">
        		<form>
	        		<div class="form-group row datePicker">
	        			<div class="col-sm-2 labelArea">
							<label>날짜 선택<span class="require-mark">*</span></label>
						</div>
						<div class="col-sm-10 inputArea">
							<input type="text" class="form-control datePickerInput" name="date" id="datePicker" required>
						</div>
	        		</div>
	        		<div class="form-group row placePicker">
	        			<div class="col-sm-2 labelArea">
							<label>기관 선택<span class="require-mark">*</span></label>
						</div>
	        			<div class="col-sm-7 inputArea">
	        				<select class="form-select" name="addr1" required>
	        					<option selected>광역시도</option>
	        					<option value="대구광역시">대구광역시</option>
		        			</select>
		        			<select class="form-select" name="addr2" required>
		        				<option selected>시군구</option>
		        				<option value="동구">동구</option>
		        			</select>
		        			<select class="form-select" name="addr3" required>
		        				<option selected>읍면동</option>
		        				<option value="검사동">검사동</option>
		        				<option value="효목동">효목동</option>
		        			</select>
	        			</div>
	        			<div class="col-sm-3 btnArea">
		        			<input type="submit" value="검색" class="btn btn-outline-default" onclick="showRes()">
		        		</div>
	        		</div>
        		</form>
        	</div>
        </div>
        
        
        <div class="SearchResultArea" id="modalResult">
        	<div class="container-fluid">
        		<div class="row">
        			<p>검색 결과 총 2개</p>
        			<div class="col-sm-4 instArea">
        				<ul>
        					<li class="active">
        						<button>
        							<span class="lilText">대구광역시 &gt; 동구</span>
        							<span>동구보건소</span>
        						</button>
        					</li>
        					<li>
        						<button>
        							<span class="lilText">대구광역시 &gt; 동구</span>
        							<span>동구 예방접종센터</span>
        						</button>
        					</li>
        				</ul>
        			</div>
        			<div class="col-sm-8 infoArea">
        				<div class="titleArea">
        					<p class="title">의료기관명</p>
        					<p class="addressText">의료기관 주소</p>
        				</div>
        				<div class="instInfo">
        					<table>
        						<tbody>
        							<tr>
        								<th>전화번호</th>
        								<td>053-000-0000</td>
        							</tr>
        							<tr>
        								<th>진료시간</th>
        								<td></td>
        							</tr>
        						</tbody>
        					</table>
        				</div>
        				<div class="timeSelect">
        					<p class="timeSelectText">시간선택: 00:00</p>
        					<div class="timeSelectArea">
        						<form>
        							<div class="form-group">
        								<input type="radio" name="time" value="09:00" id="time09"><label for="time09" class="btn btn-outline-default">09:00</label>	
        								<input type="radio" name="time" value="10:00" id="time10"><label for="time10" class="btn btn-outline-default">10:00</label>	
        								<input type="radio" name="time" value="11:00" id="time11"><label for="time11" class="btn btn-outline-default">11:00</label>	
        								<input type="radio" name="time" value="12:00" id="time12"><label for="time12" class="btn btn-outline-default">12:00</label>
        								<input type="radio" name="time" value="13:00" id="time13"><label for="time13" class="btn btn-outline-default">13:00</label>
        								<input type="radio" name="time" value="14:00" id="time14"><label for="time14" class="btn btn-outline-default">14:00</label>	
        								<input type="radio" name="time" value="15:00" id="time15"><label for="time15" class="btn btn-outline-default">15:00</label>	
        								<input type="radio" name="time" value="16:00" id="time16"><label for="time16" class="btn btn-outline-default">16:00</label>	
        								<input type="radio" name="time" value="17:00" id="time17"><label for="time17" class="btn btn-outline-default">17:00</label>	
        								<input type="radio" name="time" value="18:00" id="time18"><label for="time18" class="btn btn-outline-default">18:00</label>	
        							</div>
        						</form>
        					</div>
        				</div>
        				<div class="vacsInStock">
        					<p>잔여 백신 수량: 20/30</p>
        				</div>
        				
        			</div>
        		</div>
        	</div>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-default">선택</button>
      </div>
    </div>
  </div>
</div>
