<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechNova Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/adminDashBoard.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/headerAndSidebar.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/adminNotification.css">
</head>
<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo">
        <a href="${contextPath}/admin/dashboard">
            <img src="https://i.postimg.cc/Hn4Jc3yj/logo-2.png" alt="TechNova Logo">
        </a>
        <a href="${contextPath}/admin/dashboard" style="text-decoration: none;">
            <span class="logo-text">TechNova</span>
        </a>
    </div>

    <ul class="nav-menu">
        <li class="nav-item"><a href="${contextPath}/admin/dashboard" class="nav-link active"><span class="nav-icon"><i
                class="fa-solid fa-border-all"></i></span>Dashboard</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/customers" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-users"></i></span>Khách hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/categories" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-list"></i></span>Mục sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/brands" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-certificate"></i></span>Thương hiệu</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/attributes" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-sliders"></i></span>Thuộc tính</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/banners" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-images"></i></span>Banner</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/products" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-box-open"></i></span>Sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/orders" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-clipboard-list"></i></span>Đơn hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/reviews" class="nav-link"><span class="nav-icon"><i
                class="fa-solid fa-star"></i></span>Đánh giá</a></li>

    </ul>

    <div class="logout-section">
        <a href="${contextPath}/logout" class="nav-link logout-link"><span class="nav-icon"><i
                class="fa-solid fa-right-from-bracket"></i></span>Đăng xuất</a>
    </div>
</aside>

<!-- Header -->
<header class="header">
    <div class="header-actions">
        <button class="notification-btn" id="notificationBtn">
            <i class="fa-solid fa-bell"></i>
            <c:if test="${adminUnreadCount > 0}">
                <span class="notification-badge">${adminUnreadCount}</span>
            </c:if>
        </button>
        <div class="notification-dropdown" id="notificationDropdown">
            <div class="notification-header">
                <h3>Thông báo</h3>
            </div>

            <div class="notification-list">
                <c:if test="${empty adminNotiList}">
                    <p style="padding: 10px; text-align: center;">Không có thông báo mới</p>
                </c:if>

                <c:forEach var="noti" items="${adminNotiList}">
                    <div class="notification-item ${noti.isRead == 0 ? 'unread' : ''}"
                         onclick="window.location.href='${contextPath}/admin/mark-read?id=${noti.id}&target=' + encodeURIComponent('${noti.link}')">

                        <div class="notification-icon">
                            <c:choose>
                                <c:when test="${noti.content.toLowerCase().contains('hủy')}">
                                    <i class="fa-solid fa-circle-xmark" style="color: #4c4747;;"></i>
                                </c:when>
                                <c:when test="${noti.content.toLowerCase().contains('mới')}">
                                    <i class="fa-solid fa-cart-shopping" style="color: #4c4747;"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-solid fa-bell" style="color: #4c4747;;"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="notification-content">
                            <p class="notification-text">${noti.content}</p>
                            <span class="notification-time">${noti.createdAt}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="notification-footer">
                <a href="adminAllNotification.jsp" class="see-all-link">Xem tất cả thông báo</a>
            </div>
        </div>
        <div class="user-profile">
            <img src="https://www.shutterstock.com/image-vector/admin-icon-strategy-collection-thin-600nw-2307398667.jpg"
                 alt="User Profile">
        </div>
    </div>

</header>

<!-- Main Content -->
<main class="main-content">
    <div class="content-area">
        <h1 class="page-title">Dashboard</h1>
        <div class="breadcrumb">
            <a href="adminDashboard.html">Trang chủ</a> / <span>Dashboard</span>
        </div>

        <!-- Các thẻ tiêu chí -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon" style="background: linear-gradient(135deg, #00c9a7 0%, #5b86e5 100%);">
                    <i class="fa-solid fa-hand-holding-dollar"></i>
                </div>
                <div class="stat-info">
                    <h3 class="stat-label">Tổng doanh thu</h3>
                    <p class="stat-value">
                        <fmt:formatNumber value="${revenue}" type="number" pattern="#,##0"/>đ
                    </p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);">
                    <i class="fa-solid fa-shopping-bag"></i>
                </div>
                <div class="stat-info">
                    <h3 class="stat-label">Tổng đơn hàng</h3>
                    <p class="stat-value">${totalOrders}</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                    <i class="fa-solid fa-users"></i>
                </div>
                <div class="stat-info">
                    <h3 class="stat-label">Tổng khách hàng</h3>
                    <p class="stat-value">${totalCustomers}</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                    <i class="fa-solid fa-box-open"></i>
                </div>
                <div class="stat-info">
                    <h3 class="stat-label">Sản phẩm đang bán</h3>
                    <p class="stat-value">${activeProducts}</p>
                </div>
            </div>
        </div>

        <!-- Charts Row -->
