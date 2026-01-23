<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.demo1.model.CartItem" %>

<%
    int totalQuantity = 0;
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cart != null) {
        for (CartItem item : cart.values()) {
            totalQuantity += item.getQuantity();
        }
    }
%>
<c:if test="${empty sessionScope.user}">
    <c:redirect url="${pageContext.request.contextPath}/login"/>
</c:if>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Thông tin tài khoản | TechNova</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
    <header class="header">
        <div class="header-container">
            <a href="${pageContext.request.contextPath}/home" class="logo">
                <img src="https://i.postimg.cc/Hn4Jc3yj/logo-2.png" alt="TechNova Logo">
                <span class="brand-name">TechNova</span>
            </a>

            <nav class="nav-links">
                <a href="${pageContext.request.contextPath}/home" class="${pageContext.request.servletPath.endsWith('/home') ? 'active' : ''}">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/gioiThieu.jsp" class="${pageContext.request.servletPath.endsWith('/gioiThieu.jsp') ? 'active' : ''}">Giới thiệu</a>
                <a href="#" id="category-toggle">Danh mục</a>
                <a href="${pageContext.request.contextPath}/contact" class="${pageContext.request.servletPath.endsWith('/contact') ? 'active' : ''}">Liên hệ</a>
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
                        <a href="${pageContext.request.contextPath}/login" class="icon-btn" title="Đăng nhập">
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
                        <div class="summary-count">
                            <fmt:formatNumber value="${totalSpent}" type="currency" currencySymbol="₫" />
                        </div>
                        <div class="summary-small">Tổng tiền tích lũy</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="main">
        <aside class="side" aria-label="menu">
            <nav class="menu" aria-label="menu chính">

                <a href="${pageContext.request.contextPath}/my-orders" class="menu-item" data-target="orders">
                    <i class="fa-solid fa-list icon"></i>
                    <span class="label">Đơn hàng của tôi</span>
                </a>

                <a href="${pageContext.request.contextPath}/favorites" class="menu-item" data-target="favorites">
                    <i class="fa-regular fa-heart icon"></i>
                    <span class="label">Sản phẩm yêu thích</span>
                </a>

                <a href="${pageContext.request.contextPath}/account" class="menu-item active" data-target="account">
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
            <div class="section active" id="account">
                <h2>Thông tin tài khoản</h2>

                <c:if test="${not empty sessionScope.updateProfileSuccess}">
                    <div class="success-message" style="margin-bottom: 20px;">${sessionScope.updateProfileSuccess}</div>
                    <c:remove var="updateProfileSuccess" scope="session"/>
                </c:if>
                <c:if test="${not empty sessionScope.updateProfileError}">
                    <div class="error-message-form" style="margin-bottom: 20px;">${sessionScope.updateProfileError}</div>
                    <c:remove var="updateProfileError" scope="session"/>
                </c:if>

                <c:set var="isEditMode" value="${param.mode == 'edit'}" />

                <div class="card" style="grid-column: span 2;">

                    <c:if test="${!isEditMode}">
                        <div class="info-card" id="infoView">
                            <div class="info-header">
                                <h2>Thông tin cá nhân</h2>
                                <a href="${pageContext.request.contextPath}/account?mode=edit" class="update-btn" style="text-decoration: none;">Cập nhật</a>
                            </div>
                            <div class="info-body">
                                <div class="info-row">
                                    <span>Họ và tên:</span>
                                    <p>${sessionScope.user.name}</p>
                                    <span>Số điện thoại:</span>
                                    <p>${sessionScope.user.phone}</p>
                                </div>
                                <div class="info-row">
                                    <span>Giới tính:</span>
                                    <p>${sessionScope.user.gender}</p>
                                    <span>Email:</span>
                                    <p>${sessionScope.user.email}</p>
                                </div>
                                <div class="info-row">
                                    <span>Ngày sinh:</span>
                                    <p><fmt:formatDate value="${sessionScope.user.birthday}" pattern="dd/MM/yyyy" /></p>
                                    <span>Địa chỉ:</span>
                                    <p>${sessionScope.user.address}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${isEditMode}">
                        <div class="info-card" id="infoForm">
                            <div class="info-header">
                                <h2>Cập nhật thông tin</h2>
                            </div>
                            <form action="${pageContext.request.contextPath}/update-profile" method="post">
                                <div class="info-body">
                                    <div class="info-row">
                                        <span>Họ và tên:</span>
                                        <input type="text" name="name" value="${sessionScope.user.name}" required>
                                        <span>Số điện thoại:</span>
                                        <input type="text" name="phone" value="${sessionScope.user.phone}" required>
                                    </div>
                                    <div class="info-row">
                                        <span>Giới tính:</span>
                                        <div class="custom-select-wrapper">
                                            <select name="gender">
                                                <option value="Nam" ${sessionScope.user.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                <option value="Nữ" ${sessionScope.user.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                <option value="Khác" ${sessionScope.user.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                                            </select>
                                        </div>
                                        <span>Email:</span>
                                        <input type="email" name="email" value="${sessionScope.user.email}" readonly style="background-color: #f1f1f1;">
                                    </div>
                                    <div class="info-row">
                                        <span>Ngày sinh:</span>
                                        <input type="date" name="birthday" value="<fmt:formatDate value='${sessionScope.user.birthday}' pattern='yyyy-MM-dd' />">
                                        <span>Địa chỉ:</span>
                                        <input type="text" name="address" value="${sessionScope.user.address}">
                                    </div>
                                </div>
                                <div class="info-actions">
                                    <button type="submit" class="save-btn">Lưu</button>

                                    <a href="${pageContext.request.contextPath}/account" class="cancel-btn" style="text-decoration: none; display: inline-block;">Hủy</a>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>

                    <div class="card">
                        <h3>
                            Mật khẩu
                            <a href="${pageContext.request.contextPath}/thayDoiMK.jsp" class="update-btn-ud">Thay đổi</a>
                        </h3>
                        <div class="info-item">Cập nhật lần cuối:
                            <c:if test="${not empty sessionScope.user.passwordUpdatedAt}">
                                <fmt:formatDate value="${sessionScope.user.passwordUpdatedAt}" pattern="dd/MM/yyyy HH:mm" timeZone="Asia/Ho_Chi_Minh"/>
                            </c:if>
                            <c:if test="${empty sessionScope.user.passwordUpdatedAt}">
                                Chưa có thông tin
                            </c:if>
                        </div>
                    </div>
                </div>
        </section>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/header.js"></script>
</body>
</html>
