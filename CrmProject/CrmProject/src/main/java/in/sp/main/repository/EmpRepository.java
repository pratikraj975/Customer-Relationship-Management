package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import in.sp.main.entity.Employee;


//@Repository
@Transactional
public interface EmpRepository extends JpaRepository<Employee, Integer>
{
	Employee findByEmail(String email);
	void deleteByEmail(String email);
}