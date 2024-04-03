package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.CustFollowup;

public interface CustFollowupService 
{
	public boolean addCustFollowupDateService(CustFollowup custFollowup);
	public List<CustFollowup> getFollowupForProvidedDate(String date);
}
