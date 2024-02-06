<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="ch14.MemberMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	// 요청된 데이터의 문자 인코딩을 EUC-KR로 설정합니다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 사용자가 입력한 아이디와 비밀번호를 가져옵니다.
	String url = "login.jsp";
	// 로그인 후 이동할 페이지의 기본값을 "login.jsp"로 설정합니다.
	String msg = "로그인에 실패 하였습니다.";
	// 로그인 결과에 따라 표시할 메시지를 초기화합니다.
  
	boolean result = mMgr.loginMember(id, pwd);
	// MemberMgr 클래스의 loginMember 메서드를 호출하여 로그인을 시도하고 결과를 저장합니다.
	if(result){
		// 로그인이 성공한 경우
		session.setAttribute("idKey", id);
		// 세션에 "idKey" 속성을 통해 아이디를 저장합니다.
		msg = "로그인에 성공 하였습니다.";
		// 성공 메시지를 설정합니다.
	}
%>

<script>
	alert("<%=msg%>");	
	// JavaScript를 사용하여 화면에 메시지를 표시합니다.
	location.href="<%=url%>";
	// JavaScript를 사용하여 지정된 페이지로 이동합니다.
</script>