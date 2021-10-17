package com.one.health.service;

import java.util.List;

import com.one.health.dto.TrainnersDto;

public interface TrainnersService {
	boolean insertTrainners(TrainnersDto trainner);
	List<TrainnersDto> getTrainnersList();
	TrainnersDto getTrainner(String tid);
	List<TrainnersDto> getPTList();
	List<TrainnersDto> getPLList();
	boolean updateTrainner(TrainnersDto trainner);
}
