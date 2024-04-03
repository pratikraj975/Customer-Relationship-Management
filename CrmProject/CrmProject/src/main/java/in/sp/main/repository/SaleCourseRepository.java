package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.main.entity.SaleCourse;

public interface SaleCourseRepository extends JpaRepository<SaleCourse, Integer>
{
	@Query("SELECT date, COUNT(id) FROM SaleCourse GROUP BY date")
	List<Object[]> countByPurchasedDate();
}
