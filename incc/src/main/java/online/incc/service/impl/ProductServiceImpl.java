package online.incc.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ApprovalInfoMapper;
import online.incc.mapper.BrandMapper;
import online.incc.mapper.InspectionInfoMapper;
import online.incc.mapper.ManagementMapper;
import online.incc.mapper.ProducerMapper;
import online.incc.mapper.ProductMapper;
import online.incc.model.ApprovalInfo;
import online.incc.model.Brand;
import online.incc.model.InspectionInfo;
import online.incc.model.Management;
import online.incc.model.Producer;
import online.incc.model.Product;
import online.incc.service.ProductService;
import online.incc.util.RealPath;
import online.incc.vo.ProductAddVO;
import online.incc.vo.ProductListVO;
import online.incc.vo.ProductVO;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

@Service("productService")
public class ProductServiceImpl extends BaseService<Product> implements ProductService {
	@Resource
	private ProductMapper productMapper;
	
	@Resource
	private ManagementMapper managementMapper;
	
	@Resource
	private ProducerMapper producerMapper;
	
	@Resource
	private BrandMapper brandMapper;
	
	@Resource
	private InspectionInfoMapper inspectionInfoMapper;
	
	@Resource
	private ApprovalInfoMapper approvalInfoMapper;

	@Value("${online.incc.base}")
	private String inccBase;
	
	@Value("${fileupload.productinfo.path}")
	private String productinfoPath;
	
	@Value("${fileupload.ins.path}")
	private String insPath;
	
	@Value("${fileupload.ewm.path}")
	private String ewmBasePath;

	@Override
	public PageInfo<Product> selectByPage(Product product, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(product.getProName())) {
			criteria.andLike("proName", "%" + product.getProName() + "%");
		}
		PageHelper.startPage(page, length);
		List<Product> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="productVO",key="#key")
	public ProductVO selectProductInfoByKey(Integer key) {
		ProductVO product = productMapper.selectProductInfoByKey(key);
		if (product != null) {
			String sedate = product.getStartDt() + " 至 " + product.getEndDt();
			product.setStartDt(sedate);
			String fileName = product.getPicPath();
			product.setPicPath(inccBase+productinfoPath+fileName);
			String insName = product.getInsPath();
			product.setInsPath(inccBase+insPath+insName);
		}
		return product;
	}

	@Override
	public Product selectByKey(Integer key) {
		return super.selectByKey(key);
	}

	@Override
	public PageInfo<ProductListVO> selectProducts(ProductListVO productList, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(productList.getProName())) {
			criteria.andLike("proName", "%" + productList.getProName() + "%");
		}
		PageHelper.startPage(page, length);
		Integer userid = userId();
		List<ProductListVO> list = productMapper.selectProductListVO(userid,productList.getProName());
		if(CollectionUtils.isNotEmpty(list)) {
			for(ProductListVO vo : list) {
				if(vo.getEwmPath() != null) {
					vo.setEwmPath(inccBase+ewmBasePath + vo.getEwmPath());
				}
			}
		}
		return new PageInfo<>(list);
	}
	

	@Override
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public String add(ProductAddVO vo,String realPath) {
		Date d = new Date();
		String dateStr = d.toLocaleString();
		d.toLocaleString();
		Integer userId = userId();
		String realBasePath = RealPath.getRealPath(realPath);
		//1经营主体
		Management management = vo.getManagement();
		if(management.getId() == 0) {//初次提交
			management.setCreateDt(dateStr);
			management.setUserId(userId);
			managementMapper.insertUseGeneratedKeys(management);
		}
		//2生产主体
		Producer producer = vo.getProducer();
		if(producer.getId() == 0) {
			producer.setCreateDt(dateStr);
			producer.setUserId(userId);
			producerMapper.insertUseGeneratedKeys(producer);
		}
		//3品牌信息
		Brand brand = vo.getBrand();
		if(brand.getId() == 0) {
			brand.setUserId(userId);
			brandMapper.insertUseGeneratedKeys(brand);
		}
		//4商品
		Product product = vo.getProduct();
		product.setManagementId(management.getId());
		product.setProduceId(producer.getId());
		product.setBrandId(brand.getId());
		product.setCreateDt(dateStr);
		product.setStatus("progress");
		product.setUserId(userId);

		//上传图片
		MultipartFile proFile = vo.getProFile();
        String profileName = userId+"_"+RealPath.getCode()+"_" +proFile.getOriginalFilename();
        try {
			proFile.transferTo(new File(realBasePath+ "/productinfo/"+profileName));
		
			product.setPicPath(profileName);
        } catch (IllegalStateException e) {
        	return "error";
		} catch (IOException e) {
			return "error";
		}
        MultipartFile insFile = vo.getInsFile();
        String insName = userId+"_"+RealPath.getCode()+"_" +proFile.getOriginalFilename();
        try {
        	insFile.transferTo(new File(realBasePath+"/ins/"+insName));
        	product.setInspectionReportPath(insName);
		} catch (IllegalStateException e) {
			 return "error";
		} catch (IOException e) {
            return "error";
		}
        
        
		productMapper.insertUseGeneratedKeys(product);
		//5审批信息
		ApprovalInfo approvalInfo = vo.getApprovalInfo();
		approvalInfo.setUserId(userId);
		approvalInfo.setProId(product.getId());
		
		MultipartFile approvalFile = vo.getApprovalFile();
        String approvalName = userId+"_"+RealPath.getCode()+"_" + approvalFile.getOriginalFilename();
        try {
        	approvalFile.transferTo(new File(realBasePath+"/approval/"+approvalName));
        	approvalInfo.setPicPath(approvalName);
		} catch (IllegalStateException e) {
			 return "error";
		} catch (IOException e) {
            return "error";
		}
		
		approvalInfoMapper.insertUseGeneratedKeys(approvalInfo);
		//6检测信息
		List<InspectionInfo> inspectionInfos = vo.getInspectionInfos();
		if(!CollectionUtils.isEmpty(inspectionInfos)) {
			for(InspectionInfo ins:inspectionInfos) {
				if(ins.getContent() !=null && ins.getContent().length()>0 && ins.getInspOrg()!=null && ins.getInspOrg().length()>0) {
					ins.setProId(product.getId());
					ins.setUserId(userId);
					inspectionInfoMapper.insertUseGeneratedKeys(ins);
				}
			}
		}
		return "success";
	}

}
