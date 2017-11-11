package online.incc.service;

import online.incc.model.SysUserRole;

/**
 * 
 * @author Administrator
 *
 */
public interface UserRoleService extends IService<SysUserRole> {

    public void addUserRole(SysUserRole sysUserRole);
}
