package online.incc.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ProductMapper;
import online.incc.model.Certificate;
import online.incc.model.Product;
import online.incc.service.ApprovalService;
import online.incc.service.CertificateService;
import online.incc.util.RealPath;
import online.incc.util.ZXingUtil;
import online.incc.vo.ProductListVO;

@Service("approvalService")
public class ApprovalServiceImpl extends BaseService<Product> implements ApprovalService {
	@Resource
	private ProductMapper productMapper;
	
	@Resource
	private CertificateService certificateService;
	
	@Value("${online.incc.base}")
	private String inccBase;
	
	private static String ewmUrl ="/incc/ewm/";
	
	@Override
	public PageInfo<ProductListVO> selectProducts(ProductListVO productList, int start, int length) {
		int page = start / length + 1;
		PageHelper.startPage(page, length);

		List<ProductListVO> list = productMapper.selectProductListVO(null,productList.getProName());
		
		return new PageInfo<>(list);
	}

	@Override
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public String makesure(Certificate cert, String realPath) {
		String certUrl = inccBase + ewmUrl+cert.getProId();
		String emwName = cert.getProId()+"_"+cert.getProName()+".png";
		String ewmPath =RealPath.getRealPath(realPath)+"ewm/" ;
		//1生成二维码
		ZXingUtil.encode(certUrl,300, 300, ewmPath+"ewm_certer.png", ewmPath+ emwName);
		//2保存证书
		cert.setEwmPath(emwName);
		if(cert!=null) {
			Date d = new Date();
			String date = d.toLocaleString().split(" ")[0];
			cert.setAwardDt(date);
		}
		certificateService.delete(cert.getProId());
		certificateService.save(cert);
		Product p = new Product();
		p.setStatus("pass");
		p.setId(cert.getProId());
		productMapper.updateByPrimaryKeySelective(p);
		return "success";
	}
}
