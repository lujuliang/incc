package online.incc.model;

import java.io.Serializable;

import javax.persistence.*;

@Table(name = "inspection_info")
public class InspectionInfo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2183774258064429987L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "pro_id")
    private Integer proId;

    private String content;
    @Column(name = "insp_org")
    private String inspOrg;
    private String result;
    private String note;
    @Column(name = "user_id")
    private Integer userId;

    /**
     * @return id
     */
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

    /**
     * ��ȡ���ָ��
     *
     * @return content - ���ָ��
     */
    public String getContent() {
        return content;
    }

    /**
     * ���ü��ָ��
     *
     * @param content ���ָ��
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * ��ȡ��ⷽ
     *
     * @return insp_org - ��ⷽ
     */
    public String getInspOrg() {
        return inspOrg;
    }

    /**
     * ���ü�ⷽ
     *
     * @param inspOrg ��ⷽ
     */
    public void setInspOrg(String inspOrg) {
        this.inspOrg = inspOrg;
    }

    /**
     * @return result
     */
    public String getResult() {
        return result;
    }

    /**
     * @param result
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * @return note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note
     */
    public void setNote(String note) {
        this.note = note;
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
}