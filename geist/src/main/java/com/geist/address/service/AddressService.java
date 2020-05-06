package com.geist.address.service;

import java.util.List;

import com.geist.address.domain.AddressViewVO;
import com.geist.main.domain.Criteria;


public interface AddressService {
	public List<AddressViewVO> getList(Criteria cri);
}
