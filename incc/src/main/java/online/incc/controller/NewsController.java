package online.incc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.model.News;
import online.incc.service.NewsService;
import online.incc.vo.NewsVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class NewsController {
	@Resource
	private NewsService newsService;
	
	@Value("${online.incc.base}")
	private String inccBase;

	@RequestMapping(value="/news/news",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getAll(News news, String draw,
			@RequestParam(required = false, defaultValue = "1") int start,
			@RequestParam(required = false, defaultValue = "10") int length) {
		Map<String, Object> map = new HashMap<>();
		PageInfo<News> pageInfo = newsService.selectByPage(news, start, length);
		List<News> newss = pageInfo.getList();
		
		if(newss != null && newss.size()>0) {
			for(News n:newss) {
				String link = inccBase + "/fileupload/html/news/" + n.getLink();
				n.setLink(link);
			}
		}
		
		map.put("draw", draw);
		map.put("recordsTotal", pageInfo.getTotal());
		map.put("recordsFiltered", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}
	
	@RequestMapping("/news/save")
	@ResponseBody
	public String add(@RequestBody NewsVO news, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF");
		try {
			newsService.add(news, realPath);
		} catch (IOException e) {
			return "error";
		} catch (TemplateException e) {
			return "error";
		}
		return "success";
	}
	
	@CacheEvict(cacheNames="news", allEntries=true)
    @RequestMapping(value = "/news/delete")
	@ResponseBody
    public String delete(Integer id){
        try{
            newsService.delete(id);
            //更新权限
            return "success";
        }catch (Exception e){
            return "fail";
        }
    }

}
