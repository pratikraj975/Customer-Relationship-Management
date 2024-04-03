package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.CustEnquiry;

public interface CustEnquiryService 
{
	public boolean addCustEnquiryDetailsService(CustEnquiry custEnquiry);
	public boolean isPhoneNumberExists(String phoneNumber);
	public List<CustEnquiry> getCustAllEnquiryHistory(String phoneno);
}
