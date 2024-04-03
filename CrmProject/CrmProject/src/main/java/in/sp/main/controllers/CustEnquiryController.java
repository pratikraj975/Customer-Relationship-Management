package in.sp.main.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.CustEnquiry;
import in.sp.main.entity.CustFollowup;
import in.sp.main.entity.Employee;
import in.sp.main.model.CustEnquiryModel;
import in.sp.main.service.CustEnquiryService;
import in.sp.main.service.CustFollowupService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustEnquiryController
{
	@Autowired
	ProductService productService;
	
	@Autowired
	CustEnquiryService custEnquiryService;
	
	@Autowired
	CustFollowupService custFollowupService;
	
	@GetMapping("/customerEnquiryPage")
	public String customerEnquiryPage(
			Model model,
			@RequestParam(name = "redirect_success", required = false) String success,
			@RequestParam(name = "redirect_error", required = false) String error)
	{
		List<String> list_coursenames = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list_coursenames);
		
		model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel());
		
		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);
		
		return "customer-enquiry";
	}
	
	@PostMapping("/custEnquiryForm")
	public String custEnquiryForm(
			HttpSession session,
			@ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel custEnquiryModel,
			RedirectAttributes redirectAttributes
			)
	{
		LocalDate date = LocalDate.now();
		String date1 = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		
		LocalTime time = LocalTime.now();
		String time1 = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
		Employee employee = (Employee) session.getAttribute("session_employee");
		String empemail = "";
		if(employee != null)
		{
			empemail = employee.getEmail();
		}
		
		String phoneno = custEnquiryModel.getPhoneno();
		
		CustEnquiry custEnquiry = custEnquiryModel.getCustEnquiry();
		custEnquiry.setPhoneno(phoneno);
		custEnquiry.setEnquirydate(date1);
		custEnquiry.setEnquirytime(time1);
		custEnquiry.setEmpemail(empemail);
		
		CustFollowup custFollowup = custEnquiryModel.getCustFollowup();
		custFollowup.setPhoneno(phoneno);
		
		boolean status1 = custEnquiryService.addCustEnquiryDetailsService(custEnquiry);
		boolean status2 = custFollowupService.addCustFollowupDateService(custFollowup);
		
		if(status1 && status2)
		{
			redirectAttributes.addAttribute("redirect_success", "Customer enquiry details added successfully");
		}
		else
		{
			redirectAttributes.addAttribute("redirect_error", "Customer enquiry details not added due to some error");
		}
		
		return "redirect:/customerEnquiryPage";
	}
	
	@GetMapping("/customerFolloupPage")
	public String customerFolloupPage(
			Model model,
			@RequestParam(name = "selectedDate", required = false) String selectedDate)
	{
		if(selectedDate != null)
		{
			List<CustFollowup> list_followups = custFollowupService.getFollowupForProvidedDate(selectedDate);
			model.addAttribute("model_followups", list_followups);
		}
		else
		{
			LocalDate ld = LocalDate.now();
			String date1 = ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			List<CustFollowup> list_followups = custFollowupService.getFollowupForProvidedDate(date1);
			model.addAttribute("model_followups", list_followups);
		}
		return "customer-followups";
	}
	
	@GetMapping("/checkPhoneNumberAvailability")
	@ResponseBody
	public String checkPhoneNo(@RequestParam("phoneNumber") String phoneno)
	{
		boolean status = custEnquiryService.isPhoneNumberExists(phoneno);
		if(status)
		{
			return "exist";
		}
		return "not_exist";
	}
	
	@GetMapping("/custEnquiryHistoryPage")
	public String opencustEnquiryHistoryPage(@RequestParam("phno") String phoneno, Model model)
	{
		List<CustEnquiry> list_custenq = custEnquiryService.getCustAllEnquiryHistory(phoneno);
		model.addAttribute("model_custenq", list_custenq);
		
		model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel());
		
		List<String> list_coursenames = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list_coursenames);
		
		return "cusenq-history";
	}
}
