package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.CustEnquiry;
import java.util.List;


public interface CustEnquiryRepository extends JpaRepository<CustEnquiry, Integer>
{
	boolean existsByPhoneno(String phoneno);
	List<CustEnquiry> findAllByPhoneno(String phoneno);
}
