package com.bit.lib.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bit.lib.dto.RentDTO;


@Repository
public interface RentDAO {

	public List<RentDTO> getRentHistoryList(String id);

	public List<RentDTO> selectRentNow(String id);

	void renew(RentDTO rentDTO);
	
	void searchRent(String bookNo, int rentStatus, int reserveStatus, String id);
	void bookRent(List<String> chknos, String bookNo, String id);
	void bookstUpdate(List<String> chknos, String bookNo);
}
