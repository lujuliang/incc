package online.incc.mapper;

import online.incc.model.SysUserRole;
import online.incc.util.MyMapper;

import java.util.List;

public interface UserRoleMapper extends MyMapper<SysUserRole> {
    public List<Integer> findUserIdByRoleId(Integer roleId);
}