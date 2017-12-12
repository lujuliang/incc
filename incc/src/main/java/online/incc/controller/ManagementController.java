package online.incc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import online.incc.model.ApprovalInfo;
import online.incc.model.Management;
import online.incc.service.ApprovalInfoService;
import online.incc.service.ManagementService;
import tk.mybatis.mapper.entity.Example;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class ManagementController {
	@Resource
	private ManagementService managementService;

	@Resource
	private ApprovalInfoService approvalInfoService;
	
	@RequestMapping("/management/managements")
	@ResponseBody
	public List<Management> getManagements() {
		Example example = new Example(Management.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId", (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId"));
		return managementService.selectByExample(example);
	}
	
	@RequestMapping("/management/approvalInfo")
	@ResponseBody
	public ApprovalInfo getApprovalInfo() {
		Example example = new Example(ApprovalInfo.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId", (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId"));
		List<ApprovalInfo> list = approvalInfoService.selectByExample(example);
		return list.isEmpty() ? new ApprovalInfo() : list.get(0);
	}
	
}
