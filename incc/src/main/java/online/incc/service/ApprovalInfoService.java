package online.incc.service;

import com.github.pagehelper.PageInfo;

import online.incc.model.ApprovalInfo;

/**
 * 
 * @author Administrator
 *
 */
public interface ApprovalInfoService extends IService<ApprovalInfo> {
	PageInfo<ApprovalInfo> selectByPage(ApprovalInfo approvalInfo, int start, int length);
	ApprovalInfo selectByProId(Integer proId);
}
