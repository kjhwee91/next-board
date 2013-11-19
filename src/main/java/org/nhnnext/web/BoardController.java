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

// 1주차 미션3. 사진을 추가할 수 잇는 입력화면과 Controller생성
@RequestMapping("/board")
@Controller
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping("/form")
	public String form() {
		return "form";
	}
	
	// 2w1m1.사진 웹 서비스에 이미지를 첨부한다.
	// 2w1m2. 입력한 데이터와 이미지 정보를 데이터베이스에 추가한다.
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		log.debug("board : {}",board);
		FileUploader.upload(file);
		board.setFilename(file.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
		return "redirect:/board/" + savedBoard.getId();
	}	

	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model) {
		Board foundBoard = boardRepository.findOne(id);
		model.addAttribute("board", foundBoard);
		return "view";
	}
	
    @RequestMapping("/list")
    public String list(Model model) {
    	model.addAttribute("boards", boardRepository.findAll());
        return "list";
    }
    
    
    // 2w-3-m1 생성한 데이터를 삭제한다.
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
    	Board board = boardRepository.findOne(id);
    	List<Comment> comments = board.getComments();
    	if (comments.isEmpty() == false){
    		for (Comment c: comments){
    			commentRepository.delete(c);
    		}
    	}
    	boardRepository.delete(board);
        return "redirect:/board/list";
    }        
    
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
		Board foundBoard = boardRepository.findOne(id);
		model.addAttribute("board", foundBoard);
    	return "edit";
    }
    
    @RequestMapping(value = "/saveedit/{id}", method = RequestMethod.POST)
    public String editsave(@PathVariable Long id, Board board, MultipartFile file) {
    	Board beforeBoard = boardRepository.findOne(id);
    	beforeBoard.setTitle(board.getTitle());
    	beforeBoard.setContents(board.getContents());
    	
    	if (file == null){
    		String filename = beforeBoard.getFilename();
    		beforeBoard.setFilename(filename);
    	} else {
    		FileUploader.upload(file);
    		beforeBoard.setFilename(file.getOriginalFilename());
    	}
    	
		String filename = beforeBoard.getFilename();
		beforeBoard.setFilename(filename);

    	boardRepository.save(beforeBoard);
    	return "redirect:/board/" + beforeBoard.getId();
    }
}
