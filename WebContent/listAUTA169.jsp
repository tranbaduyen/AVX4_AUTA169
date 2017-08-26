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
	<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/>
	<title>ケーワイ出荷指示送信データ照会 </title>
	<link rel="stylesheet" href="css/bootstrap.min.css">    
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<style type="text/css">
		.successful {
	padding-left:10px;
	margin-top: 15px;
	padding-top:2px;
	color: black;
	border: 1px solid #2367aa;
	background-color:white;
	border: 1px solid #7BAFD0;
	
	}
	tbody:nth-child(odd) {
	  background: #FFF;
	}
	tbody:nth-child(even) {
	  background: #dee8f3;
	}
	</style>
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
					<bean:define id="errorFirst" name="searchKYSNBForm" property="errorFirst"></bean:define>
					<span style="display: none;"><bean:write name="errorFirst"/></span>					
					<c:if test="${errorFirst != 0}">
						<div class="successful">
							
							<label for="errorMessage" style="color: black;font-size:13px; margin-left:5px;">
								<span id="iconmessage1"></span>
								<span for="message1" id="message1"><html:errors property="kYSNB_SEDT_FromError" /></span>
								<span id="iconmessage2"></span>
								<span for="message2" id="message2"><html:errors property="kYSNB_SEDT_ToError" /></span>
								<span id="iconmessage3"></span>
								<span for="message3" id="message3"><html:errors property="kYSNB_SSCDError" /></span>
								<span id="iconmessage4"></span>
								<span for="message4" id="message4"><html:errors property="kYSNB_DEPOError" /></span>
								<span id="iconmessage5"></span>
								<span for="message5" id="message5"><html:errors property="kYSNB_SEDT_FromToError" /></span>
								<span id="iconmessage6"></span>
								<span for="message6" id="message6"><html:errors property="kYSNB_SearchError" /></span>
							</label>
						
							
						</div>
					</c:if>						
				</div>
				<!--Tạo các trường tìm kiếm-->
				<html:form action="/list" method="post"  acceptCharset="UTF-8">
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
								<html:optionsCollection styleClass="opt" name="searchKYSNBForm" property="listMFOPM" 
										label="mFOPM_MKCD" value="mFOPM_MKCD" />
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
					<html:text styleId="pageNumber" style="margin-left:10px;width:40px;height:20px;" property="currentPage"></html:text>
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
					<table id="myTable" class="">
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
						<tbody style="text-align: center;">
						<!--hang 1-->
						<logic:present name="searchKYSNBForm" property="listKYSNB">
						<logic:iterate name="searchKYSNBForm" property="listKYSNB" id="kYSNB" indexId="index">
						<tbody style="text-align: center;">
							<tr>
								<td class="stt" rowspan="2">${(index+1) + (currentPage-1) * 10}</td>
								<td style="width:30px;">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SEDT"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_DEPO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_MKCD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SSCD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SEQ"/>
									</span>
								</td>
								<td style="width:30px;">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_BHNO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_FORM"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_CHNO"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SYMD"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<span style="background-color:#EBEBE4;border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SZSU"/>
									</span>
								</td>
								<td style="width:30px;" rowspan="2">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SYCD"/>
									</span>
								</td>
							</tr>
							<!--hang 1.1-->
							<tr>
								<td style="width:30px;">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_SHMS"/>
									</span>
								</td>
								<td style="width:30px;">
									<span style="border: 1px solid #71a6fa;width:80%;margin:5px 3px;">
										<bean:write name="kYSNB" property="kYSNB_BHME"/>
									</span>
								</td>

							</tr>
						</tbody>	
						</logic:iterate>
						</logic:present>
						
					</table>						
				</div>					
			</form>
			<div style="margin-top:15px;float:right;">
				<button  id="export" class="btnexport" onclick="tableToExcel('myTable', 'List KYSNB Page ${currentPage}')">エクスポート(E)</button> 					
			</div>
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
	
	$('.input_text').change(function() {
	    this.value = this.value.replace(/[\\\'\\\"\\<\\>=]/g,'');
	    
	});
	$('#pageNumber').change(function() {
	    this.value = this.value.replace(/[\\\'\\\"\\<\\>=!@#$%^&*()-+{}?.,a-zA-Z]/g,1);
	    
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
	<script type="text/javascript">
		var message1 = $("#message1").text();
		var message2 = $("#message2").text();
		var message3 = $("#message3").text();
		var message4 = $("#message4").text();
		var message5 = $("#message5").text();
		var message6 = $("#message6").text();
		var message7 = $("#message7").text();
		var message8 = $("#message8").text();
		var message9 = $("#message9").text();
		var message10 = $("#message10").text();
		var message12 = $("#message12").text();
		if(message1.length > 0){
			$("#iconmessage1").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
		if(message2.length > 0){
			$("#iconmessage2").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
		if(message3.length > 0){
			$("#iconmessage3").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
		if(message4.length > 0){
			$("#iconmessage4").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
		if(message5.length > 0){
			$("#iconmessage5").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
		if(message6.length > 0){
			$("#iconmessage6").html('<i class="fa fa-exclamation-triangle" style="color:#cccc00;"></i>');
		}
	</script>
	<script type="text/javascript">
	var tableToExcel = (function() {
	  var uri = 'data:application/vnd.ms-excel;base64,'
	    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
	    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
	    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
	  return function(table, name) {
	    if (!table.nodeType) table = document.getElementById(table)
	    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
	    window.location.href = uri + base64(format(template, ctx))
	  }
	});
	</script>
	<script>
	jQuery.extend(jQuery.expr[':'], {
	    focusable: function (el, index, selector) {
	        return $(el).is('a, button, :input, [tabindex]');
	    }
	});
	
	$(document).on('keydown', ':focusable', function (e) {
	    if (e.which == 13) {
	        e.preventDefault();
	        // Get all focusable elements on the page
	        var $canfocus = $(':focusable');
	        var index = $canfocus.index(this) + 1;
	        if (index >= $canfocus.length) index = 0;
	        $canfocus.eq(index).focus();
	    }
	});
	</script>
	<script >
	$(function() {
		  $('#kYSNB_SEDT_From').focus();
		  var errorFirst = ${errorFirst}	 
		  switch (errorFirst) {
			case 1:
				break;
			case 2:
				$('#kYSNB_SEDT_From').blur();
				$('#kYSNB_SEDT_To').focus();
				break;
			case 3:
				$('#kYSNB_SEDT_From').blur();
				$('#kYSNB_SSCD').focus();
				break;
			case 4:
				$('#kYSNB_SEDT_From').blur();
				$('#kYSNB_DEPO').focus();
				break;
			case 5:
				$('#kYSNB_SEDT_From').blur();
				$('#kYSNB_BHNO').focus();
				break;
		}
		  
	});
	</script>
</html>