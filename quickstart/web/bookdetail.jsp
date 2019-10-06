<%@ page import="entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="service.BookService" %><%--
  Created by IntelliJ IDEA.
  User: wfzs
  Date: 2019/10/4
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书详情</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
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
        .top{
            display: flex;
            justify-content: space-between;
            background-color: #ffccbc;
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
            margin-right: 20px;
            flex: 0 0 60px;
        }
        .top ul li a{
            text-decoration: none;
            color: white;
        }
        .search-wrap{
            display: flex;
            width: 100%;
            height: 80px;
            padding-left: 5%;
            background-color: #dcedc8;
            /*文本垂直居中*/
            line-height: 80px;
            justify-content: space-between;
        }
        .container{
            width: 80%;
            height: 100%;
            display: flex;
            margin-left: 10%;
            margin-right: 10%;
        }
        .right{
            flex: 0 0 30%;
            padding: 5px 5px 5px 5px;
            border: 1px solid #aaaaaa;
        }
        .left{
            flex: 0 0 70%;
            padding-top: 10px;
            border: 1px solid #aaaaaa;
        }
        .header{
            width: 80%;
            height: 120px;
            margin-left: 10%;
            margin-right: 10%;
            margin-bottom: 30px;
        }
        .card {
            height: 120px;
            width: 100px;
        }
        .card img {
            width: 100%;
            height: 100%;
        }
        .bq{
            font-family: 楷体;
            padding-left: 30px;
            margin-top:30px;
            width: 180px;
            line-height: 30px;
            border-top-right-radius:90px;
            height: 30px;
            background-color: #f9f1db
        }
        .dl{
            font-family: 楷体;
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
            font-size:16px;
            margin-top:20px;
            letter-spacing: 3px
        }
        .search-text{
            width: 160px;
            height: 25px;
            align-items: center;
        }
        .btn{
            border: none;
            width: 20px;
            height: 20px;
            background:transparent;
        }
        .column{
            flex: 0 0 30%;

        }
        .card {
            height: 120px;
            margin: 20px 5px 20px 5px;
        }
        .card img {
            width: 100%;
            height: 70%;
        }
        .card p {
            text-align: center;
            font-size: 13px;
            color: #9b9b9b;
        }
        .row{
            display: flex;
            padding: 5px 5px 5px 5px;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
<%
    Book book = (Book) request.getAttribute("book");
    pageContext.setAttribute("book", book);
%>
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
        <div class="header">
            <span><img src="/images/${book.cover}" alt="" class="card"></span>
            <p style="font-size:16px;margin-left: 150px;margin-top: -140px">作者：${book.author}</p>
            <p style="font-size:16px;margin-left: 150px;margin-top: 10px">出版社：清华出版社</p>
            <p style="font-size:16px;margin-left: 150px;margin-top: 10px">章数：120章</p>
            <p style="font-size:16px;margin-left: 150px;margin-top: 10px">发布日期：2015年5月20日</p>

        </div>
        <div style="margin-top: 20px" class="bq">
            名言警句···
        </div>
        <p class="dl">
            <t>真理惟一可靠的标准就是永远自相符合。 —— 欧文</t>
            <t>土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。 —— 别林斯基</t>
            <t>我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。 —— 蒙田</t>
            <t>时间是一切财富中最宝贵的财富。 —— 德奥弗拉斯多</t>
        </p>
        <div class="bq">
            读书心得···
        </div>
        <p class="dl">
            《昆虫记》也叫做《昆虫物语》、《昆虫学札记》和《昆虫世界》，是法国杰出昆虫学家法布尔的传世佳作，也是一部不朽的著作。它不仅是一部文学巨著，也是一部科学百科。
            法布尔以毕生的时间与精力，通过仔细地观察后，深刻地描绘了多种昆虫的生活：歌唱家蝉、音乐家蟋蟀、勤劳的舍腰蜂、美丽的大孔雀蛾真实地记录了昆虫的本能、习性、劳动、婚姻、繁衍和死亡。它行文生动活泼，语调轻松诙谐，令人入目难忘。
        </p>
    </div>

    <div class="right">
    <h3>每日推荐:</h3>
        <hr>
        <div class="row">
        <%
            List<Book> bookList = BookService.init();
            for (Book book1 : bookList) {
                if(book1.getId().equals(book.getId())){
                    continue;
                }
                if(book1.getId()>=11){
                    break;
                }
                pageContext.setAttribute("book1", book1);
        %>
        <div class="column card">
            <a href="${pageContext.request.contextPath}/detail/${book1.id}">
<%--                相对路径--%>
                <img src="/images/${book1.cover}" alt=""></a>
            <p style="color: rgb(51, 119, 178)">${book1.name}</p>
            <p>${book1.author}</p>
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
</script>
</html>
