package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	
	@RequestMapping(value = "/putcomments/{id}", method=RequestMethod.POST)
	public String create(@PathVariable Long id, String content){
		Board board = boardRepository.findOne(id);
		Comment cmt = new Comment(board, content);
		commentRepository.save(cmt);
		return "redirect:/board/{id}";
	}
	
}






