package org.nhnnext.web;

import java.util.Collections;
import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.support.FileUploader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping("/board/form")
	public String form() {
		return "form";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		log.debug("board : {}",board);
		// TODO FileUploader API를 활용해 업로드한 파일을 복사한다.
		// TODO 첨부한 이미지 정보를 데이터베이스에 추가한다.
		FileUploader.upload(file);
		board.setFilename(file.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
		return "redirect:/board/" + savedBoard.getId();
	}	

	@RequestMapping("/board/{id}")
	public String show(@PathVariable Long id, Model model1) {
		// TODO DB에서 id에 해당하는 Board 데이터를 조회해야 한다.
		// TODO 조회한 Board 데이터를 Model에 저장해야 한다.
		Board foundBoard = boardRepository.findOne(id);
		model1.addAttribute("board", foundBoard);
		return "view";
	}
	
    @RequestMapping("/board/list")
    public String list(Model model) {
    	model.addAttribute("boards", boardRepository.findAll());
        return "list";
    }
        

		
}
