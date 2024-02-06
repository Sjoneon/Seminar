<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- 위 코드는 JSP 페이지의 콘텐츠 타입을 HTML로 설정하고, 문자셋을 EUC-KR로 지정합니다. -->

<%
	request.setCharacterEncoding("EUC-KR");
	// 요청된 데이터의 문자 인코딩을 EUC-KR로 설정합니다.
	String id = (String)session.getAttribute("idKey");
	// 세션에서 "idKey" 속성을 통해 사용자 아이디를 가져옵니다.
%>

<html>
<head>
<title>로그인</title>
<!-- HTML 문서의 제목을 "로그인"으로 설정합니다. -->
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 외부 스타일 시트 파일("style.css")을 연결하여 페이지의 스타일을 정의합니다. -->
<script type="text/javascript">
	function loginCheck() {
		// 로그인 폼의 입력 값이 유효한지 검사하는 JavaScript 함수입니다.
		if (document.loginFrm.id.value == "") {
			// 아이디가 입력되지 않았을 경우 경고 메시지를 표시하고 아이디 필드에 포커스를 이동합니다.
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			// 비밀번호가 입력되지 않았을 경우 경고 메시지를 표시하고 비밀번호 필드에 포커스를 이동합니다.
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
		// 입력 값이 유효할 경우 로그인 폼을 서버로 제출합니다.
	}
</script>
</head>
<body bgcolor="#ffffcc">
<!-- HTML 문서의 본문을 나타냅니다. 배경색을 연한 노란색으로 설정합니다. -->
<div align="center"><br/><br/>
	<%if (id != null) {%>
	<!-- 만약 세션에서 가져온 아이디가 null이 아닌 경우 -->
	<b><%=id%></b>님 환영 합니다.
	<!-- 환영 메시지를 표시합니다. -->
	<p>제한된 기능을 사용 할 수가 있습니다.<p/>
	<a href="logout.jsp">로그아웃</a>
	<!-- 로그아웃 링크를 제공합니다. -->
	<%} else {%>
	<!-- 세션에서 가져온 아이디가 null인 경우(로그인이 안된 경우) -->
	<form name="loginFrm" method="post" action="loginProc.jsp">
	<!-- 로그인 폼을 생성하고, 데이터는 "loginProc.jsp"로 제출됩니다. -->
		<table>
			<tr>
				<td align="center" colspan="2"><h4>로그인</h4></td>
			</tr>
			<tr>
				<td>아 이 디</td>
				<td><input name="id"></td>
				<!-- 아이디 입력 필드를 생성합니다. -->
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
				<!-- 비밀번호 입력 필드를 생성합니다. -->
			</tr>
			<tr>
				<td colspan="2">
					<div align="right">
						<input type="button" value="로그인" onclick="loginCheck()">&nbsp;
						<!-- 로그인 버튼, 클릭 시 loginCheck() 함수 호출 -->
						<input type="button" value="회원가입" onClick="javascript:location.href='member.jsp'">
						<!-- 회원가입 버튼, 클릭 시 member.jsp로 이동 -->
					</div>
				</td>
			</tr>
		</table>
	</form>
	<%}%>
	<!-- if문 종료 -->
	</div>
</body>
</html>
<!-- HTML 문서를 닫습니다. -->
