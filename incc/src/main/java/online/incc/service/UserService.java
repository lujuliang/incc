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

}
