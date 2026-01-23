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
    <title>TechNova Admin - Chi tiết khách hàng</title>
    <link rel="stylesheet" href="${contextPath}/admin/admincss/customersList.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/detailsCustomers.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/adminNotification.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/headerAndSidebar.css">

</head>

<body>

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
        <li class="nav-item"><a href="${contextPath}/admin/dashboard" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-border-all"></i></span>Dashboard</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/customers" class="nav-link active"><span class="nav-icon"><i class="fa-solid fa-users"></i></span>Khách hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/categories" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-list"></i></span>Mục sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/brands" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-certificate"></i></span>Thương hiệu</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/attributes" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-sliders"></i></span>Thuộc tính</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/banners" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-images"></i></span>Banner</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/products" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-box-open"></i></span>Sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/orders" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-clipboard-list"></i></span>Đơn hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/reviews" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-star"></i></span>Đánh giá</a></li>

    </ul>
    <div class="logout-section"><a href="${contextPath}/logout" class="nav-link logout-link"><span class="nav-icon"><i class="fa-solid fa-right-from-bracket"></i></span>Đăng xuất</a></div>
</aside>

<header class="header">
    <div class="search-box">
        <span class="search-icon nav-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
        <input type="text" class="search-input" placeholder="Tìm kiếm">
    </div>

    <div class="header-actions">
        <button class="notification-btn" id="notificationBtn">
            <i class="fa-solid fa-bell"></i>
            <span class="notification-badge">3</span>
        </button>

        <div class="notification-dropdown" id="notificationDropdown">
            <div class="notification-header">
                <h3>Thông báo</h3>
            </div>

            <div class="notification-list">
                <div class="notification-item">
                    <div class="notification-icon" style="background: #5b86e5;">
                        <i class="fa-solid fa-box-open"></i>
                    </div>
                    <div class="notification-content">
                        <p class="notification-text">Đã thêm sản phẩm vào hệ thống <strong>thành công!</strong></p>
                        <span class="notification-time">20 giây trước</span>
                    </div>
                </div>

                <div class="notification-item">
                    <div class="notification-icon" style="background: #5b86e5;">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div class="notification-content">
                        <p class="notification-text">Đã thêm tài khoản khách hàng vào hệ thống <strong>thành
                            công!</strong></p>
                        <span class="notification-time">20 phút trước</span>
                    </div>
                </div>

                <div class="notification-item">
                    <div class="notification-icon" style="background: #5b86e5;">
                        <i class="fa-solid fa-file-invoice"></i>
                    </div>
                    <div class="notification-content">
                        <p class="notification-text">Đã cập nhật hóa đơn #1988001 vào hệ thống <strong>thành
                            công!</strong></p>
                        <span class="notification-time">5 giờ trước</span>
                    </div>
                </div>

                <div class="notification-item">
                    <div class="notification-icon" style="background: #5b86e5;">
                        <i class="fa-solid fa-box-open"></i>
                    </div>
                    <div class="notification-content">
                        <p class="notification-text">Đã thêm sản phẩm vào hệ thống <strong>thành công!</strong></p>
                        <span class="notification-time">12 giờ trước</span>
                    </div>
                </div>
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

