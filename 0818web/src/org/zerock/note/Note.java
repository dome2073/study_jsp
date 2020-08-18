package org.zerock.note;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class Note {
	
	private String from;
	private String to;
	private String content;
	
}
