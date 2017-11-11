package online.incc.vo;

import org.springframework.web.multipart.MultipartFile;

import online.incc.model.SysUser;

public class UserVo {

	private SysUser sysUser;
    public SysUser getUser() {
		return sysUser;
	}
	public void setUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	private MultipartFile file;
}
