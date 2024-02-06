<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- �� �ڵ�� JSP �������� ������ Ÿ���� HTML�� �����ϰ�, ���ڼ��� EUC-KR�� �����մϴ�. -->

<%@page import="ch14.ZipcodeBean"%>
<!-- ch14 ��Ű���� ZipcodeBean Ŭ������ import�մϴ�. -->

<%@page import="java.util.Vector"%>
<!-- java.util ��Ű���� Vector Ŭ������ import�մϴ�. -->

<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<!-- ch14 ��Ű���� MemberMgr Ŭ������ ����ϱ� ���� JSP ���� �����մϴ�. -->

<%
	request.setCharacterEncoding("EUC-KR");
	// ��û�� �������� ���� ���ڵ��� EUC-KR�� �����մϴ�.

	String search = request.getParameter("search");
	String area3 = null;
	Vector<ZipcodeBean> vlist = null;
	// �˻� ����� ������ Vector ��ü�� �����մϴ�.

	if (search.equals("y")) {
		// �˻��� ��û�޾��� ���
		area3 = request.getParameter("area3");
		// �Էµ� ���θ��� �����ɴϴ�.
		vlist = mMgr.zipcodeRead(area3);
		// MemberMgr Ŭ������ zipcodeRead �޼��带 ȣ���Ͽ� ���θ� �ش��ϴ� �����ȣ ����� �����ɴϴ�.
	}
%>

<html>
<head>
<title>�����ȣ �˻�</title>
<!-- HTML ������ ������ "�����ȣ �˻�"���� �����մϴ�. -->
<link href="style.css" rel="stylesheet" type="text/css">
<!-- �ܺ� ��Ÿ�� ��Ʈ ����("style.css")�� �����Ͽ� �������� ��Ÿ���� �����մϴ�. -->
<script type="text/javascript">
	function loadSearch() {
		// ���θ� �˻��� �����ϴ� JavaScript �Լ��Դϴ�.
		frm = document.zipFrm;
		if (frm.area3.value == "") {
			// ���θ��� �Էµ��� �ʾ��� ��� ��� �޽����� ǥ���ϰ� ��Ŀ���� �ش� �ʵ�� �̵��մϴ�.
			alert("���θ��� �Է��ϼ���.");
			frm.area3.focus();
			return;
		}
		frm.action = "zipSearch.jsp"
		frm.submit();
		// ���θ��� �ԷµǾ��� ��� ���� action�� "zipSearch.jsp"�� �����ϰ� ���� �����մϴ�.
	}

	function sendAdd(zipcode, adds) {
		// �˻��� �����ȣ�� �θ� â�� �����ϴ� JavaScript �Լ��Դϴ�.
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
		// �θ� â�� �����ȣ�� �ּ� �ʵ忡 ���� �����ϰ� ���� â�� �ݽ��ϴ�.
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<!-- HTML ������ ������ ��Ÿ���ϴ�. ������ ���� ��������� �����մϴ�. -->
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br/>���θ� �Է� : <input name="area3">
					 <input type="button" value="�˻�" onclick="loadSearch();">
					 </td>
				</tr>
				<!-- �˻���� ���� -->
				<%
					if (search.equals("y")) {
							if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br/>�˻��� ����� �����ϴ�.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="center"><br/>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
				</tr>
				<%
					for (int i = 0; i < vlist.size(); i++) {
							ZipcodeBean bean = vlist.get(i);
							String rZipcode = bean.getZipcode();
							String rArea1 = bean.getArea1();
							String rArea2 = bean.getArea2();
							String rArea3 = bean.getArea3();
							String adds = rArea1 + " " + rArea2 + " " + rArea3 + " ";
				%>
				<tr>
					<td><a href="#"
						onclick="javascript:sendAdd('<%=rZipcode%>','<%=adds%>')">
							<%=rZipcode%> <%=adds%></a></td>
				</tr>
				<%
					}//for
						}//if
					}//if
				%>
				<!-- �˻���� �� -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
			<!-- �˻� ���θ� ��Ÿ���� hidden �ʵ带 �߰��ϰ� ���� "y"�� �����մϴ�. -->
		</form>
	</div>
</body>
</html>
<!-- HTML ������ �ݽ��ϴ�. -->
