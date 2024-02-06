<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- 위 코드는 JSP 페이지의 콘텐츠 타입을 HTML로 설정하고, 문자셋을 EUC-KR로 지정합니다. -->

<%@page import="ch14.ZipcodeBean"%>
<!-- ch14 패키지의 ZipcodeBean 클래스를 import합니다. -->

<%@page import="java.util.Vector"%>
<!-- java.util 패키지의 Vector 클래스를 import합니다. -->

<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<!-- ch14 패키지의 MemberMgr 클래스를 사용하기 위해 JSP 빈을 생성합니다. -->

<%
	request.setCharacterEncoding("EUC-KR");
	// 요청된 데이터의 문자 인코딩을 EUC-KR로 설정합니다.

	String search = request.getParameter("search");
	String area3 = null;
	Vector<ZipcodeBean> vlist = null;
	// 검색 결과를 저장할 Vector 객체를 선언합니다.

	if (search.equals("y")) {
		// 검색을 요청받았을 경우
		area3 = request.getParameter("area3");
		// 입력된 도로명을 가져옵니다.
		vlist = mMgr.zipcodeRead(area3);
		// MemberMgr 클래스의 zipcodeRead 메서드를 호출하여 도로명에 해당하는 우편번호 목록을 가져옵니다.
	}
%>

<html>
<head>
<title>우편번호 검색</title>
<!-- HTML 문서의 제목을 "우편번호 검색"으로 설정합니다. -->
<link href="style.css" rel="stylesheet" type="text/css">
<!-- 외부 스타일 시트 파일("style.css")을 연결하여 페이지의 스타일을 정의합니다. -->
<script type="text/javascript">
	function loadSearch() {
		// 도로명 검색을 수행하는 JavaScript 함수입니다.
		frm = document.zipFrm;
		if (frm.area3.value == "") {
			// 도로명이 입력되지 않았을 경우 경고 메시지를 표시하고 포커스를 해당 필드로 이동합니다.
			alert("도로명을 입력하세요.");
			frm.area3.focus();
			return;
		}
		frm.action = "zipSearch.jsp"
		frm.submit();
		// 도로명이 입력되었을 경우 폼의 action을 "zipSearch.jsp"로 설정하고 폼을 제출합니다.
	}

	function sendAdd(zipcode, adds) {
		// 검색된 우편번호를 부모 창에 전달하는 JavaScript 함수입니다.
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
		// 부모 창의 우편번호와 주소 필드에 값을 설정하고 현재 창을 닫습니다.
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<!-- HTML 문서의 본문을 나타냅니다. 배경색을 연한 노란색으로 설정합니다. -->
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br/>도로명 입력 : <input name="area3">
					 <input type="button" value="검색" onclick="loadSearch();">
					 </td>
				</tr>
				<!-- 검색결과 시작 -->
				<%
					if (search.equals("y")) {
							if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br/>검색된 결과가 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="center"><br/>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
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
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
			<!-- 검색 여부를 나타내는 hidden 필드를 추가하고 값을 "y"로 설정합니다. -->
		</form>
	</div>
</body>
</html>
<!-- HTML 문서를 닫습니다. -->
