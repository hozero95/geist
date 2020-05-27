package com.geist.joinRequest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geist.joinRequest.domain.JoinRequestVO;
import com.geist.main.domain.Criteria;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

public interface JoinRequestMapper {
	public List<JoinRequestVO> getListWithPaging(Criteria cri);
	
	public int getCount(Criteria cri);
	
	public JoinRequestVO getDetail(String req_id);
	
	public JoinRequestVO getAllDetail(String req_id);
	
	public Long getDeptNo(String dept_name);
	
	public int insertEmp(@Param("vo") JoinRequestVO vo, @Param("emp_position") String emp_position, @Param("emp_sal") Long emp_sal, @Param("dept_no") Long dept_no, @Param("emp_tel") String emp_tel);
	
	public int deleteRequest(String req_id);
}
