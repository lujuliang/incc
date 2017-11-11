package online.incc.service;

import com.github.pagehelper.PageInfo;
import online.incc.model.SysRole;

import java.util.List;

public interface RoleService extends IService<SysRole> {

    public List<SysRole> queryRoleListWithSelected(Integer uid);

    PageInfo<SysRole> selectByPage(SysRole role, int start, int length);

    /**
     * 删除角色 同时删除角色资源表中的数据
     * @param roleid
     */
    public void delRole(Integer roleid);
}
