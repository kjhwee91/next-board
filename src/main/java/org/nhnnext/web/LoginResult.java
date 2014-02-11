package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

public class LoginResult {
	int code;
	String result;
		
	@Autowired
	private UserRepository userRepository;
	
	public LoginResult(int code, String result) {
		this.code = code;
		this.result = result;
	}
	
		
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	
	
}
