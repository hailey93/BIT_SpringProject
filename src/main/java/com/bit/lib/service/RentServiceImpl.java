package com.bit.lib.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.RentDAO;
import com.bit.lib.dto.RentDTO;


@Service("rentService")
public class RentServiceImpl implements RentService {
	
	@Autowired
	private RentDAO rentDAO;

	@Override
	public List<RentDTO> getRentHistoryList(String id) {
		// TODO Auto-generated method stub
		return rentDAO.getRentHistoryList(id);
	}

	@Override
	public List<RentDTO> selectRentNow(String id) {
		
		rentDAO.selectRentNow(id);
		List<RentDTO> rentDTO=new ArrayList<RentDTO>();
		for(RentDTO dto:rentDTO) { //여러개의 대여현황을 for문으로 하나씩 돌려줌
			System.out.println("*******"+rentDTO);
			if(dto.getDatedif()>0) { //연체일수가 0보다 크면 아래(==연체중이라는것)
				if(dto.getRentStatus()!=3) { //대여상태가 3(연체)가 아니면
					rentDAO.overdue(dto.getBookNo()); //대여상태를 3으로 바꿔주기
				}else { //대여상태가 이미 3이면 바로 대여현황 출력
					return rentDAO.selectRentNow(id);
				}
				
			} 
		}
		return rentDAO.selectRentNow(id);
	}

	@Override
	public void renew(List<String> chkcodes) {
		
		for(String chkcode:chkcodes) {
			System.out.println(chkcode);
			String bookNo=chkcode;
			System.out.println(bookNo);
			rentDAO.renew(bookNo);
		}
	}
		

	@Override
	public void bookRent(List<String> chknos, String id) {
		// TODO Auto-generated method stub
		String bookNo = chknos.get(0).toString();
		System.out.println(bookNo+"///"+id+"rent");
		rentDAO.bookRent(bookNo, id);
	}

	@Override
	public void bookstUpdate(List<String> chknos) {
		// TODO Auto-generated method stub
		String bookNo = chknos.get(0).toString();
		System.out.println(bookNo+"rentup");
		rentDAO.bookstUpdate(bookNo);
	}
	
	@Override
	public void reserveCancel(List<String> chknos) {
		String bookNo = chknos.get(0).toString();
		
		rentDAO.reserveCancel(bookNo);
	}

	
}
