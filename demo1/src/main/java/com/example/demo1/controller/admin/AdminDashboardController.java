package com.example.demo1.controller.admin;

import com.example.demo1.dao.OrderDao;
import com.example.demo1.dao.ProductDao;
import com.example.demo1.dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminDashboardController", value = "/admin/dashboard")
public class AdminDashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao orderDao = new OrderDao();
        UserDao userDao = new UserDao();
        ProductDao productDao = new ProductDao();

        // Lấy dữ liệu từ các DAO
        double revenue = orderDao.getTotalRevenue();
        int orders = orderDao.getTotalOrdersCount();
        int customers = userDao.getTotalCustomersCount();
        int activeProducts = productDao.getActiveProductsCount();

        // Gắn dữ liệu vào request scope
        request.setAttribute("revenue", revenue);
        request.setAttribute("totalOrders", orders);
        request.setAttribute("totalCustomers", customers);
        request.setAttribute("activeProducts", activeProducts);

        // Chuyển hướng sang trang JSP
        request.getRequestDispatcher("/admin/adminDashboard.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}