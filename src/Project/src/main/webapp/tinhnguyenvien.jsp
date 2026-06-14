<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.StatisticService" %>
<%@ page import="model.Contributor" %>
<%@ page import="java.util.List" %>
<%
    StatisticService service = new StatisticService();
    List<Contributor> volunteers = service.getAllVolunteers();
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tình Nguyện Viên Tiêu Biểu - Ánh Sáng Yêu Thương</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tinhnguyenvien_style.css" />
  </head>
  <body>
    <header>
      <div class="container header-content">
        <a href="${pageContext.request.contextPath}/" class="logo">
          <div class="logo-icon">
            <img
              src="${pageContext.request.contextPath}/images/logo.png"
              alt="Ánh Sáng Yêu Thương"
              onerror="this.style.display='none'; this.nextElementSibling.style.display='block';"
            />
            <div class="logo-fallback" style="display:none; font-size:24px; color:#e53935;">♥</div>
          </div>
          <div class="logo-text">
            <div class="logo-title">
              <span class="logo-brand">ÁNH SÁNG</span>
              <span class="logo-name">YÊU THƯƠNG</span>
            </div>
            <div class="logo-tagline">
              Lan tỏa yêu thương - Kết nối cộng đồng
            </div>
          </div>
        </a>

        <div class="menu-container">
          <label for="nav-toggle" class="nav-toggle-label">☰</label>
          <nav>
            <a href="${pageContext.request.contextPath}/#home">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/#about">Giới thiệu</a>
            <a href="${pageContext.request.contextPath}/#activities">Hoạt động</a>
            <a href="${pageContext.request.contextPath}/#campaign">Thành tựu</a>
            <div class="nav-dropdown">
              <a href="${pageContext.request.contextPath}/" class="nav-link">Người đóng góp</a>
              <div class="dropdown-menu">
                <a href="${pageContext.request.contextPath}/bantochuc.jsp">Ban tổ chức</a>
                <a href="${pageContext.request.contextPath}/tinhnguyenvien.jsp">Tình nguyện viên</a>
                <a href="${pageContext.request.contextPath}/nhataitro.jsp">Nhà tài trợ</a>
                <a href="${pageContext.request.contextPath}/nhahao.jsp">Nhà hảo tâm</a>
              </div>
            </div>
          </nav>
        </div>

        <input type="checkbox" id="nav-toggle" class="nav-toggle" />

        <div class="header-actions">
          <a href="${pageContext.request.contextPath}/#support" class="btn-support"> <span>♥</span> Ủng hộ dự án </a>
        </div>
      </div>
    </header>

    <main class="page-content">
      <div class="container">
        <nav class="breadcrumb">
          <a href="${pageContext.request.contextPath}/">Trang chủ</a>
          <span class="divider">/</span>
          <a href="${pageContext.request.contextPath}/index.jsp">Người đóng góp</a>
          <span class="divider">/</span>
          <span class="active bold">Tình nguyện viên tiêu biểu</span>
        </nav>

        <div class="page-heading-block">
          <div class="heading-info">
            <h1 class="page-title">TÌNH NGUYỆN VIÊN TIÊU BIỂU</h1>
            <p class="page-subtitle">Những trái tim nhiệt huyết đã đồng hành cùng dự án.</p>
          </div>
        </div>

        <div class="volunteers-grid">
          <% for (Contributor v : volunteers) {
                String avatar = v.getAvatar();
                if (avatar == null || avatar.isEmpty()) avatar = "images/logo.png";
                String avatarPath = avatar.contains("/") ? avatar : "images/" + avatar;
          %>
          <div class="volunteer-card">
            <div class="volunteer-avatar-wrapper">
              <img class="volunteer-avatar" src="<%= request.getContextPath() + "/" + avatarPath %>" alt="<%= v.getFullName() %>" onerror="this.src='<%= request.getContextPath() %>/images/logo.png';" />
            </div>
            <div class="volunteer-info">
              <h3 class="volunteer-name"><%= v.getFullName() %></h3>
              <p class="volunteer-desc"><%= v.getDescription() != null && !v.getDescription().isEmpty() ? v.getDescription() : "Tình nguyện viên" %></p>
              <div class="vol-stats">
                <span><strong>Hoạt động:</strong> <%= v.getActivityCount() %></span>
                <span><strong>Giờ cống hiến:</strong> <%= v.getTotalHours() %></span>
              </div>
            </div>
          </div>
          <% } %>
        </div>

      </div>
    </main>

    <footer class="main-footer">
      <div class="container footer-container">
        <div class="footer-grid">
          <!-- Cột 1: Logo và Tagline -->
          <div class="footer-col footer-brand">
            <div class="footer-logo">
              <div class="footer-logo-icon">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Ánh Sáng Yêu Thương" onerror="this.style.display='none'; this.nextElementSibling.style.display='block';" />
                <div class="footer-logo-fallback" style="display:none;">♥</div>
              </div>
              <div class="footer-logo-text">
                <span class="brand-light">ÁNH SÁNG</span>
                <span class="brand-highlight">YÊU THƯƠNG</span>
              </div>
            </div>
            <p class="brand-tagline">Lan tỏa yêu thương - Kết nối cộng đồng</p>
          </div>

          <!-- Cột 2: Kết nối với chúng tôi -->
          <div class="footer-col footer-social">
            <h3 class="col-title">KẾT NỐI VỚI CHÚNG TÔI</h3>
            <div class="social-icons-row">
              <a href="#facebook" class="social-circle-btn" title="Facebook">
                <span class="icon icon-facebook" aria-hidden="true"></span>
              </a>
              <a href="#youtube" class="social-circle-btn" title="YouTube">
                <span class="icon icon-youtube" aria-hidden="true"></span>
              </a>
              <a href="#tiktok" class="social-circle-btn" title="TikTok">
                <span class="icon icon-tiktok" aria-hidden="true"></span>
              </a>
              <a href="#instagram" class="social-circle-btn" title="Instagram">
                <span class="icon icon-instagram" aria-hidden="true"></span>
              </a>
            </div>
          </div>

          <!-- Cột 3: Liên hệ -->
          <div class="footer-col footer-contact">
            <h3 class="col-title">LIÊN HỆ</h3>
            <ul class="contact-list">
              <li>
                <span class="icon icon-contact-phone" aria-hidden="true"></span>
                <span>0123 456 789</span>
              </li>
              <li>
                <span class="icon icon-contact-mail" aria-hidden="true"></span>
                <span>lienhe@anhsangyeuthuong.vn</span>
              </li>
              <li>
                <span class="icon icon-contact-map" aria-hidden="true"></span>
                <span>123 Yêu Thương, Q.1, TP. Hồ Chí Minh</span>
              </li>
            </ul>
          </div>

          <!-- Cột 4: Nhận tin -->
          <div class="footer-col footer-subscribe">
            <h3 class="col-title">NHẬN TIN TỪ DỰ ÁN</h3>
            <p class="subscribe-text" style="font-weight: 500; color: #f3a43b;">Mọi thông tin đăng ký xin vui lòng gửi về hòm thư: lienhe@anhsangyeuthuong.vn</p>
          </div>
        </div>

        <div class="footer-bottom">
          <p class="copyright-text">&copy; 2025 Dự án Ánh Sáng Yêu Thương. Tất cả quyền được bảo lưu.</p>
        </div>
      </div>
    </footer>
  </body>
</html>
