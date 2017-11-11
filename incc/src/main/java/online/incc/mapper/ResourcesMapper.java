package online.incc.mapper;

import online.incc.model.SysResources;
import online.incc.util.MyMapper;

import java.util.List;
import java.util.Map;

public interface ResourcesMapper extends MyMapper<SysResources> {

    public List<SysResources> queryAll();

    public List<SysResources> loadUserResources(Map<String,Object> map);

    public List<SysResources> queryResourcesListWithSelected(Integer rid);
}