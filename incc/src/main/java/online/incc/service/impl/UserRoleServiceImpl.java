package online.incc.service.impl;

import online.incc.model.SysUserRole;
import online.incc.service.UserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

/**
 * 
 * @author Administrator
 *
 */
@Service("serRoleService")
public class UserRoleServiceImpl extends BaseService<SysUserRole> implements UserRoleService {


    @Override
    @Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
    public void addUserRole(SysUserRole sysUserRole) {
        //删除
        Example example = new Example(SysUserRole.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userid",sysUserRole.getUserid());
        mapper.deleteByExample(example);
        //添加
        String[] roleids = sysUserRole.getRoleid().split(",");
        for (String roleId : roleids) {
            SysUserRole u = new SysUserRole();
            u.setUserid(sysUserRole.getUserid());
            u.setRoleid(roleId);
            mapper.insert(u);
        }

    }
}
