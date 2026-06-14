package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Contributor;
import model.ContributorStats;

public class StatisticService {

    
    public ContributorStats getContributorStats() {
        // Câu lệnh truy vấn tối ưu tính toán đồng thời các chỉ số
        String query = "SELECT " +
                       "COUNT(*) AS total, " +
                       "SUM(CASE WHEN TypeID = 2 THEN 1 ELSE 0 END) AS volunteers, " +
                       "SUM(CASE WHEN TypeID = 3 THEN 1 ELSE 0 END) AS sponsors, " +
                       "SUM(CASE WHEN TypeID = 4 THEN 1 ELSE 0 END) AS donors " +
                       "FROM Contributor";

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query);
                     ResultSet rs = stmt.executeQuery()) {
                    
                    if (rs.next()) {
                        int total = rs.getInt("total");
                        int volunteers = rs.getInt("volunteers");
                        int sponsors = rs.getInt("sponsors");
                        int donors = rs.getInt("donors");
                        
                        return new ContributorStats(total, volunteers, sponsors, donors);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi thực hiện truy vấn thống kê: " + e.getMessage());
        }
        
        // Trả về đối tượng chứa giá trị 0 nếu có lỗi xảy ra
        return new ContributorStats(0, 0, 0, 0);
    }

    /**
     * Lấy danh sách người đóng góp theo loại và giới hạn số lượng.
     */
    public List<Contributor> getContributorsByType(int typeId, int limit) {
        String query = "SELECT ContributorID, FullName, Avatar, Email, Phone, JoinDate, Description, OrganizationName, TypeID " +
                       "FROM Contributor WHERE TypeID = ? ORDER BY JoinDate DESC LIMIT ?";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, typeId);
                    stmt.setInt(2, limit);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            Contributor contributor = new Contributor(
                                    rs.getInt("ContributorID"),
                                    rs.getString("FullName"),
                                    rs.getString("Avatar"),
                                    rs.getString("Email"),
                                    rs.getString("Phone"),
                                    rs.getDate("JoinDate"),
                                    rs.getString("Description"),
                                    rs.getString("OrganizationName"),
                                    rs.getInt("TypeID")
                            );
                            list.add(contributor);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn danh sách người đóng góp: " + e.getMessage());
        }
        return list;
    }

    /**
     * Lấy danh sách ban tổ chức kèm theo số lượng hoạt động và số giờ cống hiến.
     */
    public List<Contributor> getOrganizersWithStats() {
        String query = "SELECT c.ContributorID, c.FullName, c.Avatar, c.Email, c.Phone, c.JoinDate, c.Description, c.OrganizationName, c.TypeID, " +
                       "COUNT(DISTINCT con.ActivityID) AS activityCount, " +
                       "COALESCE(SUM(con.HoursParticipated), 0) AS totalHours " +
                       "FROM Contributor c LEFT JOIN Contribution con ON c.ContributorID = con.ContributorID " +
                       "WHERE c.TypeID = 1 " +
                       "GROUP BY c.ContributorID " +
                       "ORDER BY c.ContributorID ASC";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query);
                     ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Contributor contributor = new Contributor(
                                rs.getInt("ContributorID"),
                                rs.getString("FullName"),
                                rs.getString("Avatar"),
                                rs.getString("Email"),
                                rs.getString("Phone"),
                                rs.getDate("JoinDate"),
                                rs.getString("Description"),
                                rs.getString("OrganizationName"),
                                rs.getInt("TypeID")
                        );
                        contributor.setActivityCount(rs.getInt("activityCount"));
                        contributor.setTotalHours(rs.getInt("totalHours"));
                        list.add(contributor);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn danh sách ban tổ chức: " + e.getMessage());
        }
        return list;
    }

    public List<Contributor> getTopVolunteersByActivityCount(int limit) {
        String query = "SELECT c.ContributorID, c.FullName, c.Avatar, c.Email, c.Phone, c.JoinDate, c.Description, c.OrganizationName, c.TypeID, " +
                       "COUNT(DISTINCT t.ActivityID) AS activityCount " +
                       "FROM Contributor c LEFT JOIN Contribution t " +
                       "ON c.ContributorID = t.ContributorID " +
                       "WHERE c.TypeID = 2 " +
                       "GROUP BY c.ContributorID " +
                       "ORDER BY activityCount DESC, c.JoinDate DESC " +
                       "LIMIT ?";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, limit);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            Contributor contributor = new Contributor(
                                    rs.getInt("ContributorID"),
                                    rs.getString("FullName"),
                                    rs.getString("Avatar"),
                                    rs.getString("Email"),
                                    rs.getString("Phone"),
                                    rs.getDate("JoinDate"),
                                    rs.getString("Description"),
                                    rs.getString("OrganizationName"),
                                    rs.getInt("TypeID")
                            );
                            contributor.setActivityCount(rs.getInt("activityCount"));
                            list.add(contributor);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn tình nguyện viên theo số hoạt động: " + e.getMessage());
        }
        return list;
    }

    /**
     * Lấy toàn bộ tình nguyện viên (TypeID = 2) kèm activityCount và totalHours.
     */
    public List<Contributor> getAllVolunteers() {
        String query = "SELECT c.ContributorID, c.FullName, c.Avatar, c.Email, c.Phone, c.JoinDate, c.Description, c.OrganizationName, c.TypeID, " +
                       "COUNT(DISTINCT t.ActivityID) AS activityCount, " +
                       "COALESCE(SUM(t.HoursParticipated), 0) AS totalHours " +
                       "FROM Contributor c LEFT JOIN Contribution t ON c.ContributorID = t.ContributorID " +
                       "WHERE c.TypeID = 2 " +
                       "GROUP BY c.ContributorID " +
                       "ORDER BY c.JoinDate DESC";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query);
                     ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Contributor contributor = new Contributor(
                                rs.getInt("ContributorID"),
                                rs.getString("FullName"),
                                rs.getString("Avatar"),
                                rs.getString("Email"),
                                rs.getString("Phone"),
                                rs.getDate("JoinDate"),
                                rs.getString("Description"),
                                rs.getString("OrganizationName"),
                                rs.getInt("TypeID")
                        );
                        contributor.setActivityCount(rs.getInt("activityCount"));
                        contributor.setTotalHours(rs.getInt("totalHours"));
                        list.add(contributor);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn danh sách tình nguyện viên: " + e.getMessage());
        }
        return list;
    }

    public List<Contributor> getTopDonorsByDonationAmount(int limit) {
        String query = "SELECT c.ContributorID, c.FullName, c.Avatar, c.Email, c.Phone, c.JoinDate, c.Description, c.OrganizationName, c.TypeID, " +
                       "COALESCE(SUM(con.ContributionAmount), 0) AS DonationAmount " +
                       "FROM Contributor c LEFT JOIN Contribution con ON c.ContributorID = con.ContributorID " +
                       "WHERE c.TypeID = 4 " +
                       "GROUP BY c.ContributorID " +
                       "ORDER BY DonationAmount DESC LIMIT ?";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, limit);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            Contributor contributor = new Contributor(
                                    rs.getInt("ContributorID"),
                                    rs.getString("FullName"),
                                    rs.getString("Avatar"),
                                    rs.getString("Email"),
                                    rs.getString("Phone"),
                                    rs.getDate("JoinDate"),
                                    rs.getString("Description"),
                                    rs.getString("OrganizationName"),
                                    rs.getInt("TypeID")
                            );
                            contributor.setDonationAmount(rs.getLong("DonationAmount"));
                            list.add(contributor);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn nhà hảo tâm theo số tiền đóng góp: " + e.getMessage());
        }
        return list;
    }

    public List<Contributor> getAllDonors() {
        String query = "SELECT c.ContributorID, c.FullName, c.Avatar, c.Email, c.Phone, c.JoinDate, c.Description, c.OrganizationName, c.TypeID, " +
                       "COALESCE(SUM(con.ContributionAmount), 0) AS DonationAmount " +
                       "FROM Contributor c LEFT JOIN Contribution con ON c.ContributorID = con.ContributorID " +
                       "WHERE c.TypeID = 4 " +
                       "GROUP BY c.ContributorID " +
                       "ORDER BY DonationAmount DESC, c.JoinDate DESC";

        List<Contributor> list = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query);
                     ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Contributor contributor = new Contributor(
                                rs.getInt("ContributorID"),
                                rs.getString("FullName"),
                                rs.getString("Avatar"),
                                rs.getString("Email"),
                                rs.getString("Phone"),
                                rs.getDate("JoinDate"),
                                rs.getString("Description"),
                                rs.getString("OrganizationName"),
                                rs.getInt("TypeID")
                        );
                        contributor.setDonationAmount(rs.getLong("DonationAmount"));
                        list.add(contributor);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn danh sách nhà hảo tâm: " + e.getMessage());
        }
        return list;
    }

    public long getTotalDonationAmount() {
        String query = "SELECT COALESCE(SUM(con.ContributionAmount), 0) AS totalDonation " +
                       "FROM Contributor c LEFT JOIN Contribution con ON c.ContributorID = con.ContributorID " +
                       "WHERE c.TypeID = 4";

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(query);
                     ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getLong("totalDonation");
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn tổng số tiền đóng góp: " + e.getMessage());
        }
        return 0L;
    }

    public Map<Integer, Integer> getActivityCountsByContributorIds(List<Integer> contributorIds) {
        Map<Integer, Integer> counts = new HashMap<>();
        if (contributorIds == null || contributorIds.isEmpty()) {
            return counts;
        }

        StringBuilder queryBuilder = new StringBuilder(
                "SELECT ContributorID, COUNT(DISTINCT ActivityID) AS activityCount " +
                "FROM Contribution WHERE ContributorID IN (");
        for (int i = 0; i < contributorIds.size(); i++) {
            queryBuilder.append("?");
            if (i < contributorIds.size() - 1) {
                queryBuilder.append(",");
            }
        }
        queryBuilder.append(") GROUP BY ContributorID");

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {
                    for (int i = 0; i < contributorIds.size(); i++) {
                        stmt.setInt(i + 1, contributorIds.get(i));
                    }
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            counts.put(rs.getInt("ContributorID"), rs.getInt("activityCount"));
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn số lượng hoạt động của người đóng góp: " + e.getMessage());
        }

        return counts;
    }

    // Hàm main dùng để kiểm thử nhanh nghiệp vụ kết nối và lấy số liệu thống kê
    public static void main(String[] args) {
        StatisticService service = new StatisticService();
        ContributorStats stats = service.getContributorStats();
        
        System.out.println("\n===== KẾT QUẢ THỐNG KÊ =====");
        System.out.println("Tổng số người đóng góp: " + stats.getTotalContributors());
        System.out.println("Tổng số tình nguyện viên: " + stats.getTotalVolunteers());
        System.out.println("Tổng số nhà tài trợ & đối tác: " + stats.getTotalSponsors());
        System.out.println("Tổng số nhà hảo tâm: " + stats.getTotalDonors());
        System.out.println("============================");
    }
}
