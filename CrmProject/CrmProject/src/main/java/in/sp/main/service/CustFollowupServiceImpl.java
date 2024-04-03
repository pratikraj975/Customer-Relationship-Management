package in.sp.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.CustFollowup;
import in.sp.main.repository.CustFollowupRepository;

@Service
public class CustFollowupServiceImpl implements CustFollowupService
{
	@Autowired
	CustFollowupRepository custFollowupRepository;
	
	@Override
	public boolean addCustFollowupDateService(CustFollowup custFollowup)
	{
		boolean status = false;
		
		try
		{
			CustFollowup custFollowup_db = custFollowupRepository.findByPhoneno(custFollowup.getPhoneno());
			if(custFollowup_db != null)
			{
				custFollowup_db.setFollowupdate(custFollowup.getFollowupdate());
				custFollowupRepository.save(custFollowup_db);
			}
			else
			{
				custFollowupRepository.save(custFollowup);
			}
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			status = false;
		}
		
		return status;
	}
	
	@Override
	public List<CustFollowup> getFollowupForProvidedDate(String date)
	{
		return custFollowupRepository.findByFollowupdate(date);
	}
}
