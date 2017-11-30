package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.RoleMapper;
import online.incc.mapper.UserRoleMapper;
import online.incc.model.SysRole;
import online.incc.model.SysUser;
import online.incc.model.SysUserRole;
import online.incc.service.UserService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

@Service("userService")
public class UserServiceImpl extends BaseService<SysUser> implements UserService{
    @Resource
    private UserRoleMapper userRoleMapper;
   
    @Resource
    private RoleMapper roleMapper;

    @Override
    public PageInfo<SysUser> selectByPage(SysUser sysUser, int start, int length) {
        int page = start/length+1;
        Example example = new Example(SysUser.class);
        Example.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotEmpty(sysUser.getUsername())) {
            criteria.andLike("username", "%" + sysUser.getUsername() + "%");
        }
        if (sysUser.getId() != null) {
            criteria.andEqualTo("id", sysUser.getId());
        }
        if (sysUser.getEnable() != null) {
            criteria.andEqualTo("enable", sysUser.getEnable());
        }
        //分页查询
        PageHelper.startPage(page, length);
        List<SysUser> userList = selectByExample(example);
        return new PageInfo<>(userList);
    }

    @Override
    public SysUser selectByUsername(String username) {
        Example example = new Example(SysUser.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username",username);
        List<SysUser> userList = selectByExample(example);
        if(userList.size()>0){
            return userList.get(0);
        }
            return null;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
    public void delUser(Integer userid) {
        //删除用户表
        mapper.deleteByPrimaryKey(userid);
        //删除用户角色表
        Example example = new Example(SysUserRole.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userid",userid);
        userRoleMapper.deleteByExample(example);
    }

	@Override
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public void saveUserAndRole(SysUser sysUser) {
		super.save(sysUser);
		if(sysUser.getType() == 0) {//会员用户分配默认权限
			Example example = new Example(SysRole.class);
	        Example.Criteria criteria = example.createCriteria();
	        criteria.andEqualTo("id",6);
			List<SysRole> roles = roleMapper.selectByExample(example);
			if(!roles.isEmpty()) {
				SysUserRole ur = new SysUserRole();
				ur.setRoleid(roles.get(0).getId()+"");
				ur.setUserid(sysUser.getId());
				userRoleMapper.insert(ur);
			}	
		}
		
	}
}
