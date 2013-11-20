package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
@RequestMapping("/login") 
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
		
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String create(User usr){
		userRepository.save(usr);
		return "success";
	}
	
    @RequestMapping(value="", method=RequestMethod.POST)
	public String login(String strId, String password, HttpSession session) {
    	User user = userRepository.findByStrId(strId);
    	String savedPassword = user.getPassword();
    	int login = savedPassword.compareToIgnoreCase(password);

    	if(login==0) {
        	session.setAttribute("strId", strId);
        	return "redirect:/";
        } else {
        	return "join";
        }
    }
    	
    @RequestMapping(value="/out")
    public String logout(HttpSession session){
    	session.removeAttribute("strId");
    	return "redirect:/";
    }
    
    @RequestMapping(value="/joinform")
    public String form(){
		return "join";
    }
 
}