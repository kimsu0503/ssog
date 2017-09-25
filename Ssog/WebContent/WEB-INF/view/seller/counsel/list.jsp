<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<style>
	table, th, td {
		font-size: 13px;
	}
	.btn-custom {
	  background-color: hsl(0, 0%, 16%) !important;
	  background-repeat: repeat-x;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#5b5b5b", endColorstr="#282828");
	  background-image: -khtml-gradient(linear, left top, left bottom, from(#5b5b5b), to(#282828));
	  background-image: -moz-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -ms-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5b5b5b), color-stop(100%, #282828));
	  background-image: -webkit-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -o-linear-gradient(top, #5b5b5b, #282828);
	  background-image: linear-gradient(#5b5b5b, #282828);
	  border-color: #282828 #282828 hsl(0, 0%, 11%);
	  color: #fff !important;
	  border-radius: 0px;
	  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33);
	  -webkit-font-smoothing: antialiased;
	}
	
	.wrap {
		width:80%; margin-left:10%;
	}
	.wrap .table {
		table-layout: fixed;
	}
	.wrap .table td {
	    overflow: hidden;
	    text-overflow:ellipsis; /*overflow: hidden; 속성과 같이 써줘야 말줄임 기능이 적용된다.*/
	    white-space:nowrap; /*<td>보다 내용이 길경우 줄바꿈 되는것을 막아준다.*/
	}
	
	
	#btn { width: 85px; height: 22px; font-size: 11px; padding: 0px; }
	small { color:gray; }
	.table a {color:black;}
</style>
<div class="wrap">
	<div style="text-align:right">
		<p style="margin-top: 20px; text-align:left">
				<span class="glyphicon glyphicon-info-sign" style="padding-right: 10px;"></span>
				<b style="padding-right:10px; ">1:1 문의</b>
				<small style="font-size: 12px;">고객센터를 통하여 고객님께서 문의 하여 주신
				문의내역입니다.</small><br>
			<b style="font-size: 12px; padding-right: 330px;">고객님께서 신청한 문의 : 
				<b style="color: #ff4d4d; font-size: 13px;">${total}</b>건
				&nbsp;&nbsp;/&nbsp; 답변완료 된 문의 : ${reply_count}건
			</b>
		</p>
		<button type="button" class="btn btn-custom" id="btn" onclick="location='/seller/counsel/write.j'">1:1 문의 하기</button>
	</div>
	
		<table class="table" style="margin-top: 10px;" >
			<thead>
				<tr style="border-top: 3px solid black;">
					<th width="10%">문의유형</th>
					<th width="60%">제목</th>
					<th width="20%">작성일자</th>
					<th width="10%">답변</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr><td colspan="4" align="center">등록한 글이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="i" items="${list}">
					<tr>
						<td><custom:counsel message="${i.CATE}"/></td>
						<td><a href="/seller/counsel/write.j?num=${i.NUM}">${i.TITLE }</a></td>
						<td><fmt:formatDate value="${i.COUNSEL_DATE }" pattern="yyyy-MM-dd"/></td>
						<td><b><custom:reply message="${i.REPLY}"/></b></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	
	
		<!-- 페이지 -->
		<div align="center">
			<ul class="pagination">
				<c:if test="${page.startPageNo ne 1}"><!-- 이전 -->
					<li><a href="/seller/counsel/list.j?p=${page.startPageNo-1}">&laquo;</a></li>
				</c:if>
			<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}">
				<c:choose>
					<c:when test="${i eq p}">
						<li class="active"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/seller/counsel/list.j?p=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${page.endPageNo ne page.finalPageNo}"><!-- 다음 -->
					<li><a href="/seller/counsel/list.j?p=${page.endPageNo+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
</div>	