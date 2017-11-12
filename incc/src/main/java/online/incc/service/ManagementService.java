package online.incc.service;

import com.github.pagehelper.PageInfo;

import online.incc.model.ApprovalInfo;
import online.incc.model.Management;

/**
 * 
 * @author Administrator
 *
 */
public interface ManagementService extends IService<Management> {
	PageInfo<Management> selectByPage(Management management, int start, int length);
	Management selectByKey(Integer key);
}
