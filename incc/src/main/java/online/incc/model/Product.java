package online.incc.model;

import java.io.Serializable;

import javax.persistence.*;

public class Product implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -5036645319006624421L;

	@Id
    @Column(name = "pro_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer proId;

    @Column(name = "pro_name")
    private String proName;

    private String type;
    @Column(name = "management_id")
    private Integer managementId;

    @Column(name = "brand_id")
    private Integer brandId;

    @Column(name = "produce_id")
    private Integer produceId;

    @Column(name = "start_dt")
    private String startDt;

    @Column(name = "end_dt")
    private String endDt;

    @Column(name = "pic_path")
    private String picPath;

    private String status;
    
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "create_dt")
    private String createDt;

    @Column(name = "inspection_report_path")
    private String inspectionReportPath;

    public Integer getProId() {
        return proId;
    }

    /**
     * @param proId
     */
    public void setProId(Integer proId) {
        this.proId = proId;
    }

    /**
     * @return pro_name
     */
    public String getProName() {
        return proName;
    }

    /**
     * @param proName
     */
    public void setProName(String proName) {
        this.proName = proName;
    }

    /**
     * @return type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    public Integer getManagementId() {
        return managementId;
    }

    public void setManagementId(Integer managementId) {
        this.managementId = managementId;
    }

    /**
     * @return brand_id
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * @param brandId
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getProduceId() {
        return produceId;
    }

    public void setProduceId(Integer produceId) {
        this.produceId = produceId;
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

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCreateDt() {
        return createDt;
    }

    public void setCreateDt(String createDt) {
        this.createDt = createDt;
    }

    /**
     * @return inspection_report_path
     */
    public String getInspectionReportPath() {
        return inspectionReportPath;
    }

    /**
     * @param inspectionReportPath
     */
    public void setInspectionReportPath(String inspectionReportPath) {
        this.inspectionReportPath = inspectionReportPath;
    }
}