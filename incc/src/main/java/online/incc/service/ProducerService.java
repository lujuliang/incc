package online.incc.service;

import com.github.pagehelper.PageInfo;

import online.incc.model.Producer;

/**
 * 
 * @author Administrator
 *
 */
public interface ProducerService extends IService<Producer> {
	PageInfo<Producer> selectByPage(Producer Producer, int start, int length);
	Producer selectByKey(Integer key);
}
