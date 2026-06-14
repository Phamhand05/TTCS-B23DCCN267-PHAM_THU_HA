package model;

import java.sql.Date;

public class Contributor {
    private int contributorId;
    private String fullName;
    private String avatar;
    private String email;
    private String phone;
    private Date joinDate;
    private String description;
    private String organizationName;
    private int typeId;
    private long donationAmount;
    private int activityCount;
    private int totalHours;

    public Contributor() {
    }

    public Contributor(int contributorId, String fullName, String avatar, String email, String phone, Date joinDate, String description, String organizationName, int typeId) {
        this.contributorId = contributorId;
        this.fullName = fullName;
        this.avatar = avatar;
        this.email = email;
        this.phone = phone;
        this.joinDate = joinDate;
        this.description = description;
        this.organizationName = organizationName;
        this.typeId = typeId;
    }

    public int getContributorId() {
        return contributorId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public String getDescription() {
        return description;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public int getTypeId() {
        return typeId;
    }

    public long getDonationAmount() {
        return donationAmount;
    }

    public void setDonationAmount(long donationAmount) {
        this.donationAmount = donationAmount;
    }

    public int getActivityCount() {
        return activityCount;
    }

    public void setActivityCount(int activityCount) {
        this.activityCount = activityCount;
    }

    public int getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(int totalHours) {
        this.totalHours = totalHours;
    }

    @Override
    public String toString() {
        return "Contributor{" +
                "contributorId=" + contributorId +
                ", fullName='" + fullName + '\'' +
                ", avatar='" + avatar + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", joinDate=" + joinDate +
                ", description='" + description + '\'' +
                ", organizationName='" + organizationName + '\'' +
                ", typeId=" + typeId +
                '}';
    }
}
