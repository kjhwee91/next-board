package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

// 3주차 요구사항 댓글 쓰기
@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column
	private String writer;
	
	@ManyToOne
	@JsonIgnore
	private Board board;

	@Column(length=1000, nullable=false)
	private String content;
	
	public Comment(){}
	
	public Comment(Board board, String content){
		this.setBoard(board);
		this.content = content;
	}
	
	
	public Board getBoard(){
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


}
