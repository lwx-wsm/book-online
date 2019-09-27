<%@ page import="java.util.List" %>
<%@ page import="com.web.Book" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/9/24
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>首页</title>
  <style type="text/css">
    *{
      margin: 0px;
      padding: 0px;
    }
    body{
      color: #333;
    }
    header{
      height: 60px;
      background-color: rgb(89, 40, 105);
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-left: 10px;
      padding-right: 10px;

    }
    .nav{
      flex: 0 0 50%;
      list-style: none;
      display: flex;
    }
    .nav li{
      margin-left: 10px;
      margin-right: 10px;
      width: 50px;
    }
    .user-info{
      padding-right: 20px;
      color: #FFFFFF;
    }
    .nav li a{
      text-decoration: none;
      color: #eee;
    }
    .nav li a:hover{
      color: #fff;
    }
    .search-wrap{
      height: 60px;
      background-color: #ddd;
      display: flex;
      align-items: center;
      padding-left: 10%;
      margin-bottom: 10px;
    }
    .input-box{
      width: 350px;
      height: 35px;
      border: 1px solid #eee;
      border-radius: 5px;
      margin-left: 10px;
    }
    .container{
      width: 85%;
      margin: 0 auto;
      /*height: 600px;*/
      background-color: #eee;
      display: flex;
      padding: 5px 5px 5px 5px;
    }
    .box{
      flex: 0 0 20%;
      height: 280px;
      margin:5px 5px 5px 5px;

    }
    .box img{
      width:80%;
      height: 80%;
    }

    .left{
      flex: 0 0 66%;
      height: 90%;
      background-color: #FFFFFF;
      padding: 10px 10px 10px 10px;

    }
    .right{
      flex: 0 0 30%;
      margin-left: 15px;
      height: 100%;
      background-color: #aaa;
    }
    .row{
      display: flex;
      /*换行*/
      flex-wrap: wrap;
      padding: 5px 5px 5px 5px;
    }
    .column{
      flex: 0 0 18%;
      /* height: 150px;*/
      background-color: #AAAAAA;
      border: 1px solid #333333;
      border-radius: 10px;
      margin: 5px 5px 5px 5px;
    }
    footer{
      height: 100px;
      display: flex;
      background-color: #aaa;
      align-items: center;
      justify-content: center;
    }
  </style>
</head>
<body>
<header>
  <div>
    <ul class="nav">
      <li><a href="#">首页</a></li>
      <li><a href="#">浏览</a></li>
      <li><a href="#">话题</a></li>
      <li><a href="#">精品</a></li>
      <li><a href="#">消息</a></li>
    </ul>
  </div>
  <div class="user-info">
    <%
      String username = (String) session.getAttribute("username");
      if (username != null) {
        pageContext.setAttribute("username",username);
        %>
        ${username}
        <%
      }else{
         %>
         <h3><a href="${pageContext.request.contextPath}/">去登陆</a></h3>
         <%
      }
    %>
  </div>
</header>
<div class="search-wrap">
  <h2>读书时刻</h2>
  <input type="text" placeholder="输入要搜索的内容"class="input-box">
</div>
<div class="container">
  <div class="left">
    <h2>好书精选	</h2>
    <hr>

      <div class="column"><div class="row">
        <%
          List<Book> bookList = (List<Book>) request.getAttribute("bookList");
          pageContext.setAttribute("size",bookList.size());
        %>
        <%
           for (Book book : bookList)
           { pageContext.setAttribute("book",book);
        %>
        <div class="box">
          <img src="images/${book.cover}">
          <p>${book.name}</p>
          <p>${book.author}</p>
        </div>
        <%
          }
        %>
      </div>

    </div>
  </div>
  <div class="right">
        <h2>每日推荐(共${size}本书)</h2>
        <hr>
        <div ><div class="row">
          <%
            List<Book> bookList1 = (List<Book>) request.getAttribute("bookList");
            pageContext.setAttribute("size",bookList.size());
          %>
          <%
            for (Book book : bookList)
            { pageContext.setAttribute("book",book);
          %>
          <div class="box">
            <img src="images/${book.cover}">
            <p>${book.name}</p>
            <p>${book.author}</p>
          </div>
          <%
            }
          %>
        </div>
    </div>
  </div>

</div>
<footer>
  <p>南京工业职业技术学院</p>
</footer>
</body>
</html>
