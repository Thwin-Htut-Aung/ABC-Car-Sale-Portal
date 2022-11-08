package com.tha.springboot.carportal.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tha.springboot.carportal.entity.Car;
import com.tha.springboot.carportal.entity.CarBidding;
import com.tha.springboot.carportal.entity.Role;

import java.util.List;
import java.util.Set;


@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long> {

	@Query( "select b from CarBidding b where b.car in :carid" )
	List<CarBidding> findByCarid(@Param("carid") Car car);
}
