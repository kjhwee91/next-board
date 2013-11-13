package org.nhnnext.web;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String login(String userId, String password, Model model) {
    	// TODO userId에 해당하는 사용를 데이터베이스에서 조회
    	// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인 
    	model.addAttribute("userId", userId);
    	return "redirect:/";
	}
    
    @RequestMapping(value="/joinform")
    public String form(){
		return "join";
    }
 
}