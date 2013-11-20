package org.nhnnext.web;

import java.util.List;

import javax.servlet.http.HttpSession;

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

@RequestMapping("/board")
@Controller
public class BoardController {

	private static final Logger log = LoggerFactory
			.getLogger(BoardController.class);

	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private CommentRepository commentRepository;

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file, HttpSession session) {
		log.debug("board : {}", board);
		FileUploader.upload(file);
		board.setFilename(file.getOriginalFilename());
		String writer = (String) session.getAttribute("strId");
		board.setWriter(writer);
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

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		log.debug("delete board : {}", id);
		Board board = boardRepository.findOne(id);
//		List<Comment> comments = board.getComments();
//
//		if (comments.isEmpty() != true) {
//			for (Comment c : comments) {
//				commentRepository.delete(c);
//			}
//		}

		boardRepository.delete(board);
		return "redirect:/board/list";
	}

	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		Board foundBoard = boardRepository.findOne(id);
		model.addAttribute("board", foundBoard);
		return "edit";
	}

	@RequestMapping(value = "/editsave/{id}", method = RequestMethod.POST)
	public String editsave(@PathVariable Long id, Board board, MultipartFile file) {
		log.debug("board : {}", board);
		log.debug("getfilename:{}", file.getOriginalFilename());
		Board beforeBoard = boardRepository.findOne(id);
		log.debug("beforefile:{}", beforeBoard.getFilename());
		beforeBoard.setTitle(board.getTitle());
		beforeBoard.setContents(board.getContents());

		if (file.getOriginalFilename() != "") {
			FileUploader.upload(file);
			beforeBoard.setFilename(file.getOriginalFilename());
		}

		boardRepository.save(beforeBoard);
		return "redirect:/board/" + beforeBoard.getId();
	}
}
