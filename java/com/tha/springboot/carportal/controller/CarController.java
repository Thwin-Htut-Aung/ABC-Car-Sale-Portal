package com.tha.springboot.carportal.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tha.springboot.carportal.entity.Car;
import com.tha.springboot.carportal.entity.CarBidding;
import com.tha.springboot.carportal.entity.User;
import com.tha.springboot.carportal.service.BidService;
import com.tha.springboot.carportal.service.CarService;
import com.tha.springboot.carportal.service.UserService;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class CarController {

	//use slf4j logger to log the program
    private static Logger logger = LoggerFactory.getLogger(CarController.class);

    //inject dependencies
    @Autowired
    private CarService carService;
    
    @Autowired
    private BidService bidService;
    
    @Autowired
    private UserService userService;

    //default mapping directs to home page
    @GetMapping("/")
    public String handleRootRequest(Model model) {
        return "index";
    }

    //view cars page
    @GetMapping("cars")
    public String viewCars(Model model) {
        List<Car> cars = carService.getAllCars();
        if(!CollectionUtils.isEmpty(cars)) {
            model.addAttribute("cars", cars);
        }
        return "view_cars";
    }
    
    //add new car page
    @GetMapping("new_car")
	public String addCar(Map<String, Object> model) {
    	System.out.println("To show add new car page");
		Car car = new Car();
		model.put("car", car);
		return "new_car";
	}

    //saving new car
    @PostMapping("cars")
    public String saveCar(Car car, Model model) {
    	
    	System.out.println("Save & Update new car");
        carService.saveCar(car);	       
        return "redirect:cars";
    }
    

    //For Bidding, view car details
    @GetMapping("car_details")
	public ModelAndView viewCarDetails(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("car_details");
		Car car = carService.get(id);
		mav.addObject("car", car);
		mav.addObject("bidinfo", bidService.listBidInfo((car)));
	return mav;
	}
    
    //saving the bidprice
    @PostMapping("car_details")
	   public String saveBid(@RequestParam(value="id", required = false) Long id,
	                           @RequestParam("bidprice") String bidprice,
	                           Model model) {
		   
		  //To store the bid information into the database 
		  //Get current user
		   String uname="";
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uname=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uname=principal.toString();
		   }
		   
		   Long carid=id;
		   Car car = carService.get(id);
		   User user=userService.getUserByName(uname);
		   Date cur_time=new Date();
		   

	       CarBidding carBidInfo = new CarBidding();
	       carBidInfo.setBidderName(uname);
	       carBidInfo.setBidderPrice(bidprice);
	       carBidInfo.setCar(car);
	       carBidInfo.setUser(user);
	       carBidInfo.setBid_date_time(cur_time);
	      
	       logger.debug("Car Bidder Price:{}, Car ID: {}", carBidInfo.getBidderPrice(),carBidInfo.getId(),carBidInfo.getBidderName(),carBidInfo.getCar());
	       
	       bidService.save(carBidInfo);

	       model.addAttribute("car", car);		
	       model.addAttribute("bidinfo", bidService.listBidInfo(car));
	       
	       return "car_details";
	 }
  
	//edit car page
    @GetMapping("edit")
	public String editCar(@RequestParam long id, Model model) {
    	System.out.println("Update car controller method");
		Car car = carService.get(id);
		model.addAttribute("car", car);
		return "new_car";
	}
    
	
	//deleting cars
	@RequestMapping("delete")
	public String deleteCar(@RequestParam long id) {
		carService.delete(id);
		return "redirect:/cars";		
	}
	
	//searching for cars using a keyword
	@RequestMapping("search")
	public ModelAndView search(@RequestParam String keyword) {
		List<Car> result = carService.search(keyword);
		ModelAndView mav = new ModelAndView("search_results");
		mav.addObject("keyword", keyword);
		mav.addObject("search_cars", result);
		return mav;		
	}	

    
    
}
