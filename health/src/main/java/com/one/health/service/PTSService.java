package com.one.health.service;

import java.util.List;

import com.one.health.dto.PTSDto;

public interface PTSService {
	boolean insertPT(PTSDto pts);
	List<PTSDto> getTimeList(PTSDto pts);
	PTSDto getTime(PTSDto pts);
}
