<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- 위 코드는 JSP 페이지의 콘텐츠 타입을 HTML로 설정하고, 문자셋을 EUC-KR로 지정합니다. -->

<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}

	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
	</script>
	</head>
	<body bgcolor="#CCCCCC" onLoad="regFrm.id.focus()">
		<div align="center">
			<br /><br />
			<form name="regFrm" method="post" action="memberProc.jsp">
				<table cellpadding="5">
					<tr>
						<td bgcolor="#FFFFFF">
							<table border="1" cellspacing="0" cellpadding="2" width="600">
								<tr bgcolor="#FFCCCC">
									<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
								</tr>
								<tr>
									<td width="20%">아이디</td>
									<td width="50%">
										<input name="id" size="15"> 
										<input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)">
									</td>
									<td width="30%">아이디를 적어 주세요.</td>
								</tr>
								<tr>
									<td>패스워드</td>
									<td><input type="password" name="pwd" size="15"></td>
									<td>패스워드를 적어주세요.</td>
								</tr>
								<tr>
									<td>패스워드 확인</td>
									<td><input type="password" name="repwd" size="15"></td>
									<td>패스워드를 확인합니다.</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input name="name" size="15"></td>
									<td>이름을 적어주세요.</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
										남<input type="radio" name="gender" value="1" checked> 
										여<input type="radio" name="gender" value="2">
									</td>
									<td>성별을 선택하세요.</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input name="birthday" size="6">
										ex)940214</td>
									<td>생년월일를 적어 주세요.</td>
								</tr>
								<tr>
									<td>Email</td>
									<td><input name="email" size="30"></td>
									<td>이메일를 적어 주세요.</td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td>
										<input name="zipcode" size="5" readonly>
										<input type="button" value="우편번호찾기" onClick="zipSearch()">
									</td>
									<td>우편번호를 검색하세요.</td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input name="address" size="45"></td>
									<td>주소를 적어 주세요.</td>
								</tr>
								<tr>
									<td>취미</td>
									<td>
										<select name="job">
											<option value="0" selected>선택하세요.</option>
											<option value="로스트아크">로스트아크</option>
											<option value="서든어택">서든어택</option>
											<option value="리그오브레전드">리그오브레전드</option>
											<option value="발로란트">발로란트</option>
											<option value="리썰컴퍼니">리썰컴퍼니</option>
											<option value="GTA5">GTA5</option>
											<option value="FC온라인">FC온라인</option>
											<option value="메이플스토리">메이플스토리</option>
										</select>
									</td>
									<td>취미를 선택하세요.</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
									   <input type="button" value="회원가입" onclick="inputCheck()">
									   &nbsp; &nbsp; 
									   <input type="reset" value="다시쓰기">
									   &nbsp; &nbsp; 
									   <input type="button" value="로그인" onClick="javascript:location.href='login.jsp'">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
	</html>