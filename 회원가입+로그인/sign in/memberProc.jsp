<%@page contentType="text/html; charset=EUC-KR" %>
<!-- �� �ڵ�� JSP �������� ������ Ÿ���� HTML�� �����ϰ�, ���ڼ��� EUC-KR�� �����մϴ�. -->

<%request.setCharacterEncoding("EUC-KR");%>
<!-- ������� ��û(request)�� ���� ���� ���ڵ��� EUC-KR�� �����մϴ�. -->

<jsp:useBean id="mgr" class="ch14.MemberMgr"/>
<!-- ch14 ��Ű���� MemberMgr Ŭ������ ����ϱ� ���� JSP ���� �����մϴ�. -->

<jsp:useBean id="bean" class="ch14.MemberBean"/>
<!-- ch14 ��Ű���� MemberBean Ŭ������ ����ϱ� ���� JSP ���� �����մϴ�. -->

<jsp:setProperty property="*" name="bean"/>
<!-- JSP �� Ŭ���̾�Ʈ�� ��û �Ķ���͸� �ڵ����� �����մϴ�. -->

<%
	boolean result = mgr.insertMember(bean);
	// MemberMgr Ŭ������ insertMember �޼��带 ȣ���Ͽ� ȸ�� ������ �����ͺ��̽��� �߰��ϰ� �� ����� �����մϴ�.
	
	String msg = "ȸ�����Կ� ���� �Ͽ����ϴ�.";
	String location = "member.jsp";
	// ȸ������ ���� ���� �޽����� �̵��� �������� �̸� �����մϴ�.
	
	if(result){
		// ȸ�������� �������� ���
		msg = "ȸ�������� �Ͽ����ϴ�.";
		location = "login.jsp";
		// ���� ���� �޽����� �̵��� �������� �����մϴ�.
	}
%>

<script>
	alert("<%=msg%>");
	// JavaScript�� ����Ͽ� ȭ�鿡 �޽����� ǥ���մϴ�.
	
	location.href = "<%=location%>";
	// JavaScript�� ����Ͽ� ������ �������� �̵��մϴ�.
</script>
