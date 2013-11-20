package org.nhnnext.web;

import java.util.List;

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
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	/*
	@RequestMapping(value = "/putcomments/{id}", method=RequestMethod.POST)
	public String create(@PathVariable Long id, String content){
	 	log.debug("comment : {}", cmt);
		Board board = boardRepository.findOne(id);
		Comment cmt = new Comment(board, content);
	 	log.debug("comment : {}", cmt);
		commentRepository.save(cmt);
		return "redirect:/board/{id}";
	}	
	*/
	
	@RequestMapping(value = "/putcomments/{id}.json", method=RequestMethod.POST)
	public @ResponseBody Comment createJSON(@PathVariable Long id, String content){
        Board board = boardRepository.findOne(id);
        Comment comment = new Comment(board, content); 
        Comment savedComment = commentRepository.save(comment);
        return savedComment;
	}
    
    @RequestMapping("/commentdelete/{id}")
    public String delete(@PathVariable Long id) {
    	
    	Comment cmt = commentRepository.findOne(id);
    	Board board = cmt.getBoard();
    	commentRepository.delete(cmt);

    	return "redirect:/board/" + board.getId();
    }
    
}

