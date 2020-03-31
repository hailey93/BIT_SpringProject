package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.domain.Reserve;
import com.bit.lib.dto.ReserveListDto;

public interface ReserveDAO {

		void insertReserve(Reserve reserve);
		List<ReserveListDto> getReserveList(String id);
		
}
