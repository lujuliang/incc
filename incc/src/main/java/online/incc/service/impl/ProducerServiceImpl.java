package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ProducerMapper;
import online.incc.model.Management;
import online.incc.model.Producer;
import online.incc.model.Product;
import online.incc.service.ProducerService;
import tk.mybatis.mapper.entity.Example;

@Service("producerService")
public class ProducerServiceImpl extends BaseService<Producer> implements ProducerService {
	@Resource
	private ProducerMapper producerMapper;

	@Override
	public PageInfo<Producer> selectByPage(Producer producer, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();

		PageHelper.startPage(page, length);
		List<Producer> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="producer",key="#key")
	public Producer selectByKey(Integer key) {
		Producer p = super.selectByKey(key);
		if(p != null) {
			String start = p.getStartDt();
			String end = p.getEndDt();
			p.setStartDt(start+"至"+end);
		}
		return p;
	}

}
