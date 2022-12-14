package com.tha.springboot.carportal.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.tha.springboot.carportal.entity.Car;
import com.tha.springboot.carportal.entity.User;
import com.tha.springboot.carportal.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;

	//login page
    @GetMapping("login")
    public String showLogin() {
        return "login";
    }

    //show login error
    @GetMapping("login_error")
    public String showLoginError(Model model) {
        String error_msg = "Incorrect username or password. Try Again.";
        model.addAttribute("error_message", error_msg);
        return "login";
    }
    
    //add new user page(for admins)
    @GetMapping("new")
	public String addUser(Map<String, Object> model) {
    	System.out.println("new Login Controller");
		User user = new User();
		model.put("user", user);
		return "new_user";
	}
    
    //save new user
	@PostMapping("save")
	public String saveUser(@ModelAttribute("user") User user, Model model) {
		System.out.println("/save Login Controller");
		userService.save(user);
		String register_success = "<h5> Registeration Successful! </h5>";
		model.addAttribute("register_success", register_success);
		return "new_user";
	}
	
	//view users page (for admins)
    @GetMapping(value="users")
    public String viewUsers(Model model) {
        List<User> users = userService.listAll();
        if(!CollectionUtils.isEmpty(users)) {
            model.addAttribute("userlists", users);
        }
        return "all_users";
    }
    
    //about us page
    @GetMapping(value="/about")
    public String about() {
        return "about_us";
    }
    
    //contact us page
    @GetMapping(value="/contact")
    public String contact() {
        return "contact_us";
    }
}
