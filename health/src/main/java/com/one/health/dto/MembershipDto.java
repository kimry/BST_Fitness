package com.one.health.dto;

import java.util.Date;

public class MembershipDto {
	public String mbsId;
	public String mbsName;
	public Date sdate;
	public Date edate;
	
	public MembershipDto() {
		
	}

	public MembershipDto(String mbsId, String mbsName, Date sdate, Date edate) {
		super();
		this.mbsId = mbsId;
		this.mbsName = mbsName;
		this.sdate = sdate;
		this.edate = edate;
	}

	public MembershipDto(String mbsId) {
		this.mbsId = mbsId;
	}

	public String getMbsId() {
		return mbsId;
	}

	public void setMbsId(String mbsId) {
		this.mbsId = mbsId;
	}

	public String getMbsName() {
		return mbsName;
	}

	public void setMbsName(String mbsName) {
		this.mbsName = mbsName;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	@Override
	public String toString() {
		return "mbsId=" + mbsId;
	}



}
