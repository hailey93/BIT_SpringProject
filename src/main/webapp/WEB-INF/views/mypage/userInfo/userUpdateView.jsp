<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>userUpdateView</title>
</head>
<body>
	<form action="updateUser.do" method="post" onsubmit="return check()">
		<table>


			<tbody>
				<tr>
					<td colspan="2">아이디: <input type="text" id="id" name="id"
						value="${id}" readonly="readonly"></td>
				</tr>

				<tr>
					<td colspan="2">이름: <input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td colspan="2">비밀번호: <input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>

					<td colspan="2">비밀번호 확인: <input type="password" name="pwCheck"
						id="pwCheck"></td>
				</tr>
				<tr>
					<td colspan="2">생년월일: <input type="date" id="birth"
						name="birth">
					</td>
				</tr>
				<tr>
					<td colspan="2">성별: 남자<input type="radio" name="gender" value="남자" checked="checked">
               여자<input type="radio" id="gender" name="gender" value="여자" ></td>
				</tr>
				<tr>
					<td colspan="2">휴대폰번호: <input type="text" id="phone"
						name="phone"></td>
				</tr>

				<tr>
					<td colspan="3"><button type="submit" id="updateOk">수정완료</button></td>
				</tr>
				<tr>
					<td colspan="3"><input type="button"
						onclick="location.href='viewUser.do'" value="회원정보"></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
<script type="text/javascript">
	$(document).ready(function(e) {

		$('#updateOk').click(function() {
			if ($.trim($('#name').val()) == '') {
				alert("이름 입력.");
				$('#name').focus();
				return;
			} else if ($.trim($('#pw').val()) == '') {
				alert("비밀번호 입력.");
				$('#pw').focus();
				return;
			}//패스워드 확인
			else if ($('#pw').val() != $('#pwCheck').val()) {
				alert('비밀번호가 다릅니다.');
				$('#pw').focus();
				return;
			} else if ($.trim($('#birth').val()) == '') {
				alert("생년월일 입력.");
				$('#birth').focus();
				return;
			} else if ($.trim($('#phone').val()) == '') {
				alert("핸드폰번호 입력.");
				$('#phone').focus();
				return;
			} else {
				alert("수정완료");
			}

		});

	});
</script>
</html>