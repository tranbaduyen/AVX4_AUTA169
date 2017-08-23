<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ケーワイ出荷指示送信データ照会 </title>
	<link rel="stylesheet" href="css/bootstrap.min.css">    
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="background-color:#C4D6EA; padding: 0px 5px 5px 5px;border: 4px solid #1A75C6;display:block;">
		<!--Tạo header-->
			<div class="header1" style="font-weight: bold;">
				<div class="screenID"><span style="margin-left:3px;color:#3E8ACF;">AUTA671</span></div>
				<div class="screenName"><label style="color:#3E8ACF;">ケーワイ出荷指示送信データ照会 </label></div>
				<div id="clock" class="screenDay" style="margin-right:2px;color:#3E8ACF;" ></div>
			</div>
			<!--Tạo thanh thông báo lỗi-->
				<div class="body">					
					<div class="successful">
						<span style="font-size:15px; margin-left:5px; color:red;">		
							<<< エラーメッセージ >>>
						</span>
					</div>						
				</div>
				<!--Tạo các trường tìm kiếm-->
				<html:form action="/list" method="get"  acceptCharset="UTF-8">
				<div class="row form-group" style="margin-top:15px;">	
					
					<div class="bg" style="height:100px;" >
					
						<div class="col-lg-8">	
								<label class="label" style="width:25%;text-align:left;font-size:14px;color: white">作成日</label>
								<html:text  styleId="kYSNB_SEDT_From" property="kYSNB_SEDT_From" style="width:23%;margin-left:2px;"  styleClass="input_text" maxlength="10"  tabindex="" onfocus="" ></html:text>
								~
								<html:text styleId="kYSNB_SEDT_To" property="kYSNB_SEDT_To" style="width:23%;margin-left:2px;"  styleClass="input_text" maxlength="10"  tabindex="" onfocus="" ></html:text>
							</div>
						<div class="col-lg-4" >
							<label class="label" style=" margin-left:-15px;width:35%;text-align:left;font-size:20px;font-family:Calibri; color: white">SS</label>
							<html:text styleId="kYSNB_SSCD" property="kYSNB_SSCD" style="width:20%;margin-left:2px;"  styleClass="input_text" maxlength="1"  tabindex="" onfocus="" ></html:text>
						</div>
						<div class="col-lg-8">
							<label class="label" style="width:25%;text-align:left;font-size:14px;color: white">D E P O</label>
							<html:text styleId="kYSNB_DEPO"  property="kYSNB_DEPO" style="width:15%;margin-left:2px;"  styleClass="input_text" maxlength="2"  tabindex="" onfocus="" ></html:text>
						</div>
						<div class="col-lg-4" style="margin-left:-15px;" >
							<label class="label" style="width:35%;text-align:left;font-size:14px;color: white">部品番号</label>								
							<html:text styleId="kYSNB_BHNO" property="kYSNB_BHNO" style="width:64%;margin-left:2px;"  styleClass="input_text" maxlength="26"  tabindex="" onfocus="" ></html:text>
						</div>
						<div class="col-lg-8">
							<label class="label" style="width:25%;text-align:left;font-size:14px;font-family:white;color: white">メーカー</label>
							<html:select styleId="cbbKYSNB_MKCD" styleClass="select" property="kYSNB_MKCD" style="width:26%;margin-left:2px;">
								<html:option value="0">を選択してください</html:option>
								<html:option value="1">1</html:option>
								<html:option value="2">2</html:option>
								<html:option value="3">3</html:option>
							</html:select>
						</div>
						
					</div>	
					<div style="margin-top:15px;float:right;">
						<html:submit styleClass="btn111" style="width:130px;" property="submit" value="検索(S)" >検索(S)</html:submit>
						<input  class="btn111" type="button" onclick="resetForm()" value="ｷｬﾝｾﾙ( C)">
					</div>

				</div>	
				<!--Tạo thanh phân trang-->
				<div class="toolbar">
					<bean:define id="currentPage" name="searchKYSNBForm" property="currentPage"></bean:define>
					<bean:define id="noOfPages" name="searchKYSNBForm" property="noOfPages"></bean:define>	
					<span style="margin: 5px 0px 0px 15px; color:white; "> ${currentPage}/${noOfPages} ペ ー ジ </span>
					<p id="activeCP" hidden>${currentPage}</p>
					<c:if test="${currentPage == 1}">
						<html:link styleClass="button" href="list.do?currentPage=${currentPage}" style="margin-left:12px;width:23px;height:24px;"><img src="img/trai.png" style="width:20px;height:20px; margin-left:-7px;"></html:link>
					</c:if>
					<c:if test="${currentPage > 1}">
						<html:link styleClass="button" href="list.do?currentPage=${currentPage-1}" style="margin-left:12px;width:23px;height:24px;"><img src="img/traihover.png" style="width:20px;height:20px; margin-left:-7px;"></html:link>
					</c:if>
					<c:if test="${currentPage == noOfPages}">
						<html:link styleClass="button" href="list.do?currentPage=${currentPage}" style="width:23px;height:24px;"><img src="img/phai.png" style="width:20px;height:20px; margin-left:-7px;"></html:link>
					</c:if>	
					<c:if test="${currentPage < noOfPages}">
						<html:link styleClass="button" href="list.do?currentPage=${currentPage+1}" style="width:23px;height:24px;"><img src="img/phaihover.png" style="width:20px;height:20px; margin-left:-7px;"></html:link>
					</c:if>			
					<span style="margin: 5px 0px 0px 15px; color:white; ">  ペ ー ジ </span>
					<html:text style="margin-left:10px;width:40px;height:20px;" property="currentPage"></html:text>
					<button class="btn111" style="margin-left:10px;width:50px;" name="submit" value="showPage">表示</button>
					<!-- perRowNumber -->
					<span style="margin: 5px 0px 0px 15px; color:white; ">  表 示 件 数</span>
					<html:select styleId="perRowNumber" styleClass="select" property="limit" style="width: 50px;margin-left:10px;">
						<html:option value="10">10</html:option>
						<html:option value="20">20</html:option>
						<html:option value="50">50</html:option>
						<html:option value="100">100</html:option>
					</html:select>
					<button class="btn111" style="margin-left:10px;width:50px;" name="submit" value="showRecord">表示</button>
				</div>
			</html:form>
			<form action="/list" method="get">
				<div>
					<table class="stttb">
					<!--Tạo cột cho bảng kết quả tìm kiếm-->
						<thead>
							<tr style="background-color:#1A75C6;color: white;">
								<th rowspan="2" style="text-align:center;"></th>
								<th style="text-align:center;">作成日</th>
								<th rowspan="2" style="text-align:center;">DEPO</th>
								<th rowspan="2" style="text-align:center;">ﾒｰｶｰ</th>
								<th rowspan="2" style="text-align:center;">SS</th>
								<th rowspan="2" style="text-align:center;">SEQ</th>
								<th style="text-align:center;">部品番号</th>
								<th rowspan="2" style="text-align:center;">搬入先</th>
								<th rowspan="2" style="text-align:center;">注文番号</th>
								<th rowspan="2" style="text-align:center;">指示日</th>
								<th rowspan="2" style="text-align:center;">数量</th>
								<th rowspan="2" style="text-align:center;">車種</th>
							</tr>
							<tr style="background-color:#1A75C6;color: white;">
								<th style="text-align:center;">作成時 </th>
								<th style="text-align:center;">部品名称 </th>
							</tr>
						</thead>
						<tbody style="background-color:white; text-align: center;">
						<!--hang 1-->
						<logic:present name="searchKYSNBForm" property="listKYSNB">
						<logic:iterate name="searchKYSNBForm" property="listKYSNB" id="kYSNB">
							<tr>
								<td class="stt" rowspan="2">1</td>
								<td style="width:30px;">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SEDT"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_DEPO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_MKCD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SSCD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SEQ"/>
									</span>
								</td>
								<td style="width:30px;">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_BHNO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_FORM"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_CHNO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SYMD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SZSU"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SYCD"/>
									</span>
								</td>
							</tr>
							<!--hang 1.1-->
							<tr>
								<td style="width:30px;">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SHMS"/>
									</span>
								</td>
								<td style="width:30px;">
									<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_BHME"/>
									</span>
								</td>

							</tr>
						</logic:iterate>
						</logic:present>
						</tbody>
					</table>						
				</div>					
				<div style="margin-top:15px;float:right;">
					<button  id="export" class="btnexport" onclick="return false;">エクスポート(E)</button> 					
				</div>
			</form>
		</div>
