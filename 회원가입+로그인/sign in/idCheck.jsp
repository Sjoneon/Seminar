<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	// 한글이 꺠지는것을 방지하기 위해 요청된 데이터의 문자 인코딩을 EUC-KR로 설정합니다.
	String id = request.getParameter("id");
	// 사용자가 입력한 아이디를 가져옵니다.
	boolean result = mMgr.checkId(id);
	// MemberMgr 클래스의 checkId 메서드를 호출하여 해당 아이디가 이미 존재하는지 확인하고 결과를 저장합니다.
%>

<html>
<head>
<title>ID 중복체크</title>
<!-- HTML 문서의 제목을 "ID 중복체크"로 설정합니다. -->
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 외부 스타일 시트 파일("style.css")을 연결하여 페이지의 스타일을 정의합니다. -->
</head>
<body bgcolor="#CCCCCC">
<!-- HTML 문서의 본문을 나타냅니다. 배경색을 연한 회색으로 설정합니다. -->
	<div align="center">
		<br/><b><%=id%></b>
		<!-- 입력된 아이디를 굵게 표시합니다. -->
		<%
			if (result) {
				// 만약 결과가 true인 경우 (아이디가 이미 존재하는 경우)
				out.println("이미 존재하는 ID입니다.<p/>");
				// 메시지를 출력합니다.
			} else {
				// 결과가 false인 경우 (아이디가 사용 가능한 경우)
				out.println("사용 가능 합니다.<p/>");
				// 메시지를 출력합니다.
			}
		%>
		<!-- if문 종료 -->
		<a href="#" onClick="self.close()">닫기</a>
		<!-- 닫기 링크를 클릭하면 현재 창을 닫습니다. -->
	</div>
</body>
</html>
<!-- HTML 문서를 닫습니다. -->