<main class="main-content">
    <div class="content-area">
        <h1 class="page-title">Chi tiết khách hàng</h1>
        <div class="breadcrumb">
            <a href="${contextPath}/admin/dashboard">Trang chủ</a> / <a href="${contextPath}/admin/customers">Danh sách khách hàng</a> / <span>Chi tiết khách hàng</span>
        </div>

        <c:if test="${not empty requestScope.updateSuccess}">
            <div class="alert alert-success">
                <span class="close-btn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${requestScope.updateSuccess}
            </div>
        </c:if>

        <c:if test="${not empty requestScope.updateError}">
            <div class="alert alert-danger">
                <span class="close-btn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${requestScope.updateError}
            </div>
        </c:if>

        <c:if test="${not empty customer}">

            <section class="personal-info">

                <div class="info-card" id="infoView">
                    <div class="info-header">
                        <h2>Thông tin cá nhân</h2>
                        <button id="editBtn" class="update-btn">Cập nhật</button>
                    </div>

                    <div class="info-body">
                        <div class="info-row">
                            <span>Họ và tên:</span>
                            <p id="name">${customer.name}</p>
                            <span>Số điện thoại:</span>
                            <p id="phone">${customer.phone}</p>
                        </div>
                        <div class="info-row">
                            <span>Giới tính:</span>
                            <p id="gender">${customer.gender}</p>
                            <span>Email:</span>
                            <p id="email">${customer.email}</p>
                        </div>
                        <div class="info-row">
                            <span>Ngày sinh:</span>
                            <p id="dob"><fmt:formatDate value="${customer.birthday}" pattern="dd/MM/yyyy" /></p>
                            <span>Địa chỉ:</span>
                            <p id="address">${customer.address}</p>
                        </div>
                    </div>
                </div>

                <form action="${contextPath}/admin/customer-detail" method="post" class="info-card hidden" id="infoForm">
                    <input type="hidden" name="id" value="${customer.id}">
                    <div class="info-header">
                        <h2>Cập nhật thông tin</h2>
                    </div>

                    <div class="info-body">
                        <div class="info-row">
                            <span>Họ và tên:</span>
                            <input type="text" id="inputName" name="name" value="${customer.name}">
                            <span>Số điện thoại:</span>
                            <input type="text" id="inputPhone" name="phone" value="${customer.phone}">
                        </div>
                        <div class="info-row">
                            <span>Giới tính:</span>
                            <select id="inputGender" name="gender">
                                <option value="Nam" ${customer.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                <option value="Nữ" ${customer.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                <option value="Khác" ${customer.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                            </select>
                            <span>Email:</span>
                            <input type="email" id="inputEmail" name="email" value="${customer.email}">
                        </div>
                        <div class="info-row">
                            <span>Ngày sinh:</span>
                            <input type="date" id="inputDob" name="birthday" value="<fmt:formatDate value='${customer.birthday}' pattern='yyyy-MM-dd' />">
                            <span>Địa chỉ:</span>
                            <input type="text" id="inputAddress" name="address" value="${customer.address}">
                        </div>
                    </div>

                    <div class="info-actions">
                        <a href="#confirm-save-modal" class="save-btn">Lưu</a>
                        <button type="button" id="cancelBtn" class="cancel-btn">Hủy</button>
                    </div>
                </form>
            </section>

            <div class="customer-detail">
                <div class="orders-section">
                    <div class="orders-header">
                        <h3>Lịch sử đơn hàng</h3>
                    </div>

                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt hàng</th>
                            <th>Trạng thái</th>
                            <th>Tổng tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty orderList}">
                            <tr>
                                <td colspan="4" style="text-align: center;">Khách hàng chưa có đơn hàng nào.</td>
                            </tr>
                        </c:if>

                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td>
                                    <a href="${contextPath}/admin/orders?action=view&id=${order.id}">
                                        #${order.orderCode}
                                    </a>
                                </td>

                                <td>
                                    <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${order.orderStatus == 'Hoàn thành'}">
                                            <span class="status completed">${order.orderStatus}</span>
                                        </c:when>
                                        <c:when test="${order.orderStatus == 'Đã hủy'}">
                                            <span class="status canceled">${order.orderStatus}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status pending">${order.orderStatus}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="đ"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:if test="${totalPages > 1}">
                    <div class="pagination-container">
                        <c:if test="${currentPage > 1}">
                            <a href="${contextPath}/admin/customer-detail?id=${customer.id}&page=${currentPage - 1}" class="pagination-btn">
                                <i class="fa-solid fa-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <a href="${contextPath}/admin/customer-detail?id=${customer.id}&page=${i}"
                               class="page-number ${i == currentPage ? 'active' : ''}">
                                    ${i}
                            </a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="${contextPath}/admin/customer-detail?id=${customer.id}&page=${currentPage + 1}" class="pagination-btn">
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </c:if>
        <c:if test="${empty customer}">
            <p>Không tìm thấy khách hàng.</p>
        </c:if>
    </div>
</main>

<!-- MODALS -->
<div id="confirm-save-modal" class="modal-overlay">
    <div class="modal-content">
        <h3>Xác nhận lưu</h3>
        <p>Bạn có chắc chắn muốn lưu các thay đổi này không?</p>
        <div class="modal-buttons">
            <a href="#" class="modal-btn modal-cancel">Hủy</a>
            <button type="submit" form="infoForm" class="modal-btn modal-confirm">Lưu</button>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            const closeBtn = alert.querySelector('.close-btn');

            const autoClose = setTimeout(function() {
                closeAlert(alert);
            }, 5000);

            if (closeBtn) {
                closeBtn.addEventListener('click', function() {
                    clearTimeout(autoClose);
                    closeAlert(alert);
                });
            }
        });

        function closeAlert(alert) {
            if (alert) {
                alert.style.opacity = '0';
                setTimeout(function() {
                    if (alert) alert.style.display = 'none';
                }, 500);
            }
        }
    });
</script>

</body>
</html>
