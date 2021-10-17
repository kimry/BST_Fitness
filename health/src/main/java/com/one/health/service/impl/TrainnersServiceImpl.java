package com.one.health.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.TrainnersDao;
import com.one.health.dto.TrainnersDto;
import com.one.health.service.TrainnersService;

@Service
public class TrainnersServiceImpl implements TrainnersService{
	
	@Autowired
	TrainnersDao dao;

	@Override
	public boolean insertTrainners(TrainnersDto trainner) {
		return dao.insertTrainners(trainner);
	}

	@Override
	public List<TrainnersDto> getTrainnersList() {
		return dao.getTrainnerList();
	}

	@Override
	public TrainnersDto getTrainner(String tid) {
		return dao.getTrainner(tid);
	}

	@Override
	public List<TrainnersDto> getPTList() {
		return dao.getPTList();
	}

	@Override
	public List<TrainnersDto> getPLList() {
		return dao.getPLList();
	}
	
	
}
