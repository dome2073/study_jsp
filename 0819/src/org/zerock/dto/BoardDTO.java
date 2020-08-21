package org.zerock.dto;

import java.util.UUID;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "boardno")				
public class BoardDTO {
	private String boardno;
	private String title;
	private String content;
	private String writer;
	
	public BoardDTO() {
		this.boardno = UUID.randomUUID().toString();
	}
}
