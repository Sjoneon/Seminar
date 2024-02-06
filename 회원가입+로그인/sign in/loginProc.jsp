<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="ch14.MemberMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	// ��û�� �������� ���� ���ڵ��� EUC-KR�� �����մϴ�.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// ����ڰ� �Է��� ���̵�� ��й�ȣ�� �����ɴϴ�.
	String url = "login.jsp";
	// �α��� �� �̵��� �������� �⺻���� "login.jsp"�� �����մϴ�.
	String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	// �α��� ����� ���� ǥ���� �޽����� �ʱ�ȭ�մϴ�.
  
	boolean result = mMgr.loginMember(id, pwd);
	// MemberMgr Ŭ������ loginMember �޼��带 ȣ���Ͽ� �α����� �õ��ϰ� ����� �����մϴ�.
	if(result){
		// �α����� ������ ���
		session.setAttribute("idKey", id);
		// ���ǿ� "idKey" �Ӽ��� ���� ���̵� �����մϴ�.
		msg = "�α��ο� ���� �Ͽ����ϴ�.";
		// ���� �޽����� �����մϴ�.
	}
%>

<script>
	alert("<%=msg%>");	
	// JavaScript�� ����Ͽ� ȭ�鿡 �޽����� ǥ���մϴ�.
	location.href="<%=url%>";
	// JavaScript�� ����Ͽ� ������ �������� �̵��մϴ�.
</script>