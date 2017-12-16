package online.incc.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 *
 */
public class GenerateHtml {

	/**
	 * 根据模板生成html文件
	 * @param <T>
	 * @param request
	 * @param templateName	模板名称
	 * @param htmlName	html文件名称
	 * @throws IOException 
	 * @throws TemplateException 
	 */
	public static <T> void generate(String root, String packages, T t, String templateName, String htmlName) throws IOException, TemplateException{
		FileOutputStream fos = null;
		Writer writer = null;
		try {
			// 设置相关配置
			Configuration configuration = new Configuration();
			configuration.setDirectoryForTemplateLoading(new File(root + "html/template"));//	模板存放地址
			configuration.setObjectWrapper(new DefaultObjectWrapper());
			configuration.setDefaultEncoding("UTF-8");// 默认编码
			
			// 根据模板名称获取模板
			Template template = configuration.getTemplate(templateName);
			
			// 设置模板参数
			Map<String, Object> paramMap = new HashMap<String, Object>();// 模板参数
			if ("news.html".equals(templateName)) {// 
				paramMap.put("news", t);// 
			}
			
			// 生成输出流
			File html = new File(root+packages, htmlName);// html文件
			if (html.exists()) {// 文件已存在时删除原有文件
				html.delete();
			}
			fos = new FileOutputStream(html);
			writer = new OutputStreamWriter(fos,"UTF-8");
			
			// 生成模板
			template.process(paramMap, writer);
			
			System.out.println("成功生成html文件--" + htmlName);
		}  finally {
			try {
				if (fos != null) {
					fos.close();
				}
				if (writer != null) {
					writer.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
