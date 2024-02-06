<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- �� �ڵ�� JSP �������� ������ Ÿ���� HTML�� �����ϰ�, ���ڼ��� EUC-KR�� �����մϴ�. -->

<%
	request.setCharacterEncoding("EUC-KR");
	// ��û�� �������� ���� ���ڵ��� EUC-KR�� �����մϴ�.
	String id = (String)session.getAttribute("idKey");
	// ���ǿ��� "idKey" �Ӽ��� ���� ����� ���̵� �����ɴϴ�.
%>

<html>
<head>
<title>�α���</title>
<!-- HTML ������ ������ "�α���"���� �����մϴ�. -->
<link href="style.css" rel="stylesheet" type="text/css">
<!-- �ܺ� ��Ÿ�� ��Ʈ ����("style.css")�� �����Ͽ� �������� ��Ÿ���� �����մϴ�. -->
<script type="text/javascript">
	function loginCheck() {
		// �α��� ���� �Է� ���� ��ȿ���� �˻��ϴ� JavaScript �Լ��Դϴ�.
		if (document.loginFrm.id.value == "") {
			// ���̵� �Էµ��� �ʾ��� ��� ��� �޽����� ǥ���ϰ� ���̵� �ʵ忡 ��Ŀ���� �̵��մϴ�.
			alert("���̵� �Է��� �ּ���.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			// ��й�ȣ�� �Էµ��� �ʾ��� ��� ��� �޽����� ǥ���ϰ� ��й�ȣ �ʵ忡 ��Ŀ���� �̵��մϴ�.
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
		// �Է� ���� ��ȿ�� ��� �α��� ���� ������ �����մϴ�.
	}
</script>
</head>
<body bgcolor="#ffffcc">
<!-- HTML ������ ������ ��Ÿ���ϴ�. ������ ���� ��������� �����մϴ�. -->
<div align="center"><br/><br/>
	<%if (id != null) {%>
	<!-- ���� ���ǿ��� ������ ���̵� null�� �ƴ� ��� -->
	<b><%=id%></b>�� ȯ�� �մϴ�.
	<!-- ȯ�� �޽����� ǥ���մϴ�. -->
	<p>���ѵ� ����� ��� �� ���� �ֽ��ϴ�.<p/>
	<a href="logout.jsp">�α׾ƿ�</a>
	<!-- �α׾ƿ� ��ũ�� �����մϴ�. -->
	<%} else {%>
	<!-- ���ǿ��� ������ ���̵� null�� ���(�α����� �ȵ� ���) -->
	<form name="loginFrm" method="post" action="loginProc.jsp">
	<!-- �α��� ���� �����ϰ�, �����ʹ� "loginProc.jsp"�� ����˴ϴ�. -->
		<table>
			<tr>
				<td align="center" colspan="2"><h4>�α���</h4></td>
			</tr>
			<tr>
				<td>�� �� ��</td>
				<td><input name="id"></td>
				<!-- ���̵� �Է� �ʵ带 �����մϴ�. -->
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pwd"></td>
				<!-- ��й�ȣ �Է� �ʵ带 �����մϴ�. -->
			</tr>
			<tr>
				<td colspan="2">
					<div align="right">
						<input type="button" value="�α���" onclick="loginCheck()">&nbsp;
						<!-- �α��� ��ư, Ŭ�� �� loginCheck() �Լ� ȣ�� -->
						<input type="button" value="ȸ������" onClick="javascript:location.href='member.jsp'">
						<!-- ȸ������ ��ư, Ŭ�� �� member.jsp�� �̵� -->
					</div>
				</td>
			</tr>
		</table>
	</form>
	<%}%>
	<!-- if�� ���� -->
	</div>
</body>
</html>
<!-- HTML ������ �ݽ��ϴ�. -->
