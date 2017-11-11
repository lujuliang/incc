package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import online.incc.mapper.CertificateMapper;
import online.incc.model.Certificate;
import online.incc.service.CertificateService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

@Service("certificateService")
public class CertificateServiceImpl extends BaseService<Certificate> implements CertificateService {
	@Resource
	private CertificateMapper certificateMapper;

	@Value("${fileupload.ewm.path}")
	private String ewmPath;

	@Override
	public PageInfo<Certificate> selectByPage(Certificate certificate, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Certificate.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(certificate.getProName())) {
			criteria.andLike("proName", "%" + certificate.getProName() + "%");
		}
		PageHelper.startPage(page, length);
		List<Certificate> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="certificate",key="#key")
	public Certificate selectByKey(Integer key) {
		Certificate certificate = super.selectByKey(key);
		if (certificate != null) {
			String ewm = certificate.getEwmPath();
			certificate.setEwmPath(ewmPath + ewm);
			String sedate = certificate.getStartDt() + " 至 " + certificate.getEndDt();
			certificate.setStartDt(sedate);
		}
		return certificate;
	}

}
