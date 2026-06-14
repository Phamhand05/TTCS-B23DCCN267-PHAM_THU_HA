<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.StatisticService" %>
<%@ page import="model.Contributor" %>
<%@ page import="java.util.List" %>
<%
    StatisticService service = new StatisticService();
    List<Contributor> donors = service.getAllDonors();
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nhà Hảo Tâm - Ánh Sáng Yêu Thương</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nhahao_style.css" />
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
          <span class="active bold">Nhà hảo tâm</span>
        </nav>

          <section class="page-section donors-section">
            <div class="page-heading-block">
              <div class="heading-info">
                <h1 class="page-title">NHÀ HẢO TÂM</h1>
                <p class="page-subtitle">Những tấm lòng nhân ái đã đóng góp vì cộng đồng.</p>
              </div>
            </div>

          <div class="donors-page-grid">
            <% for (Contributor contributor : donors) {
                  String avatar = contributor.getAvatar();
                  if (avatar == null || avatar.isEmpty()) {
                      avatar = "images/logo.png";
                  }
                  String avatarPath = avatar.contains("/") ? avatar : "images/" + avatar;
                  String donorName = contributor.getOrganizationName() != null && !contributor.getOrganizationName().isEmpty()
                          ? contributor.getOrganizationName() : contributor.getFullName();
                  String amountText = "Đóng góp " + String.format("%,d", contributor.getDonationAmount()).replace(',', '.') + "đ";
            %>
            <div class="donor-card">
              <div class="donor-card-top">
                <div class="donor-avatar-wrapper">
                  <img class="donor-avatar" src="<%= request.getContextPath() + "/" + avatarPath %>" alt="<%= donorName %>" onerror="this.src='<%= request.getContextPath() %>/images/logo.png';" />
                </div>
                <div class="donor-summary">
                  <h3 class="donor-name"><%= donorName %></h3>
                  <p class="donor-role"><%= contributor.getDescription() != null && !contributor.getDescription().isEmpty() ? contributor.getDescription() : "Nhà hảo tâm đồng hành" %></p>
                </div>
              </div>
              <div class="donor-details">
                <span class="donor-amount"><strong>Số tiền/hiện vật:</strong> <%= amountText %></span>
                <span class="donor-contact"><strong>Email:</strong> <%= contributor.getEmail() != null ? contributor.getEmail() : "-" %></span>
                <span class="donor-contact"><strong>Điện thoại:</strong> <%= contributor.getPhone() != null ? contributor.getPhone() : "-" %></span>
              </div>
            </div>
            <% } %>
          </div>
        </section>
      </div>
    </main>

    <footer class="main-footer">
      <div class="container footer-container">
        <div class="footer-grid">
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

          <div class="footer-col footer-subscribe">
            <h3 class="col-title">NHẬN TIN TỪ DỰ ÁN</h3>
            <p class="subscribe-text" style="font-weight: 500; color: #f3a43b;">
              Mọi thông tin đăng ký xin vui lòng gửi về hòm thư: lienhe@anhsangyeuthuong.vn
            </p>
          </div>
        </div>

        <div class="footer-bottom">
          <p class="copyright-text">&copy; 2025 Dự án Ánh Sáng Yêu Thương. Tất cả quyền được bảo lưu.</p>
        </div>
      </div>
    </footer>
  </body>
</html>
