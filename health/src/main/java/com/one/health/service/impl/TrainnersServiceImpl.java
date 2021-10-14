package com.one.health.service.impl;

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
}
