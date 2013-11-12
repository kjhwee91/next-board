package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
@RequestMapping("/login") 
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	
    @RequestMapping(value="", method=RequestMethod.POST)
	public String login(String userId, String password, Model model) {
    	// TODO userId에 해당하는 사용를 데이터베이스에서 조회
    	// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인 
    	model.addAttribute("userId", userId);
    	return "redirect:/";
	}
    
    @RequestMapping(value="/signup")
    public String form(){
		return "join";
    }
    
    @RequestMapping(value="/join", method=RequestMethod.POST)
    public String join(){
    	
    	return "redirect:/";
    }
    
    /*
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		// TODO FileUploader API를 활용해 업로드한 파일을 복사한다.
		// TODO 첨부한 이미지 정보를 데이터베이스에 추가한다.
		FileUploader.upload(file);
		board.setFilename(file.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
		return "redirect:/board/" + savedBoard.getId();
	}

	*/

 
}