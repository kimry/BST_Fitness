package com.one.health.dao;

import java.util.List;

import com.one.health.dto.PTSDto;

public interface PTSDao {
	boolean insertPT(PTSDto pts);
	List<PTSDto> getTimeList(PTSDto pts);
	PTSDto getTime(PTSDto pts);
	List<PTSDto> getTodayList(String mid);
	List<PTSDto> getUpcomingList(String mid);
	List<PTSDto> getPastList(String mid);
}
