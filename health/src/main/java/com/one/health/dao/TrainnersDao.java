package com.one.health.dao;

import java.util.List;

import com.one.health.dto.TrainnersDto;

public interface TrainnersDao {
	
	boolean insertTrainners(TrainnersDto trainner);
	List<TrainnersDto> getTrainnerList();
	TrainnersDto getTrainner(String tid);
	List<TrainnersDto> getPTList();
	List<TrainnersDto> getPLList();
	boolean updateTrainner(TrainnersDto trainner);
}
