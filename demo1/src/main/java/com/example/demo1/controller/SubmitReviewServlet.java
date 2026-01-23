package com.example.demo1.controller;

import com.example.demo1.dao.NotificationDao;
import com.example.demo1.dao.ProductDao;
import com.example.demo1.dao.ReviewDao;
import com.example.demo1.model.Notification;
import com.example.demo1.model.Product;
import com.example.demo1.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SubmitReviewServlet", value = "/submit-review")
public class SubmitReviewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false); // Lấy session hiện có, không tạo mới
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user"); // Sửa khóa từ "user" thành "auth"
        }

        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (user == null) {
            // Nếu chưa, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            int userId = user.getId();

            ReviewDao reviewDao = new ReviewDao();
            reviewDao.addReview(productId, userId, rating, comment);

            try {
                NotificationDao notiDao = new NotificationDao();

                ProductDao productDao = new ProductDao();
                Product product = productDao.getById(productId);
                String productName = (product != null) ? product.getName() : "Sản phẩm " + productId;

                // Nội dung thông báo
                String adminContent = "Đánh giá mới " + rating + "* cho: " + productName;
                String adminLink = "admin/reviews"; // Link đến trang quản lý đánh giá

                // Tạo thông báo: userId = null, targetRole = 1 (Admin)
                Notification adminNoti = new Notification(null, adminContent, adminLink, 1);
                notiDao.insert(adminNoti);

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("product-detail?id=" + productId);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp"); // Hoặc trang lỗi
        }
    }
}
