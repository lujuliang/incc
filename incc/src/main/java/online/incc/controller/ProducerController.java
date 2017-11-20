package online.incc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import online.incc.model.Producer;
import online.incc.service.ProducerService;
import tk.mybatis.mapper.entity.Example;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class ProducerController {
	@Resource
	private ProducerService producerService;

	@RequestMapping("/producer/producers")
	@ResponseBody
	public List<Producer> getBrands() {
		Example example = new Example(Producer.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId", (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId"));
		return producerService.selectByExample(example);
	}
}
