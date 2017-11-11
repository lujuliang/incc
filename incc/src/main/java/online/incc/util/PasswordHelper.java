package online.incc.util;


import online.incc.model.SysUser;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordHelper {
	//private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void encryptPassword(SysUser sysUser) {
		//String salt=randomNumberGenerator.nextBytes().toHex();
		String newPassword = new SimpleHash(algorithmName, sysUser.getPassword(),  ByteSource.Util.bytes(sysUser.getUsername()), hashIterations).toHex();
		//String newPassword = new SimpleHash(algorithmName, user.getPassword()).toHex();
		sysUser.setPassword(newPassword);

	}
	public static void main1(String[] args) {
		PasswordHelper passwordHelper = new PasswordHelper();
		SysUser sysUser = new SysUser();
		sysUser.setUsername("admin");
			sysUser.setPassword("admin");
		passwordHelper.encryptPassword(sysUser);
		System.out.println(sysUser);
	}
}
