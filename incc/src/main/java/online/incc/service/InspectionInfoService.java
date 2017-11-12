package online.incc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import online.incc.model.InspectionInfo;

/**
 * 
 * @author Administrator
 *
 */
public interface InspectionInfoService extends IService<InspectionInfo> {
	PageInfo<InspectionInfo> selectByPage(InspectionInfo InspectionInfo, int start, int length);
	List<InspectionInfo> selectByProId(Integer proId);
}
