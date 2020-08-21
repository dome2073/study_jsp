
package org.zerock.dto;

import org.zerock.service.BoardService;

import lombok.Getter;
import lombok.ToString;

//페이징 DTO클래스
@Getter
@ToString
public class PageMaker {

	private int start; // 시작번호
	private int page; // 페이지번호
	private int end; // 끝번호
	private int total; // 총 게시물 수
	private int Max;

	
	private boolean prev; // 이전
	private boolean next; // 다음

	public PageMaker(String pageStr, int total) {
		try {
			Max=10;
			// String --> int
			System.out.println(pageStr);
			this.page = (pageStr == null || pageStr =="")? 1: Integer.parseInt(pageStr);
			// -1 을 입력했을경우 == 잘못된값을 입력했을경우
			if (this.page < 1) {
				this.page = 1;
			}
			
			this.total = total;
			//1 11 -> 2
			//page 가 10이 넘어가면 
			int tempEnd = (int)(Math.ceil(page / 10.0)) * Max;  
			
			start = tempEnd - (Max-1);
			//start 로 이전 -- 다음
			prev = start >1; //1보다 클경우 이전이 있음
			
			//만약 데이터가 171개 
			// tempEnd 20 > 18
			if(tempEnd > Math.ceil(total/Max)) {
				//end페이지 다시 계산
				this.end = (int)(Math.ceil(total/Max));
			}else {
				this.end = tempEnd;
			}
			// to
			
			this.next = this.end * Max < this.total;
			
		
		} catch (Exception e) {

		}
	}
	public static void main(String[] args) {
	
		
		//PageMaker pm = new PageMaker("13", 201);
		BoardService service = BoardService.getInstance();
		System.out.println(service.getList());
		
		int total = service.getTotal();
		System.out.println(total);
		
		PageMaker pm = new PageMaker("11",total);   
		System.out.println(pm);
		
		
	}
}
