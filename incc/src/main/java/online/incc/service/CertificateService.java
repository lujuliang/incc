package online.incc.service;

import com.github.pagehelper.PageInfo;
import online.incc.model.Certificate;

/**
 * 
 * @author Administrator
 *
 */
public interface CertificateService extends IService<Certificate> {
	PageInfo<Certificate> selectByPage(Certificate certificate, int start, int length);

	Certificate selectByKey(Integer key);
}
