package online.incc.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import online.incc.model.ApprovalInfo;
import online.incc.model.Brand;
import online.incc.model.InspectionInfo;
import online.incc.model.Management;
import online.incc.model.Producer;
import online.incc.model.Product;

public class ProductAddVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8309342266322743030L;
	private Product product;
	private Brand brand;
	private Producer producer;
	private Management management;
	private ApprovalInfo approvalInfo;
	private List<InspectionInfo> inspectionInfos;
	
	private MultipartFile proFile;
	private MultipartFile insFile;
	private MultipartFile approvalFile;
	private MultipartFile manageFile;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Producer getProducer() {
		return producer;
	}
	public void setProducer(Producer producer) {
		this.producer = producer;
	}
	public Management getManagement() {
		return management;
	}
	public void setManagement(Management management) {
		this.management = management;
	}
	public ApprovalInfo getApprovalInfo() {
		return approvalInfo;
	}
	public void setApprovalInfo(ApprovalInfo approvalInfo) {
		this.approvalInfo = approvalInfo;
	}
//	public InspectionInfo getInspectionInfo() {
//		return inspectionInfo;
//	}
//	public void setInspectionInfo(InspectionInfo inspectionInfo) {
//		this.inspectionInfo = inspectionInfo;
//	}
	public MultipartFile getProFile() {
		return proFile;
	}
	public void setProFile(MultipartFile proFile) {
		this.proFile = proFile;
	}
	public MultipartFile getInsFile() {
		return insFile;
	}
	public void setInsFile(MultipartFile insFile) {
		this.insFile = insFile;
	}
	public List<InspectionInfo> getInspectionInfos() {
		return inspectionInfos;
	}
	public void setInspectionInfos(List<InspectionInfo> inspectionInfos) {
		this.inspectionInfos = inspectionInfos;
	}
	public MultipartFile getApprovalFile() {
		return approvalFile;
	}
	public void setApprovalFile(MultipartFile approvalFile) {
		this.approvalFile = approvalFile;
	}
	public MultipartFile getManageFile() {
		return manageFile;
	}
	public void setManageFile(MultipartFile manageFile) {
		this.manageFile = manageFile;
	}
}
