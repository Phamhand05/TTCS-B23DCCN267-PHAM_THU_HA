package model;

public class Contribution {
    private int contributionId;
    private int contributorId;
    private int activityId;
    private String roleInActivity;
    private int hoursParticipated;

    public Contribution() {
    }

    public Contribution(int contributionId, int contributorId, int activityId, String roleInActivity, int hoursParticipated) {
        this.contributionId = contributionId;
        this.contributorId = contributorId;
        this.activityId = activityId;
        this.roleInActivity = roleInActivity;
        this.hoursParticipated = hoursParticipated;
    }

    public int getContributionId() {
        return contributionId;
    }

    public int getContributorId() {
        return contributorId;
    }

    public int getActivityId() {
        return activityId;
    }

    public String getRoleInActivity() {
        return roleInActivity;
    }

    public int getHoursParticipated() {
        return hoursParticipated;
    }

    @Override
    public String toString() {
        return "Contribution{" +
                "contributionId=" + contributionId +
                ", contributorId=" + contributorId +
                ", activityId=" + activityId +
                ", roleInActivity='" + roleInActivity + '\'' +
                ", hoursParticipated=" + hoursParticipated +
                '}';
    }
}
