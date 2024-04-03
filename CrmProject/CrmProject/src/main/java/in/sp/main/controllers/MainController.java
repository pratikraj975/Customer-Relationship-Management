package in.sp.main.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Employee;
import in.sp.main.service.EmpService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController 
{
	@Autowired
	EmpService empService;
	
	@GetMapping("/")
	public String openIndexPage()
	{
		return "index";
	}
	@GetMapping("/home")
	public String openHomePage()
	{
		return "index";
	}
	
	@GetMapping("/login")
	public String openLoginPage()
	{
		return "login";
	}
	
	int PAGE_SIZE = 5;
	@GetMapping("/emplist")
	public String openEmpListPage(
				@RequestParam(name = "redirectAttr_success", required = false) String success,
				@RequestParam(name = "redirectAttr_error", required = false) String error,
				Model model,
				@RequestParam(defaultValue = "1") int page
			)
	{
		List<Employee> list_emp = empService.getAllEmployeesService();
		
		int TOTAL_PRODUCTS = list_emp.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);
		
		
		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_END_INDEX = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);
		
		List<Employee> new_list_emp = list_emp.subList(LIST_START_INDEX, LIST_END_INDEX);
		
		model.addAttribute("model_list_emp", new_list_emp);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);
		
		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);
		
		return "employees-list";
	}
	
	@GetMapping("/profileAdmin")
	public String openAdminProfilePage()
	{
		return "profile-admin";
	}
	
	@PostMapping("/loginForm")
	public String loginForm(
								@RequestParam("email1") String myemail,
								@RequestParam("pass1") String mypass,
								Model model,
								HttpSession session
							)
	{
		String page = "login";
		if(myemail.equals("admin@gmail.com") && mypass.equals("admin123"))
		{
			page = "profile-admin";
		}
		else
		{
			Employee emp = empService.authenticate(myemail);
			if(emp != null && emp.getPassword().equals(mypass))
			{
				session.setAttribute("session_employee", emp);
				page = "home-employee";
			}
			else
			{
				model.addAttribute("model_error", "Email id and password didnt matched");
				page = "login";
			}
		}
		return page;
	}
	
	@GetMapping("/addEmployee")
	public String openAddEmpPage(Model model)
	{
		model.addAttribute("modelEmpAttr", new Employee());
		return "add-employee";
	}
	
	@PostMapping("/addEmpForm")
	public String registerEmployeeForm(
											@Valid @ModelAttribute("modelEmpAttr") Employee emp,
											BindingResult br,
											Model model
										)
	{
		if(!br.hasErrors())
		{
			boolean status = empService.addEmployeeService(emp);
			if(status)
			{
				model.addAttribute("model_success", "Employee added successfully");
			}
			else
			{
				model.addAttribute("model_error", "Employee not added due to some error");
			}
			
			emp.setName("");
			emp.setEmail("");
			emp.setPassword("");
			emp.setPhoneno("");
		}
		
		return "add-employee";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "login";
	}
	
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("empEmail") String email, RedirectAttributes redirectAttributes)
	{
		//System.out.println("Email : "+email);
		
		boolean status = empService.deleteEmployeeService(email);
		if(status)
		{
			redirectAttributes.addAttribute("redirectAttr_success", "Employee deleted successfully");
		}
		else
		{
			redirectAttributes.addAttribute("redirectAttr_error", "Employee not deleted due to some error");
		}
		
		return "redirect:/emplist";
	}
	
	@GetMapping("/editEmployee")
	public String openEditEmpPage(@RequestParam("empEmail") String email, Model model)
	{
		//System.out.println("Email id : "+email);
		
		Employee emp = empService.authenticate(email);
		
		model.addAttribute("modelEmpAttr", new Employee());
		model.addAttribute("model_emp", emp);
		
		return "edit-employee";
	}
	
	@PostMapping("/updateEmpForm")
	public String updateEmployeeForm(
											@Valid @ModelAttribute("modelEmpAttr") Employee emp,
											BindingResult br,
											Model model
										)
	{
		if(!br.hasErrors())
		{
			boolean status = empService.updateEmployeeService(emp);
			if(status)
			{
				model.addAttribute("model_success", "Employee updated successfully");
			}
			else
			{
				model.addAttribute("model_error", "Employee not updated due to some error");
			}
		}
		
		return "edit-employee";
	}
	
	@GetMapping("/profileEmployee")
	public String openEmpProfile()
	{
		return "profile-employee";
	}
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/homeEmployee")
	public String openEmpHome(Model model)
	{
		List<Object[]> list = productService.getPurchasedCourseCountService();
		
		model.addAttribute("model_count_course_sale", list);
		
		return "home-employee";
	}
}
