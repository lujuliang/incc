package online.incc.vo;

public class ProductVO {

	private String proName;

	private String type;

	private String produceName;

	private Integer produceId;

	private Integer manangmentId;
	
	private Integer brandId;

	private String brandName;

	private String startDt;

	private String endDt;

	/**商品照片**/
	private String picPath;
	
	/**检测报告**/
	private String insPath;
	
	private String awardDt;

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProduceName() {
		return produceName;
	}

	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getStartDt() {
		return startDt;
	}

	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public Integer getProduceId() {
		return produceId;
	}

	public void setProduceId(Integer produceId) {
		this.produceId = produceId;
	}

	public Integer getManangmentId() {
		return manangmentId;
	}

	public void setManangmentId(Integer manangmentId) {
		this.manangmentId = manangmentId;
	}

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public String getAwardDt() {
		return awardDt;
	}

	public void setAwardDt(String awardDt) {
		this.awardDt = awardDt;
	}

	public String getInsPath() {
		return insPath;
	}

	public void setInsPath(String insPath) {
		this.insPath = insPath;
	}
}
