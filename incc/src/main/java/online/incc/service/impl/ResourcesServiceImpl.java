package online.incc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import online.incc.mapper.ResourcesMapper;
import online.incc.model.SysResources;
import online.incc.model.SysUser;
import online.incc.service.ResourcesService;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author Administrator
 *
 */
@Service("resourcesService")
public class ResourcesServiceImpl extends BaseService<SysResources> implements ResourcesService {
   @Resource
    private ResourcesMapper resourcesMapper;

    @Override
    public PageInfo<SysResources> selectByPage(SysResources resources, int start, int length) {
        int page = start/length+1;
        Example example = new Example(SysResources.class);
        //分页查询
        PageHelper.startPage(page, length);
        List<SysResources> userList = selectByExample(example);
        return new PageInfo<>(userList);
    }

    @Override
    public List<SysResources> queryAll(){
        return resourcesMapper.queryAll();
    }

    @Override
    @Cacheable(cacheNames="resources",key="#map['userid'].toString()+#map['type']")
    public List<SysResources> loadUserResources(Map<String, Object> map) {
        return resourcesMapper.loadUserResources(map);
    }

    @Override
    public List<SysResources> queryResourcesListWithSelected(Integer rid) {
        return resourcesMapper.queryResourcesListWithSelected(rid);
    }
}
