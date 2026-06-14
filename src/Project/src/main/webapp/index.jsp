<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  <!-- khai báo ngôn ngữ java và thiết lập charset UTF-8 cho trang JSP -->
<%@ page import="controller.StatisticService" %> <!-- Import lớp StatisticService -->
<%@ page import="model.Contributor" %> <!-- Import lớp Contributor -->
<%@ page import="model.ContributorStats" %> <!-- Import lớp ContributorStats -->
<%@ page import="java.util.List" %> <!-- Import lớp List -->
<%
    StatisticService service = new StatisticService(); // <!-- Khởi tạo đối tượng StatisticService -->
    ContributorStats stats = service.getContributorStats(); //<!-- Lấy thống kê người đóng góp -->
    List<Contributor> organizers = service.getContributorsByType(1, 4); //<!-- Lấy danh sách ban tổ chức -->
    List<Contributor> volunteers = service.getTopVolunteersByActivityCount(4); //<!-- Lấy danh sách tình nguyện viên hàng đầu -->
    List<Contributor> sponsors = service.getContributorsByType(3, 8); //<!-- Lấy danh sách nhà tài trợ -->
    List<Contributor> donors = service.getTopDonorsByDonationAmount(6); //<!-- Lấy danh sách nhà hảo tâm hàng đầu -->
