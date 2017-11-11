package online.incc.model;

import javax.persistence.*;

public class Certificate {
    @Id
    @Column(name = "pro_id")
    private Integer proId;

    @Column(name = "pro_name")
    private String proName;

    @Column(name = "produce_name")
    private String produceName;

    @Column(name = "brand_name")
    private String brandName;

    @Column(name = "start_dt")
    private String startDt;

    @Column(name = "end_dt")
    private String endDt;

    @Column(name = "ewm_path")
    private String ewmPath;

    @Column(name = "award_org")
    private String awardOrg;

    @Column(name = "award_dt")
    private String awardDt;

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

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    /**
     * @return produce_name
     */
    public String getProduceName() {
        return produceName;
    }

    /**
     * @param produceName
     */
    public void setProduceName(String produceName) {
        this.produceName = produceName;
    }

    /**
     * @return brand_name
     */
    public String getBrandName() {
        return brandName;
    }

    /**
     * @param brandName
     */
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    /**
     * @return start_dt
     */
    public String getStartDt() {
        return startDt;
    }

    /**
     * @param startDt
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }

    /**
     * @return end_dt
     */
    public String getEndDt() {
        return endDt;
    }

    /**
     * @param endDt
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }

    /**
     * @return ewm_path
     */
    public String getEwmPath() {
        return ewmPath;
    }

    /**
     * @param ewmPath
     */
    public void setEwmPath(String ewmPath) {
        this.ewmPath = ewmPath;
    }

    public String getAwardOrg() {
        return awardOrg;
    }

    public void setAwardOrg(String awardOrg) {
        this.awardOrg = awardOrg;
    }

    public String getAwardDt() {
        return awardDt;
    }

    public void setAwardDt(String awardDt) {
        this.awardDt = awardDt;
    }
}