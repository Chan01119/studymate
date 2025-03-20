<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<div class="index-header">
    <a href="${pageContext.request.contextPath}/index">
        <img src="${pageContext.request.contextPath}/image/header-logo.png" style="height: 35px"/>
    </a>
    <form action="${pageContext.request.contextPath}/study/search" style="margin: 0">
        <input type="text" name="word" style="border-radius: 20px; width:300px; padding:4px 15px;
background-color: #afafaf; color:white" placeholder="스터디 검색" value="${param.word}">
    </form>
    <div>
        <a href="${pageContext.request.contextPath}/auth/signup">회원가입</a>
        <a href="${pageContext.request.contextPath}/auth/login">
            <button type="button">로그인</button>
        </a>
    </div>
</div>
<div class="main">
    <div class="w-50">
        <img src="${pageContext.request.contextPath}/image/logo.png" class="w-100"/>
    </div>
    <h1>공부가 쉬워진다!<br/>
        우리끼리 스터디메이트</h1>
</div>
<div>

</div>
</body>
</html>
