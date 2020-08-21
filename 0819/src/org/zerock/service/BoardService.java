package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.zerock.dto.BoardDTO;

/*
 * --고객의 요구사항--
 * 게시물 
 * 등록
 * 수정
 * 삭제
 * 조회
 * 목록
*/
public class BoardService {

	private List<BoardDTO> list;
	
	//싱글톤
	private static BoardService instance = new BoardService();
	
	public static BoardService getInstance() {
		
		return instance;
	}
	
	private BoardService() {
		this.list = new ArrayList<>();
		
		for(int i=0; i<10; i++) {
			BoardDTO dto = new BoardDTO();
			dto.setTitle("제목...."+i);
			dto.setContent("내용......"+i);
			dto.setWriter("user"+i);
			
//			System.out.println(dto);
			//target = dto.getBoardno();
			
			list.add(dto);
		}
	}
	
	//boardno로 검색 -- 자료구조

	//equals와 hashcode ===> boardno 가 중요 // DTO에 생성 (EQ, HC) 
	
	//등록
	public void add(BoardDTO dto) {
		this.list.add(dto);
		
	}
	
	//삭제 - 식별데이터- boardno
	public boolean delete(String boardno) {
		//index로 하는방법
		//object로 하는방법
		//--> boardno로 가짜 btoㄹ만듬 
		BoardDTO dto = new BoardDTO();
		dto.setBoardno(boardno);
		
		return this.list.remove(dto);
	}
	
	//목록 - 가장 최신글이 맨 위에
	public List<BoardDTO> getList(){
		return this.list;
	}
	
	//조회
	public BoardDTO findByBoardNO(String boardno) throws Exception{
		
		//인덱스 번호를 찾아야함 (arraylist) -- indexof --eq, hc
		BoardDTO dto = new BoardDTO();
		dto.setBoardno(boardno);
		
		int idx = list.indexOf(dto);
		
		if(idx ==-1) {
			throw new Exception("Not Exist!!");
		}
		
		return list.get(idx);
		//없을경우 -1이 나올수도있음 
		
		
	}
	//수정
	public void update(BoardDTO param) throws Exception{
		
		
		BoardDTO dto = findByBoardNO(param.getBoardno());
		
		if(dto == null) {
			throw new Exception("Not Exist!!");
		}
		
		dto.setContent(param.getContent());
		dto.setTitle(param.getTitle());
		
		System.out.println(dto);
	}
	

	
}
