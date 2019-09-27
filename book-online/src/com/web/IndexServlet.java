package com.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book[] books = {
                new Book("修罗武神","1.jpg","善良的蜜蜂"),
                new Book("重生都市","2.jpg","梦中笔、"),
                new Book("我的绝色总裁未婚妻","3.jpg","花幽山月"),
                new Book("修罗武神","1.jpg","善良的蜜蜂"),
                new Book("重生都市","2.jpg","梦中笔、"),
                new Book("我的绝色总裁未婚妻","3.jpg","花幽山月"),
                new Book("修罗武神","1.jpg","善良的蜜蜂"),
                new Book("重生都市","2.jpg","梦中笔、"),
                new Book("我的绝色总裁未婚妻","3.jpg","花幽山月"),
                new Book("修罗武神","1.jpg","善良的蜜蜂"),
                new Book("重生都市","2.jpg","梦中笔、"),
                new Book("我的绝色总裁未婚妻","3.jpg","花幽山月")
       };
       List<Book> bookList = Arrays.asList(books);
        req.setAttribute("bookList",bookList);
        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }
}
