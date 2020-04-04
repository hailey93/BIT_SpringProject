<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

		
${wishList }

<div class="listTable">
		<table>
			<caption>위시리스트 목록</caption>
			<thead>
				<tr>
					<th scope="row" class="allCheck"><input type="checkbox" name="allCheck" id="allCheck"></th>
					
					<th scope="row" />
					
					<th scope="row" data-class="expand">도서명</th>

			  	</tr>
			</thead>
			<tbody>
				
 <c:forEach var="myWishList" items="${wishList }">	
 			
				<tr>
					<td class="checkbox"><input type="checkbox" name="check" value="${myWishList.bookTitle }"></td>

					<td class="image"><a href=""><img src="${myWishList.imagePath }" ></a></td>
					
					<td class="bookTitle"><a href="">${myWishList.bookTitle }</a></td>

				</tr>
				
				
 </c:forEach>				
			</tbody>
		</table>
</div>

</body>
</html>