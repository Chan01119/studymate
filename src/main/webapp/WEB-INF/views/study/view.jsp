<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>스터디 만들기 | 스터디메이트</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<div class="bottom-border-div">
  <div class="index-header wrap">
    <div style="display:flex; gap:15px; align-items: center">
      <a href="${pageContext.request.contextPath}/index">
        <img src="${pageContext.request.contextPath}/image/header-logo.png" style="height: 35px"/>
      </a>
      <form action="${pageContext.request.contextPath}/study/search" style="margin: 0">
        <input type="text" name="word" style="border-radius: 20px; width:300px; padding:4px 15px;
background-color: #afafaf; color:white" placeholder="스터디 검색" value="${param.word}">
      </form>
    </div>
    <div>
      <a href="${pageContext.request.contextPath}/my/profile">
        <img src="${pageContext.request.contextPath}${userAvatar.imageUrl}" style="height: 35px"/>
      </a>
    </div>
  </div>
</div>
<div>
  <div class="study-main wrap">
    <div style="display: flex; gap:20px">
      <div style="width: 200px">
        <h2>${group.name}</h2>
        <div style="font-size : 0.8em">
          멤버 <span>${group.memberCount}</span>
        </div>
        <div style="font-size : 0.8em">
          개설일 <span>${group.createdAt}</span>
        </div>
        <c:choose>
          <c:when test="${status == 'NOT_JOINED'}">
            <p>
              <a href="${pageContext.request.contextPath}/study/${group.id}/join">
                <button style="width: 100%; padding: 5px; font-size: 1em;">스터디가입하기</button>
              </a>
            </p>
          </c:when>
          <c:when test="${status == 'PENDING'}">
          <button style="width: 100%; padding: 5px; font-size: 1em;">승인대기중</button>
          </c:when>
          <c:when test="${status == 'MEMBER'}">
            <button style="width: 100%; padding: 5px; font-size: 1em;">스터디 탈퇴하기</button>
          </c:when>
          <c:otherwise>
            <button style="width: 100%; padding: 5px; font-size:1em;" disabled>스터티 해산하기</button>
          </c:otherwise>
        </c:choose>
        <p>
          <button>스터디가입하기</button>
        </p>
        <div style="font-size: 0.75em">
          누구나 스터디를 검색해 찾을 수 있고, 가입할 수 있습니다.
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
