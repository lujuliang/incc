package online.incc.service;

import com.github.pagehelper.PageInfo;
import online.incc.model.SysUser;
import online.incc.model.SysUserRole;

/**
 * 
 * @author Administrator
 *
 */
public interface UserService extends IService<SysUser>{
    PageInfo<SysUser> selectByPage(SysUser sysUser, int start, int length);

    SysUser selectByUsername(String username);

    void delUser(Integer userid);

    /**
     * user type =0 set 会员role to this user，else save user only
     * @param sysUser
     */
	void saveUserAndRole(SysUser sysUser);

}
