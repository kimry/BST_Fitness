package com.one.health.service;

import java.util.List;

import com.one.health.dto.PTSDto;
import com.one.health.dto.sDto;

public interface PTSService {
	boolean insertPT(PTSDto pts);
	List<PTSDto> getTimeList(PTSDto pts);
	PTSDto getTime(PTSDto pts);
	List<sDto> getTodayList(String mid);
	List<sDto> getUpcomingList(String mid);
	List<sDto> getPastList(String mid);
}
