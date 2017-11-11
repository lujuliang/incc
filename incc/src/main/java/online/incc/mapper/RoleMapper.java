package online.incc.mapper;

import online.incc.model.SysRole;
import online.incc.util.MyMapper;

import java.util.List;

public interface RoleMapper extends MyMapper<SysRole> {
    public List<SysRole> queryRoleListWithSelected(Integer id);
}