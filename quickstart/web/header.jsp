<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
 User user = (User) session.getAttribute("user");
 pageContext.setAttribute("user",user);
%>
<ul>
    <li><a href="${pageContext.request.contextPath}/home">首页</a></li>
    <li><a href="#">浏览</a></li>
    <li><a href="#">访客</a></li>
    <li><a href="#">页面</a></li>
    <li><a href="#">读者</a></li>
    <li><a href="#">作者</a></li>
</ul>
<ul>
    <%
    if(user != null){
    %>
    <li style="margin-right: 5px">
        <a href="${pageContext.request.contextPath}/person.jsp">
            <img src="${pageContext.request.contextPath}/images/${user.avatar}" alt="" style="width: 40px;height: 40px;border-radius: 50%">
        </a>
    </li>
    <li style="margin-right: 30px;padding-top: 10px;font-size: 14px
">
      <a href="${pageContext.request.contextPath}/logout">退出</a>
    </li>
    <%
    }else{
        %>
    <a style="font-size: 16px;text-decoration: none;color: #eeeeee;margin-right: 30px" href="${pageContext.request.contextPath}/sign_in.html">去登陆</a>
    <%
    }
    %>
</ul>