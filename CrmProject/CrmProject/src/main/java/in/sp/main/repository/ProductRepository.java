package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.main.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>
{
	Product findByCoursename(String coursename);
	
	@Query("SELECT coursename FROM Product")
	List<String> findCourseName();
}
