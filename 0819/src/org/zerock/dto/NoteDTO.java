package org.zerock.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class NoteDTO {
	
	private String from;
	private String to;
	private String content;
	
}
