package org.zerock.service;

import org.junit.Test;
import org.zerock.dto.BoardDTO;

import junit.framework.Assert;

public class BoardServiceTests {
	
	private BoardService service;
	
	//서비스 테스트 1. add
	@Test
	public void testAdd() {
		
		service = BoardService.getInstance();
		
		String target = "";
		
		for(int i=0; i<10; i++) {
			BoardDTO dto = new BoardDTO();
			dto.setTitle("제목...."+i);
			dto.setContent("내용......"+i);
			dto.setWriter("user"+i);
			
//			System.out.println(dto);
			target = dto.getBoardno();
			
			
			service.add(dto);
		}
		
		
		
		try {
			BoardDTO dto = service.findByBoardNO(target);
			System.out.println(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		System.out.println("--------------------------------");
//		System.out.println(service.getList());
//		
//		System.out.println("===============================");
//		service.delete(target);
//		
//		System.out.println(service.getList());
//		//junit assert == 테스트가 성공해야지만 녹색
//		Assert.assertTrue(service.getList().size()==9);
	}
}
