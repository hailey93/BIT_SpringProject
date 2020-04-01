package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.domain.Reserve;
import com.bit.lib.dto.ReserveListDTO;

public interface ReserveDAO {

		void insertReserve(Reserve reserve);
		List<ReserveListDTO> getReserveList(String id);
		
}