%>
<!doctype html>
<html lang="vi"> 
  <head> 
    <meta charset="UTF-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Ánh Sáng Yêu Thương</title> 
    <link rel="preconnect" href="https://fonts.googleapis.com"> <!-- Preconnect to Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <!-- Preconnect to Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet"> <!-- Load Google Fonts -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/index_style.css"
    /> <!-- Load CSS for the index page -->
  </head>
  <body>
    <!-- ===== HEADER ===== -->
    <header> 
      <div class="container header-content"> 
        <a href="${pageContext.request.contextPath}/" class="logo"> 
          <div class="logo-icon">
            <img
              src="${pageContext.request.contextPath}/images/logo.png"
              alt="Ánh Sáng Yêu Thương"
            />
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
            <a href="#">Trang chủ</a>
            <a href="#">Giới thiệu</a>
            <a href="#">Hoạt động</a>
            <a href="#">Thành tựu</a>
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
        <a href="#support" class="btn-support"> <span>♥</span> Ủng hộ dự án </a>
      </div>
      </div>
    </header>

    <!-- ===== MAIN CONTENT ===== -->
    <main>
      <!-- Banner Section -->
      <section class="banner-section" id="home">
        <div class="container banner-container">
          <div class="banner-content">
            <h1 class="banner-title">Những Người Đóng Góp</h1>
            <p class="banner-desc">
              Dự án Ánh Sáng Yêu Thương tự hào có sự đồng hành và đóng góp quý
              báu từ các cá nhân, tổ chức và cộng đồng. Mỗi sự đóng góp, dù lớn
              hay nhỏ, đều là nguồn động lực to lớn giúp chúng tôi tiếp tục hành
              trình lan tỏa yêu thương.
            </p>

            <!-- Stats Grid -->
            <div class="stats-grid">
              <!-- Card 1 -->
              <div class="stat-card card-contributors">
                <div class="stat-icon"></div>
                <div class="stat-info">
                  <h3 id="stat-total" class="stat-number">
                    <%= stats.getTotalContributors() %>+
                  </h3>
                  <p class="stat-label">Người đóng góp</p>
                </div>
              </div>

              <!-- Card 2 -->
              <div class="stat-card card-volunteers">
                <div class="stat-icon"></div>
                <div class="stat-info">
                  <h3 id="stat-volunteers" class="stat-number">
                    <%= stats.getTotalVolunteers() %>+
                  </h3>
                  <p class="stat-label">Tình nguyện viên</p>
                </div>
              </div>

              <!-- Card 3 -->
              <div class="stat-card card-sponsors">
                <div class="stat-icon"></div>
                <div class="stat-info">
                  <h3 id="stat-sponsors" class="stat-number">
                    <%= stats.getTotalSponsors() %>+
                  </h3>
                  <p class="stat-label">Nhà tài trợ & Đối tác</p>
                </div>
              </div>

              <!-- Card 4 -->
              <div class="stat-card card-donors">
                <div class="stat-icon"></div>
                <div class="stat-info">
                  <h3 id="stat-donors" class="stat-number">
                    <%= stats.getTotalDonors() %>+
                  </h3>
                  <p class="stat-label">Nhà hảo tâm</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Category Tabs -->
        <div class="tabs-container">
          <div class="container">
            <div class="category-tabs">
              <button class="tab-btn active tab-btn-all" data-category="all">
                TẤT CẢ ĐÓNG GÓP
              </button>
              <a href="${pageContext.request.contextPath}/bantochuc.jsp" class="tab-btn tab-btn-board" style="text-decoration: none;">
                BAN TỔ CHỨC
              </a>
              <a href="${pageContext.request.contextPath}/tinhnguyenvien.jsp" class="tab-btn tab-btn-volunteers" style="text-decoration: none;">
                TÌNH NGUYỆN VIÊN
              </a>
              <a href="${pageContext.request.contextPath}/nhataitro.jsp" class="tab-btn tab-btn-sponsors" style="text-decoration: none;">
                NHÀ TÀI TRỢ
              </a>
              <a href="${pageContext.request.contextPath}/nhahao.jsp" class="tab-btn tab-btn-donors" style="text-decoration: none;">
                NHÀ HẢO TÂM
              </a>
            </div>
          </div>
        </div>
      </section>

      <section class="contributors-section">
        <div class="container">
          <!-- KHỐI 1: BAN TỔ CHỨC (Hiển thị lưới Grid bình thường) -->
          <div class="section-block block-organizers">
            <div class="section-header">
              <div>
                <h2 class="section-title"><span class="section-icon">👥</span> BAN TỔ CHỨC</h2>
                <p class="section-subtitle">Những người dẫn dắt và định hướng cho hành trình yêu thương.</p>
              </div>
              <div class="header-right">
                <a href="${pageContext.request.contextPath}/bantochuc.jsp" class="section-link">Xem tất cả →</a>
              </div>
            </div>
            
            <div class="organizers-grid">
              <% for (Contributor contributor : organizers) {
                    String avatar = contributor.getAvatar();
                    if (avatar == null || avatar.isEmpty()) {
                        avatar = "images/logo.png";
                    }
                    String avatarPath = avatar.contains("/") ? avatar : "images/" + avatar;
              %>
              <div class="organizer-card">
                <div class="organizer-avatar-wrapper">
                  <img class="organizer-avatar" src="<%= request.getContextPath() + "/" + avatarPath %>" alt="<%= contributor.getFullName() %>" onerror="this.src='<%= request.getContextPath() %>/images/logo.png';" />
                </div>
                <div class="organizer-info">
                  <h3 class="organizer-name"><%= contributor.getFullName() %></h3>
                  <p class="organizer-role"><%= contributor.getDescription() != null && !contributor.getDescription().isEmpty() ? contributor.getDescription() : "Thành viên ban tổ chức" %></p>
                  <div class="organizer-socials">
                    <a href="#" class="social-circle facebook" title="Facebook">
                      <span class="icon icon-facebook" aria-hidden="true"></span>
                    </a>
                    <a href="#" class="social-circle email" title="Email">
                      <span class="icon icon-email" aria-hidden="true"></span>
                    </a>
                    <a href="#" class="social-circle phone" title="Zalo/WhatsApp">
                      <span class="icon icon-phone" aria-hidden="true"></span>
                    </a>
                  </div>
                </div>
              </div>
              <% } %>
            </div>
          </div>

          <!-- KHỐI 2: HAI CỘT SONG SONG (Tình nguyện viên bên trái & Nhà tài trợ bên phải) -->
          <div class="two-columns-row">
            <!-- Cột trái: TÌNH NGUYỆN VIÊN TIÊU BIỂU -->
            <div class="section-block block-volunteers">
              <div class="section-header">
                <div>
                  <h2 class="section-title"><span class="section-icon">👥</span> TÌNH NGUYỆN VIÊN TIÊU BIỂU</h2>
                  <p class="section-subtitle">Những trái tim nhiệt huyết đã cùng chúng tôi tạo nên những thay đổi tích cực.</p>
                </div>
                <a href="${pageContext.request.contextPath}/tinhnguyenvien.jsp" class="section-link">Xem tất cả →</a>
              </div>
              <div class="volunteers-grid">
                <% for (Contributor contributor : volunteers) {
                      String avatar = contributor.getAvatar();
                      if (avatar == null || avatar.isEmpty()) {
                          avatar = "images/logo.png";
                      }
                      String avatarPath = avatar.contains("/") ? avatar : "images/" + avatar;
                %>
                <div class="volunteer-card">
                  <div class="volunteer-avatar-wrapper">
                    <img class="volunteer-avatar" src="<%= request.getContextPath() + "/" + avatarPath %>" alt="<%= contributor.getFullName() %>" onerror="this.src='<%= request.getContextPath() %>/images/logo.png';" />
                  </div>
                  <h3 class="volunteer-name"><%= contributor.getFullName() %></h3>
                  <p class="volunteer-activity-count"><%= contributor.getActivityCount() %></p>
                  <p class="volunteer-activity-label">Hoạt động tham gia <span class="heart-icon">❤️</span></p>
                </div>
                <% } %>
              </div>
            </div>

            <!-- Cột phải: NHÀ TÀI TRỢ & ĐỐI TÁC -->
            <div class="section-block block-sponsors">
              <div class="section-header">
                <div>
                  <h2 class="section-title"><span class="section-icon">🤝</span> NHÀ TÀI TRỢ & ĐỐI TÁC</h2>
                  <p class="section-subtitle">Các tổ chức, doanh nghiệp đã hỗ trợ nguồn lực cho dự án.</p>
                </div>
                <a href="${pageContext.request.contextPath}/nhataitro.jsp" class="section-link">Xem tất cả →</a>
              </div>
              <div class="sponsors-grid">
                <% for (Contributor contributor : sponsors) {
                      String avatar = contributor.getAvatar();
                      if (avatar == null || avatar.isEmpty()) {
                          avatar = "images/logo.png";
                      }
                      String avatarPath = avatar.contains("/") ? avatar : "images/" + avatar;
                      String orgName = contributor.getOrganizationName() != null && !contributor.getOrganizationName().isEmpty() ? contributor.getOrganizationName() : contributor.getFullName();
                %>
                <div class="sponsor-card">
                  <div class="sponsor-logo-wrapper">
                    <img class="sponsor-logo" src="<%= request.getContextPath() + "/" + avatarPath %>" alt="<%= orgName %>" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';" />
                    <!-- Trình bày chữ stylized thay cho ảnh bị thiếu -->
                    <div class="sponsor-logo-fallback <%= orgName.toLowerCase().replaceAll("[^a-z\\*]", "").replaceAll("\\*", "star") %>" style="display:none;">
                      <% if (orgName.equalsIgnoreCase("Vietcombank")) { %>
                        <span class="vcb-icon">▲</span><span class="vcb-text">Vietcombank</span>
                      <% } else if (orgName.equalsIgnoreCase("FPT")) { %>
                        <span class="fpt-o">F</span><span class="fpt-b">P</span><span class="fpt-g">T</span>
                      <% } else if (orgName.equalsIgnoreCase("Vinamilk")) { %>
                        <span class="vnm-blue">Vinamilk</span>
                      <% } else if (orgName.equalsIgnoreCase("BIDV")) { %>
                        <span class="bidv-text">BIDV</span><span class="bidv-flower">✿</span>
                      <% } else if (orgName.equalsIgnoreCase("TH*true MILK")) { %>
                        <span class="th-b">TH <sup>true MILK</sup></span>
                      <% } else if (orgName.equalsIgnoreCase("PNJ")) { %>
                        <span class="pnj-d">◆</span><span class="pnj-t">PNJ</span>
                      <% } else if (orgName.equalsIgnoreCase("Shopee")) { %>
                        <span class="shopee-bag">🛍️</span><span class="shopee-t">Shopee</span>
                      <% } else if (orgName.equalsIgnoreCase("BẢO MINH")) { %>
                        <span class="baominh-shield">🛡️</span><span class="baominh-t">BẢO MINH</span>
                      <% } else { %>
                        <span><%= orgName %></span>
                      <% } %>
                    </div>
                  </div>
                  <p class="sponsor-role"><%= contributor.getDescription() != null && !contributor.getDescription().isEmpty() ? contributor.getDescription() : "Nhà tài trợ đồng hành" %></p>
                </div>
                <% } %>
              </div>
            </div>
          </div>

          <!-- KHỐI 3: NHÀ HẢO TÂM -->
          <div class="section-block block-donors">
            <div class="section-header">
              <div>
                <h2 class="section-title"><span class="section-icon">💚</span> NHÀ HẢO TÂM</h2>
                <p class="section-subtitle">Những tấm lòng nhân ái đã góp phần làm nên giá trị của dự án.</p>
              </div>
              <a href="${pageContext.request.contextPath}/nhahao.jsp" class="section-link">Xem tất cả →</a>
            </div>
            <div class="donors-grid">
              <% for (Contributor contributor : donors) {
                    String donationText = "Đóng góp " + String.format("%,d", contributor.getDonationAmount()).replace(',', '.') + "đ";
              %>
              <div class="donor-card">
                <div class="donor-icon-wrapper">
                  <span class="icon icon-user" aria-hidden="true"></span>
                </div>
                <div class="donor-info">
                  <h3 class="donor-name"><%= contributor.getFullName() %></h3>
                  <p class="donor-amount-value"><%= donationText %></p>
                </div>
              </div>
              <% } %>
            </div>
          </div>
        </div>
      </section>
    </main>

    <!-- ===== FOOTER ===== -->
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
          <!-- Cột 4: Nhận tin từ dự án -->
          <div class="footer-col footer-subscribe">
            <h3 class="col-title">NHẬN TIN TỪ DỰ ÁN</h3>
            <p class="subscribe-text" style="font-weight: 500; color: #f3a43b;">
              Mọi thông tin đăng ký xin vui lòng gửi về hòm thư: lienhe@anhsangyeuthuong.vn
            </p>
          </div>
        </div>
        
        <!-- Phần copyright -->
        <div class="footer-bottom">
          <p class="copyright-text">&copy; 2025 Dự án Ánh Sáng Yêu Thương. Tất cả quyền được bảo lưu.</p>
        </div>
      </div>
    </footer>

  </body>
</html>
