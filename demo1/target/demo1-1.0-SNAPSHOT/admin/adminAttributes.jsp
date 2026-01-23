<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechNova Admin - Thuộc tính</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/adminAttributes.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/headerAndSidebar.css">
    <link rel="stylesheet" href="${contextPath}/admin/admincss/adminNotification.css">

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
        <li class="nav-item"><a href="${contextPath}/admin/customers" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-users"></i></span>Khách hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/categories" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-list"></i></span>Mục sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/brands" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-certificate"></i></span>Thương hiệu</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/attributes" class="nav-link active"><span class="nav-icon"><i class="fa-solid fa-sliders"></i></span>Thuộc tính</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/banners" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-images"></i></span>Banner</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/products" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-box-open"></i></span>Sản phẩm</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/orders" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-clipboard-list"></i></span>Đơn hàng</a></li>
        <li class="nav-item"><a href="${contextPath}/admin/reviews" class="nav-link"><span class="nav-icon"><i class="fa-solid fa-star"></i></span>Đánh giá</a></li>

    </ul>
    <div class="logout-section"><a href="${contextPath}/logout" class="nav-link logout-link"><span class="nav-icon"><i class="fa-solid fa-right-from-bracket"></i></span>Đăng xuất</a></div>
</aside>

<header class="header">
    <div class="header-actions">
        <button class="notification-btn" id="notificationBtn">
            <i class="fa-solid fa-bell"></i>
            <span class="notification-badge">3</span>
        </button>

        <!-- Thông báo -->
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
            </div>

            <div class="notification-footer">
                <a href="${contextPath}/admin/notifications" class="see-all-link">Xem tất cả thông báo</a>
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
        <div class="page-header">
            <div>
                <h1 class="page-title">Thuộc tính</h1>
                <div class="breadcrumb">
                    <a href="${contextPath}/admin/dashboard" class="breadcrumb-link">Trang chủ</a>
                    <span>/</span>
                    <span class="breadcrumb-current">Thuộc tính</span>
                </div>
            </div>
        </div>

        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success">
                <span class="close-btn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${sessionScope.successMessage}
            </div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="alert alert-danger">
                <span class="close-btn" onclick="this.parentElement.style.display='none';">&times;</span>
                ${sessionScope.errorMessage}
            </div>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>

        <div class="form-section">
            <form method="post" action="${contextPath}/admin/attributes" id="attributeForm">
                <input type="hidden" name="action" value="${not empty attributeToEdit ? 'update' : 'add'}">
                <input type="hidden" name="id" value="${attributeToEdit.id}">

                <div class="form-row">
                    <div class="form-item">
                        <label class="form-label">Tên thuộc tính</label>
                        <input type="text" name="name" placeholder="Nhập tên thuộc tính" value="${attributeToEdit.name}" required>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Danh mục</label>
                        <select name="category_id" required>
                            <option value="">Chọn danh mục</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}" ${category.id == attributeToEdit.categoryId ? 'selected' : ''}>${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-row second-row">
                    <div class="form-item">
                        <label class="form-label">Thứ tự hiển thị</label>
                        <input type="number" name="display_order" placeholder="Nhập thứ tự" value="${attributeToEdit.displayOrder}" min="1" required>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Bộ lọc</label>
                        <input type="checkbox" class="checkbox-round" name="is_filterable" value="1" ${attributeToEdit.isFilterable == 1 ? 'checked' : ''}>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Trạng thái</label>
                        <select name="status" required>
                            <option value="active" ${attributeToEdit.status == 'active' ? 'selected' : ''}>Hoạt động</option>
                            <option value="inactive" ${attributeToEdit.status == 'inactive' ? 'selected' : ''}>Ẩn</option>
                        </select>
                    </div>

                    <div class="form-item buttons-row" style="display: flex; flex-direction: row; gap: 8px; margin-left: auto;">
                        <c:choose>
                            <c:when test="${not empty attributeToEdit}">
                                <a href="#confirm-save-modal" class="btn-update"><i class="fa-solid fa-save"></i> Cập nhật</a>
                                <a href="${contextPath}/admin/attributes" class="btn-cancel">Hủy</a>
                            </c:when>
                            <c:otherwise>
                                <a href="#confirm-save-modal" class="btn-add"><i class="fa-solid fa-plus"></i> Thêm thuộc tính</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </form>
        </div>

        <form action="${contextPath}/admin/attributes" method="get">
            <div class="form-search-row" style="display: flex; align-items: center; gap: 10px; margin-bottom: 20px;">
                <select name="filterCategoryId" onchange="this.form.submit()" style="height: 45px; padding: 0 15px; border: 1px solid #e2e8f0; border-radius: 10px; outline: none; cursor: pointer; color: #4b5563; min-width: 200px; background-color: white;">
                    <option value="0">-- Tất cả danh mục --</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}" ${cat.id == filterCategoryId ? 'selected' : ''}>${cat.name}</option>
                    </c:forEach>
                </select>
                <div class="search-wrapper" style="flex: 1; margin-bottom: 0;">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                    <input type="text" name="keyword" class="search-input" placeholder="Tìm kiếm thuộc tính..." value="${keyword}" style="width: 100%; height: 45px;">
                </div>
                <button type="submit" style="display:none;"></button>
            </div>
        </form>

        <!-- TABLE -->
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên thuộc tính</th>
                    <th>Danh mục</th>
                    <th>Thứ tự hiển thị</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="attr" items="${attributes}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1 + (currentPage - 1) * 10}</td>
                        <td><c:out value="${attr.name}"/></td>
                        <td>
                            <c:forEach var="cat" items="${categories}">
                                <c:if test="${cat.id == attr.categoryId}">${cat.name}</c:if>
                            </c:forEach>
                        </td>
                        <td>${attr.displayOrder}</td>
                        <td>
                            <span class="badge ${attr.status == 'active' ? 'active-status' : 'inactive-status'}">
                                ${attr.status == 'active' ? 'Hoạt động' : 'Ẩn'}
                            </span>
                        </td>
                        <td class="actions">
                            <a href="${contextPath}/admin/attributes?action=edit&id=${attr.id}" class="btn-edit"><i class="fa-solid fa-pen"></i></a>
                            <a href="#confirm-delete-modal-${attr.id}" class="btn-delete"><i class="fa-solid fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${totalPages > 1}">
            <div class="pagination-container">
                <c:if test="${currentPage > 1}">
                    <a href="${contextPath}/admin/attributes?page=${currentPage - 1}&keyword=${keyword}&filterCategoryId=${filterCategoryId}" class="pagination-btn"><i class="fa-solid fa-chevron-left"></i></a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <a href="${contextPath}/admin/attributes?page=${i}&keyword=${keyword}&filterCategoryId=${filterCategoryId}" class="page-number ${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="${contextPath}/admin/attributes?page=${currentPage + 1}&keyword=${keyword}&filterCategoryId=${filterCategoryId}" class="pagination-btn"><i class="fa-solid fa-chevron-right"></i></a>
                </c:if>
            </div>
        </c:if>
    </div>
</main>

<c:forEach var="attr" items="${attributes}">
    <div id="confirm-delete-modal-${attr.id}" class="modal-overlay">
        <div class="modal-content">
            <h3>Xác nhận xóa</h3>
            <p>Bạn có chắc chắn muốn xóa thuộc tính "${attr.name}" không?</p>
            <div class="modal-buttons">
                <a href="#" class="modal-btn modal-cancel">Hủy</a>
                <a href="${contextPath}/admin/attributes?action=delete&id=${attr.id}" class="modal-btn modal-confirm">Xóa</a>
            </div>
        </div>
    </div>
</c:forEach>

<div id="confirm-save-modal" class="modal-overlay">
    <div class="modal-content">
        <h3>Xác nhận lưu</h3>
        <p>Bạn có chắc chắn muốn lưu các thay đổi này không?</p>
        <div class="modal-buttons">
            <a href="#" class="modal-btn modal-cancel">Hủy</a>
            <button type="submit" form="attributeForm" class="modal-btn modal-confirm">Lưu</button>
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
