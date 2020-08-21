package org.zerock.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of = {"id"})

@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	
}
