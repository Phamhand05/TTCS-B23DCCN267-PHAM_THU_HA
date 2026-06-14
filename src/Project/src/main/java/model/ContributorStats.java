package model;

/**
 * Lớp ContributorStats lưu trữ các thông tin số liệu thống kê của người đóng góp.
 * Đây là lớp Immutable (chỉ đọc) phù hợp với mong muốn chỉ lấy dữ liệu của bạn.
 */
public class ContributorStats {
    private final int totalContributors;
    private final int totalVolunteers;
    private final int totalSponsors;
    private final int totalDonors;

    public ContributorStats(int totalContributors, int totalVolunteers, int totalSponsors, int totalDonors) {
        this.totalContributors = totalContributors;
        this.totalVolunteers = totalVolunteers;
        this.totalSponsors = totalSponsors;
        this.totalDonors = totalDonors;
    }

    public int getTotalContributors() {
        return totalContributors;
    }

    public int getTotalVolunteers() {
        return totalVolunteers;
    }

    public int getTotalSponsors() {
        return totalSponsors;
    }

    public int getTotalDonors() {
        return totalDonors;
    }

    @Override
    public String toString() {
        return "ContributorStats{" +
                "totalContributors=" + totalContributors +
                ", totalVolunteers=" + totalVolunteers +
                ", totalSponsors=" + totalSponsors +
                ", totalDonors=" + totalDonors +
                '}';
    }
}
