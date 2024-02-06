<%@page contentType="text/html; charset=EUC-KR" %>
<!-- 위 코드는 JSP 페이지의 콘텐츠 타입을 HTML로 설정하고, 문자셋을 EUC-KR로 지정합니다. -->

<%request.setCharacterEncoding("EUC-KR");%>
<!-- 사용자의 요청(request)에 대한 문자 인코딩을 EUC-KR로 설정합니다. -->

<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<!-- ch14 패키지의 MemberMgr 클래스를 사용하기 위해 JSP 빈을 생성합니다. -->

<jsp:useBean id="bean" class="ch14.MemberBean"/>
<!-- ch14 패키지의 MemberBean 클래스를 사용하기 위해 JSP 빈을 생성합니다. -->

<jsp:setProperty property="*" name="bean"/>
<!-- JSP 빈에 클라이언트의 요청 파라미터를 자동으로 설정합니다. -->

<%
	boolean result = mgr.insertMember(bean);
	// MemberMgr 클래스의 insertMember 메서드를 호출하여 회원 정보를 데이터베이스에 추가하고 그 결과를 저장합니다.
	
	String msg = "회원가입에 실패 하였습니다.";
	String location = "member.jsp";
	// 회원가입 실패 시의 메시지와 이동할 페이지를 미리 지정합니다.
	
	if(result){
		// 회원가입이 성공했을 경우
		msg = "회원가입을 하였습니다.";
		location = "login.jsp";
		// 성공 시의 메시지와 이동할 페이지를 변경합니다.
	}
%>

<script>
	alert("<%=msg%>");
	// JavaScript를 사용하여 화면에 메시지를 표시합니다.
	
	location.href = "<%=location%>";
	// JavaScript를 사용하여 지정된 페이지로 이동합니다.
</script>
