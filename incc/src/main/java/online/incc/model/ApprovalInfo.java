package online.incc.model;

import javax.persistence.*;

@Table(name = "approval_info")
public class ApprovalInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "pro_id")
    private Integer proId;
    private String name;
    @Column(name = "audit_num")
    private String auditNum;
    @Column(name = "dt_term")
    private String dtTerm;
    @Column(name = "approv_org")
    private String approvOrg;
    @Column(name = "user_id")
    private Integer userId;
    @Column(name = "pic_path")
    private String picPath;

    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return pro_id
     */
    public Integer getProId() {
        return proId;
    }

    /**
     * @param proId
     */
    public void setProId(Integer proId) {
        this.proId = proId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getAuditNum() {
        return auditNum;
    }

    public void setAuditNum(String auditNum) {
        this.auditNum = auditNum;
    }

    public String getDtTerm() {
        return dtTerm;
    }

    public void setDtTerm(String dtTerm) {
        this.dtTerm = dtTerm;
    }

    public String getApprovOrg() {
        return approvOrg;
    }

    public void setApprovOrg(String approvOrg) {
        this.approvOrg = approvOrg;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }
}