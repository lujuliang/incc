package online.incc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import online.incc.mapper.ResourcesMapper;
import online.incc.mapper.UserRoleMapper;
import online.incc.model.SysUser;
import online.incc.model.SysUserRole;
import online.incc.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl extends BaseService<SysUser> implements UserService{
    @Resource
    private UserRoleMapper userRoleMapper;

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
}
