package online.incc.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name = "sys_user")
public class SysUser implements Serializable{
    private static final long serialVersionUID = -8736616045315083846L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String username;

    private String password;

    /**
     * 是否启用
     */
    private Integer enable;
    
    private Integer type;
    
    private String email;
    
    private String telnum;

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
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取是否启用
     *
     * @return enable - 是否启用
     */
    public Integer getEnable() {
        return enable;
    }

    /**
     * 设置是否启用
     *
     * @param enable 是否启用
     */
    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelnum() {
		return telnum;
	}

	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}

	@Override
    public String toString() {
        return "SysUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enable=" + enable +
                '}';
    }

}