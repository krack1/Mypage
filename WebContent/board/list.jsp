<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>  
	 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<style>
	tr{
		border-bottom:1px solid #D5D5D5;
		height:20px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<center>
<input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br />
전체글 : ${count } <br />

<c:if test="${count == 0 }">
	<c:if test ="${sessionScope.memid != null }">
		<table>
			<tr>
				<td>
					<a href="writeForm.hjh?pageNum=${currentPage}&re=0">글쓰기</a>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test ="${sessionScope.memid == null }">
		<table>
			<tr>
				<td>
					<a href="login.hjh">로그인</a>
				</td>
			</tr>
		</table>
	
	</c:if>
	<table class="boardtable">
		<tr>
			<td>
				저장된 글이 없습니다.
			</td>
		</tr>
	</table>

</c:if>

<c:if test="${count != 0 }">
	<c:if test="${sessionScope.memid != null }">
		<table width = "800">
			<tr>
				<td width="800" align="right">
					<a href="writeForm.hjh?pageNum=${currentPage}&re=0">글쓰기</a>
				</td>
			</tr>
		</table>	
	</c:if>
	<c:if test="${sessionScope.memid == null }">
		<table width = "800">
			<tr>
				<td width="800" align="right">
					<a href="login.hjh">로그인</a>
				</td>
			</tr>
		</table>	
	</c:if>
	
	<table width ="800" class="boardtable">
	<tr>
		<td width ="50">
			번호
		</td>
		<td>
			제목
		</td>
		<td width = "100">
			작성자
		</td>
		<td width = "150">
			작성일
		</td>
		<td width = "50">
			조회
		</td>
		<td width = "150">
			IP
		</td>		
	</tr>
	<c:if test="${id != null }">
		<c:forEach var="boarddto" items="${articleList}">
			<tr>
				<td>
					${boarddto.num}
				</td>
				<c:set var="padding" value="${boarddto.re_level * 10 }"/>
				<td style="padding: 0px 0px 0px ${padding}px;">
					 <a href = "confirmPw.hjh?num=${boarddto.num }&pageNum='${currentPage}'&writer=${boarddto.writer}">${boarddto.subject}</a>
				</td>
				<td>
					${boarddto.writer }
				</td>
				<td>
					${boarddto.reg_date}
				</td>
				<td>
					${boarddto.readcount}
				</td>
				<td>
					${boarddto.ip}
				</td>		
			</tr>
		</c:forEach>
		
	
	</c:if>
	<c:if test="${id == null }">
		<c:forEach var="boarddto" items="${articleList}">
			<tr>
				<td>
					${boarddto.num }
				</td>
				<c:set var="padding" value="${boarddto.re_level*10 }" />
				
				<td align="left" style="padding: 0px 0px 0px ${padding}px;">
					 <a href = "confirmPw.hjh?num=${boarddto.num }&pageNum=${currentPage}&writer=${boarddto.writer}">${boarddto.subject}</a>
				</td>
				<td>
					${boarddto.writer}
				</td>
				<td>
					${boarddto.reg_date }
				</td>
				<td>
					${boarddto.readcount }
				</td>
				<td>
					${boarddto.ip }
				</td>		
			</tr>
		</c:forEach>
	</c:if>
	</table>
</c:if>
	





<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
<c:set var="pageBlock" value="${10}" />
<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
<c:set var="startPage" value="${(result / 10) * 10 + 1 }" />
<c:set var="endPage" value="${startPage + pageBlock -1 }" />

	<c:if test="${count > pageSize}" >
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount }" />
		</c:if>
		<c:if test="${pageCount > 10 && currentPage > 10 }">
			<a href="list.hjh?pageNum=${startPage - 10}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list.hjh?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="list.hjh?pageNum=${startPage + 10}">[다음]</a>
		</c:if>
	
	</c:if>	


<form name="orderForm" action="list.hjh" method="get">
<input type="text" name="search" style="width:100px; margin:10px 10px 0px 0px;" /><input type="submit" value="검색" class="boardbutton"/>
</form>
</center>
</body>
</html>