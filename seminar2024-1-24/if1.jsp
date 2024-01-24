<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>If-else Example</h1>

<%!
    String msg;
%>

<%
	request.setCharacterEncoding("EUC-KR");
    String name = request.getParameter("name");
    String color = request.getParameter("color");

    if (color != null) {
        if (color.equals("blue")) {
            msg = "파란색";
        } else if (color.equals("red")) {
            msg = "붉은색";
        } else if (color.equals("orange")) {
            msg = "오렌지색";
        } else {
            color = "white";
            msg = "기타색";
        }
    } else {
        // 만약 요청에서 color 매개변수가 제공되지 않았다면, 기본 값으로 설정
        color = "white";
        msg = "색상 미지정";
    }
%>

<body bgcolor="<%=color%>">
<b><%=name%></b>님이 좋아하는 색깔은 <b><%=msg%></b>입니다.
</body>
