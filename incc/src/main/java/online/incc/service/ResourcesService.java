package online.incc.service;

import com.github.pagehelper.PageInfo;
import online.incc.model.SysResources;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author Administrator
 *
 */
public interface ResourcesService extends IService<SysResources> {
    PageInfo<SysResources> selectByPage(SysResources resources, int start, int length);

    public List<SysResources> queryAll();

    public List<SysResources> loadUserResources(Map<String,Object> map);

    public List<SysResources> queryResourcesListWithSelected(Integer rid);
}
