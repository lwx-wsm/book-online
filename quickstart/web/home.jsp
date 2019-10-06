<%@ page import="entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Author" %><%--
  Created by IntelliJ IDEA.
  User: wfzs
  Date: 2019/10/2
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        @font-face {
            font-family: 'iconfont';  /* project id 1432359 */
            src: url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.eot');
            src: url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.eot?#iefix') format('embedded-opentype'),
            url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.woff2') format('woff2'),
            url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.woff') format('woff'),
            url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.ttf') format('truetype'),
            url('//at.alicdn.com/t/font_1432359_3d1uq5siuiz.svg#iconfont') format('svg');
        }
        .iconfont{
            font-family:"iconfont" !important;
            font-size:20px;font-style:normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;}
        *{
            margin: 0;
            padding: 0;
        }
        .top{
            display: flex;
            justify-content: space-between;
            background-color: #81c784;
            width: 100%;
            height: 60px;
            align-items: center;
        }
        .top ul{
            display: flex;
            list-style: none;
            padding-left: 30px;
            padding-right: 10px;
        }
        .top ul li{
            margin-right: 10px;
            flex: 0 0 60px;
        }
        .top ul li a{
            text-decoration: none;
            color: white;
        }
        .search-wrap{
            width: 100%;
            height: 80px;
            padding-left: 10%;
            background-color: #b2dfdb;
            /*文本垂直居中*/
            line-height: 80px;
        }
        .search-text{
            width: 160px;
            height: 25px;
            align-items: center;
        }
        .container{
            position: absolute;
            width: 80%;
            display: flex;
            left: 10%;
            right: 10%;
        }
        .btn{
            border: none;
            width: 20px;
            height: 20px;
            background:transparent;
        }
        .left{
            flex:0 0 60%;
            margin-right: 10px;
        }
        .right{
            flex: 0 0 36%;
        }
        .row{
            display: flex;
            padding: 5px 5px 5px 5px;
            flex-wrap: wrap;
        }
        .column{
            flex: 0 0 18%;

        }
        .card {
            height: 180px;
            margin: 20px 5px 20px 5px;
        }
        .card img {
            width: 100%;
            height: 70%;
        }
        .card p {
            text-align: center;
            margin-top: 5px;
            font-size: 13px;
            color: #9b9b9b;
        }
        .column-2{
            flex: 0 0 50%;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .avatar{
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right:10px;
        }
        .care-btn{
            width: 60px;
            height: 25px;
            border-radius: 10px;
            border: 1px solid #20a162;
            color: #20a162;
            background:transparent;
            text-align: center;
            font-size: 12px;
            margin-top: 10px;
            margin-right: 60px;
        }
    </style>
</head>
<body>
<div class="top">
   <jsp:include page="header.jsp"/>
</div>
<div class="search-wrap">
<p style="font-size: 30px;align-items: center">读书时刻:
    <input placeholder="搜索你喜欢的书" type="text" class="search-text" id="search">
    <button type="button" class="btn" onclick="getByName()"><i class="iconfont">&#xe61e;</i></button>
</p>
</div>
<div class="container">
    <div class="left">
        <p style="font-size: 20px;margin-bottom: 5px;margin-top: 10px">精选书籍</p>
        <hr>
    <div class="row">
        <%
            List<Book> bookList = (List<Book>) request.getAttribute("bookList");
            for (Book book : bookList) {
                pageContext.setAttribute("book", book);
        %>
        <div class="column card">
            <a href="${pageContext.request.contextPath}/detail/${book.id}">
                <img src="images/${book.cover}" alt=""></a>
            <p style="color: rgb(51, 119, 178)">${book.name}</p>
            <p>${book.author}</p>
        </div>
        <%
            }
        %>
    </div>
    </div>
    <div class="right">
        <div class="row">
        <%
            List<Author> authorList = (List<Author>) request.getAttribute("authorList");
            for (Author author : authorList) {
                pageContext.setAttribute("author", author);
        %>
        <div class="column-2">
            <img  class="avatar" src="images/${author.cover}" alt="">
            <p style="margin-left: 60px;margin-top: -40px;font-size: 14px">${author.nickname}</p>
        </div>
        <div class="column-2">
            <p style="direction: rtl">
<%--                change(this),this是获取当前的值--%>
                <input type="button"class="care-btn" name="care" onclick="change(this)"value="关注" id="myButton">
<%--                <i class="iconfont" style="color: #20a162;margin-right:60px;margin-top:-30px;font-size: 12px">&#xe61c;</i>--%>
            </p>
        </div>
        <%
            }
        %>
        </div>
    </div>
</div>
</body>
<script>
    function getByName() {
        var bookName = document.getElementById("search");
        var value = bookName.value;
        location.href = "home?bookName="+value;
    }
    function change(elem) {
        if(elem.value=="关注") elem.value = "已关注";
        else elem.value = "关注";

    }
</script>
</html>
