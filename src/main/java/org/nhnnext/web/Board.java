package org.nhnnext.web;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Board {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column
	private String writer;
	
	@Column(length=50, nullable=false)
	private String title;
	
	@Column(length=1000, nullable=false)
	private String contents;
	
	// cascade : DB관련 - board를 삭제할 때 같이 삭제하라는 기능
	@OneToMany(mappedBy="board", fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private List<Comment> comments;
	
	private String filename;
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "Board [title=" + title + ", contents=" + contents + ", filenames=" + filename + "]";
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public List<Comment> getComments(){
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}

