package com.one.health.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.PTSDao;
import com.one.health.dto.PTSDto;
import com.one.health.service.PTSService;

@Service
public class PTSServiceImpl implements PTSService{
	
	@Autowired
	PTSDao dao;

	@Override
	public boolean insertPT(PTSDto pts) {
		return dao.insertPT(pts);
	}
	
}
