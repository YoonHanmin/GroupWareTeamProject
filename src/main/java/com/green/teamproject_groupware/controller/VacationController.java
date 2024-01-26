package com.green.teamproject_groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VacationController {
	
	    @RequestMapping(value = "/vacationRequest", method = RequestMethod.GET)
	    public String showVacationRequest() {
	        return "vacationRequest";
	    }

	    @RequestMapping(value = "/myVacationRequests", method = RequestMethod.GET)
	    public String showMyVacationRequests() {
	        return "myVacationRequests";
	    }
}
