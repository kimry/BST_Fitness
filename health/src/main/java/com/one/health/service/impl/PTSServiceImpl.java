package com.one.health.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.health.dao.PTSDao;
import com.one.health.dto.PTSDto;
import com.one.health.dto.sDto;
import com.one.health.service.PTSService;

@Service
public class PTSServiceImpl implements PTSService{
	
	@Autowired
	PTSDao dao;

	@Override
	public boolean insertPT(PTSDto pts) {
		return dao.insertPT(pts);
	}

	@Override
	public List<PTSDto> getTimeList(PTSDto pts) {
		return dao.getTimeList(pts);
	}

	@Override
	public PTSDto getTime(PTSDto pts) {
		return dao.getTime(pts);
	}

	@Override
	public List<sDto> getTodayList(String mid) {
		return dao.getTodayList(mid);
	}

	@Override
	public List<sDto> getUpcomingList(String mid) {
		return dao.getUpcomingList(mid);
	}

	@Override
	public List<sDto> getPastList(String mid) {
		return dao.getPastList(mid);
	}

	@Override
	public List<sDto> getTodayListT(String tid) {
		return dao.getTodayListT(tid);
	}

	@Override
	public List<sDto> getUpcomingListT(String tid) {
		return dao.getUpcomingListT(tid);
	}

	@Override
	public List<sDto> getPastListT(String tid) {
		return dao.getPastListT(tid);
	}
	
	
	
}
