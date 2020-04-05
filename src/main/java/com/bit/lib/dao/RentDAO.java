package com.bit.lib.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.lib.dto.RentDTO;


@Repository
public interface RentDAO {

	public List<RentDTO> getRentHistoryList(String id);

	public List<RentDTO> selectRentNow(String id);

	int renew(List<String> chkcodes);
}
