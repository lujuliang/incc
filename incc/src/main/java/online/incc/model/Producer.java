package online.incc.model;

import javax.persistence.*;

public class Producer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    @Column(name = "start_dt")
    private String startDt;

    @Column(name = "end_dt")
    private String endDt;

    private String permit;

    @Column(name = "credit_code")
    private String creditCode;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "create_dt")
    private String createDt;

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
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
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

    public String getPermit() {
        return permit;
    }

    public void setPermit(String permit) {
        this.permit = permit;
    }

    public String getCreditCode() {
        return creditCode;
    }

    public void setCreditCode(String creditCode) {
        this.creditCode = creditCode;
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

    /**
     * @return create_dt
     */
    public String getCreateDt() {
        return createDt;
    }

    /**
     * @param createDt
     */
    public void setCreateDt(String createDt) {
        this.createDt = createDt;
    }
}