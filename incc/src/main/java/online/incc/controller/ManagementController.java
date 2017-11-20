package online.incc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import online.incc.model.Management;
import online.incc.model.Producer;
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

	@RequestMapping("/management/managements")
	@ResponseBody
	public List<Management> getBrands() {
		Example example = new Example(Management.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId", (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId"));
		return managementService.selectByExample(example);
	}
}