<%--        <div class="charts-row">--%>
<%--            <!-- Tổng doanh số -->--%>
<%--            <div class="chart-card">--%>
<%--                <div class="chart-header">--%>
<%--                    <h3 class="chart-title">Tổng doanh số</h3>--%>
<%--                    <div class="chart-tabs">--%>
<%--                        <button class="chart-tab active">7 Ngày</button>--%>
<%--                        <button class="chart-tab">Tháng</button>--%>
<%--                        <button class="chart-tab">Năm</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="chart-container">--%>
<%--                    <!-- Thay canvas bằng img -->--%>
<%--                    <img src="https://i.postimg.cc/J0RZc56z/Screenshot-2025-11-11-232332.png"--%>
<%--                         alt="Biểu đồ tổng doanh số" class="chart-image">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Monthly Statistics -->--%>
<%--            <div class="chart-card">--%>
<%--                <div class="chart-header">--%>
<%--                    <h3 class="chart-title">Thống kê tháng</h3>--%>
<%--                    <label>--%>
<%--                        <select class="time-select">--%>
<%--                            <option>7 ngày gần đây</option>--%>
<%--                            <option>30 ngày gần đây</option>--%>
<%--                            <option>90 ngày gần đây</option>--%>
<%--                        </select>--%>
<%--                    </label>--%>
<%--                </div>--%>
<%--                <div class="stats-legend">--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #fbbf24;"></span>--%>
<%--                            <span class="legend-label">Lợi nhuận</span>--%>
<%--                        </div>--%>
<%--                        <span class="legend-value">13,570</span>--%>
<%--                    </div>--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #5b86e5;"></span>--%>
<%--                            <span class="legend-label">Hoàn trả</span>--%>
<%--                        </div>--%>
<%--                        <span class="legend-value">455,877</span>--%>
<%--                    </div>--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #00c9a7;"></span>--%>
<%--                            <span class="legend-label">Chi phí</span>--%>
<%--                        </div>--%>
<%--                        <span class="legend-value">455,877</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="chart-container">--%>
<%--                    <img src="https://i.postimg.cc/1XywcrCR/Screenshot-2025-11-11-232516.png"--%>
<%--                         alt="Biểu đồ thống kê tháng" class="chart-image">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Revenue Chart -->--%>
<%--            <div class="chart-card full-width">--%>
<%--                <div class="chart-header">--%>
<%--                    <h3 class="chart-title">Doanh thu</h3>--%>
<%--                    <select class="time-select">--%>
<%--                        <option>7 ngày gần đây</option>--%>
<%--                        <option>30 ngày gần đây</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="stats-legend">--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #fbbf24;"></span>--%>
<%--                            <span class="legend-label">Khách</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #00c9a7;"></span>--%>
<%--                            <span class="legend-label">Bán hàng</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="legend-item">--%>
<%--                        <div class="legend-item-header">--%>
<%--                            <span class="legend-dot" style="background: #5b86e5;"></span>--%>
<%--                            <span class="legend-label">Lợi nhuận</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="chart-container">--%>
<%--                    <img src="https://i.postimg.cc/XqndckHv/Screenshot-2025-11-11-232534.png" alt="Biểu đồ doanh thu"--%>
<%--                         class="chart-image">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</main>
<%--<script src="adminjs/adminNotification.js"></script>--%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const btn = document.getElementById("notificationBtn");
        const dropdown = document.getElementById("notificationDropdown");

        btn.addEventListener("click", function(e) {
            e.stopPropagation();
            dropdown.classList.toggle("show");
        });

        document.addEventListener("click", function(e) {
            if (!dropdown.contains(e.target) && !btn.contains(e.target)) {
                dropdown.classList.remove("show");
            }
        });
    });
</script>
</body>
</html>