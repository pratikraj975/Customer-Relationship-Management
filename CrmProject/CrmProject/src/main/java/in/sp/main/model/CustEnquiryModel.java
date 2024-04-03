package in.sp.main.model;

import in.sp.main.entity.CustEnquiry;
import in.sp.main.entity.CustFollowup;

public class CustEnquiryModel 
{
	private String phoneno;
	private CustEnquiry custEnquiry;
	private CustFollowup custFollowup;
	
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public CustEnquiry getCustEnquiry() {
		return custEnquiry;
	}
	public void setCustEnquiry(CustEnquiry custEnquiry) {
		this.custEnquiry = custEnquiry;
	}
	public CustFollowup getCustFollowup() {
		return custFollowup;
	}
	public void setCustFollowup(CustFollowup custFollowup) {
		this.custFollowup = custFollowup;
	}
}
