package com.one.health.dao;

import java.util.List;

import com.one.health.dto.PTSDto;
import com.one.health.dto.sDto;

public interface PTSDao {
	boolean insertPT(PTSDto pts);
	List<PTSDto> getTimeList(PTSDto pts);
	PTSDto getTime(PTSDto pts);
	List<sDto> getTodayList(String mid);
	List<sDto> getUpcomingList(String mid);
	List<sDto> getPastList(String mid);
	List<sDto> getTodayListT(String tid);
	List<sDto> getUpcomingListT(String tid);
	List<sDto> getPastListT(String tid);
}
