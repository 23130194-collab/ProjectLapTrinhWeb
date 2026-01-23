<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.demo1.model.CartItem" %>

<%
    // Tính tổng số lượng sản phẩm trong giỏ
    int totalQuantity = 0;
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cart != null) {
        for (CartItem item : cart.values()) {
            totalQuantity += item.getQuantity();
        }
    }
%>
<c:if test="${empty sessionScope.user}">
    <c:redirect url="/login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Tài khoản của tôi | TechNova</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

</head>
<body>
    <header class="header">
        <div class="header-container">
            <a href="${pageContext.request.contextPath}/home.jsp" class="logo">
                <img src="https://i.postimg.cc/Hn4Jc3yj/logo-2.png" alt="TechNova Logo">
                <span class="brand-name">TechNova</span>
            </a>

            <nav class="nav-links">
                <a href="${pageContext.request.contextPath}/home" class="${pageContext.request.servletPath.endsWith('/home') ? 'active' : ''}">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/gioiThieu.jsp" class="${pageContext.request.servletPath.endsWith('/gioiThieu.jsp') ? 'active' : ''}">Giới thiệu</a>
                <a href="#" id="category-toggle">Danh mục</a>
                <a href="${pageContext.request.contextPath}/contact" class="${pageContext.request.servletPath.endsWith('/contact.jsp') ? 'active' : ''}">Liên hệ</a>
            </nav>

            <div class="search-box">
                <input type="text" placeholder="Bạn muốn mua gì hôm nay?">
                <button><i class="fas fa-search"></i></button>
            </div>

            <div class="header-actions">
                <a href="${pageContext.request.contextPath}/AddCart?action=view" class="icon-btn cart-btn-wrapper" title="Giỏ hàng">
                    <i class="fas fa-shopping-cart"></i>

                    <% if (totalQuantity > 0) { %>
                    <span class="cart-badge"><%= totalQuantity %></span>
                    <% } %>
                </a>

                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/my-orders" class="icon-btn active" title="Tài khoản của bạn">
                            <i class="fas fa-user"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login.jsp" class="icon-btn" title="Đăng nhập">
                            <i class="fas fa-user"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Danh mục -->
            <div class="category-box" id="categoryBox">
                <c:forEach var="cat" items="${applicationScope.categoryList}">
                    <a href="${pageContext.request.contextPath}/list-product?categoryId=${cat.id}" class="category-item">
                        <i class="fa-solid fa-microchip"></i> ${cat.name} <i class="fa-solid fa-chevron-right"></i>
                    </a>
                </c:forEach>
            </div>
        </div>
    </header>
<div class="overlay" id="overlay"></div>
<div class="container">
    <div class="top-card" role="region" aria-label="thông tin tài khoản">
        <div class="profile">
            <div class="summary-card">
                <div class="summary-left">
                    <div class="reviewer-avatar">${fn:substring(sessionScope.user.name, 0, 1)}</div>
                    <div class="summary-info">
                        <div class="summary-name">${sessionScope.user.name}</div>
                        <div class="summary-phone">${sessionScope.user.phone}</div>
                    </div>
                </div>

                <div class="summary-divider"></div>

                <div class="summary-item">
                    <div class="summary-icon">
                        <i class="fa-solid fa-cart-shopping" style="color: #ff0000;"></i>
                    </div>
                    <div class="summary-text">
                        <div class="summary-count">${totalOrders}</div>
                        <div class="summary-label">Tổng số đơn hàng đã mua</div>
                    </div>
                </div>

                <div class="summary-divider"></div>

                <div class="summary-item">
                    <div class="summary-icon">
                        <i class="fa-solid fa-sack-dollar" style="color: #74C0FC;"></i>
                    </div>
                    <div class="summary-text">
                        <div class="summary-count"><fmt:formatNumber value="${totalSpent}" type="currency" currencySymbol="₫" /></div>
                        <div class="summary-small">Tổng tiền tích lũy</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="main">
        <aside class="side" aria-label="menu">
            <nav class="menu" aria-label="menu chính">
                <a href="${pageContext.request.contextPath}/my-orders" class="menu-item active" data-target="orders">
                    <i class="fa-solid fa-list icon"></i>
                    <span class="label">Đơn hàng của tôi</span>
                </a>
                <a href="${pageContext.request.contextPath}/favorites" class="menu-item" data-target="favorites">
                    <i class="fa-regular fa-heart icon"></i>
                    <span class="label">Sản phẩm yêu thích</span>
                </a>
                <a href="${pageContext.request.contextPath}/account" class="menu-item" data-target="account">
                    <i class="fa-regular fa-user icon"></i>
                    <span class="label">Thông tin tài khoản</span>
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="menu-item" data-target="account">
                    <i class="fa-solid fa-right-from-bracket icon"></i>
                    <span class="label">Đăng xuất</span>
                </a>
            </nav>
        </aside>
        <section class="content">
            <div class="section active" id="orders">
                <div class="order-filter-tabs">
                    <a href="${pageContext.request.contextPath}/my-orders"
                       class="tab-link ${empty param.status ? 'active' : ''}">Tất cả</a>

                    <a href="${pageContext.request.contextPath}/my-orders?status=Chờ xác nhận"
                       class="tab-link ${param.status == 'Chờ xác nhận' ? 'active' : ''}">Chờ xác nhận</a>

                    <a href="${pageContext.request.contextPath}/my-orders?status=Đang xử lý"
                       class="tab-link ${param.status == 'Đang xử lý' ? 'active' : ''}">Đang xử lý</a>

                    <a href="${pageContext.request.contextPath}/my-orders?status=Đang giao"
                       class="tab-link ${param.status == 'Đang giao' ? 'active' : ''}">Đang giao</a>

                    <a href="${pageContext.request.contextPath}/my-orders?status=Đã giao"
                       class="tab-link ${param.status == 'Đã giao' ? 'active' : ''}">Đã giao</a>

                    <a href="${pageContext.request.contextPath}/my-orders?status=Đã hủy"
                       class="tab-link ${param.status == 'Đã hủy' ? 'active' : ''}">Đã hủy</a>
                </div>

                <div class="orders-list">
                    <c:forEach var="order" items="${orderList}">
                        <div class="order-card">
                            <div class="order-left-col">
                                <c:forEach var="item" items="${order.items}">
                                    <div class="order-item-row">
                                        <img src="${item.productImage}" alt="${item.productName}" class="product-thumb">
                                        <div class="item-details">
                                            <div class="order-meta-line">
                                                Đơn hàng: #${order.orderCode} • Ngày đặt: <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy" />
                                            </div>
                                            <div class="product-name">${item.productName}</div>
                                            <div class="product-price">
                                                <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" />
                                                <span class="qty-badge">x${item.quantity}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="order-right-col">
                                <div class="status-wrapper">
                    <span class="order-status status-${fn:toLowerCase(fn:replace(order.orderStatus, ' ', '_'))}">
                            ${order.orderStatus}
                    </span>
                                </div>

                                <div class="total-wrapper">
                                    <div class="total-row">
                                        <span class="lbl">Tổng thanh toán:</span>
                                        <span class="val"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" /></span>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/order-detail?id=${order.id}" class="view-detail-link">
                                        Xem chi tiết >
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/header.js"></script>
</body>
</html>