</body>
<script>
	function resetForm() {
		$("#kYSNB_SEDT_From").val('');
		$("#kYSNB_SEDT_To").val('');
		$("#kYSNB_DEPO").val('');
		$("#kYSNB_SSCD").val('');
		$("#kYSNB_BHNO").val('');
		$('#cbbKYSNB_MKCD').val('')
	};
	$('input[type="text"]').change(function() {
	    this.value = this.value.replace(/[\\\'\\\"\\<\\>=]/g,'');
	    
	});
	</script>
	<script type="text/javascript"> function refrClock() {
		var d=new Date();
			var s=d.getSeconds();
			var m=d.getMinutes();
			var h=d.getHours();
			var day=d.getDay();
			var date=d.getDate();
			var month=d.getMonth();
			var year=d.getFullYear();
			var days=new Array("Chủ nhật,","Thứ 2,","Thứ 3,","Thứ 4,","Thứ 5,","Thứ 6,","Thứ 7,");
			var months=new Array("1","2","3","4","5","6","7","8","9","10","11","12"); var am_pm;
			if (s<10) {s="0" + s}
			if (m<10) {m="0" + m}
			if (h>12){
				h-=12;AM_PM = "PM"
			}
			else {AM_PM="AM"}
			if (h<10) {
				h="0" + h
			}
			document.getElementById("clock").innerHTML= year + "年" +months[month] + "月" + date + "日"; 

			setTimeout("refrClock()",1000); } refrClock();
	</script>
</html>