package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.zerock.dto.MemberDTO;

/*
 * 
 	enum : 정해진 수의 인스턴스만 생성하는 용도

*/
public enum MemberService {
	
	INSTANCE;
	private List<MemberDTO> list;
	
	MemberService(){
		this.list = new ArrayList<>();
		//테스트용 초기화 (유저생성)
		for(int i=0; i<10; i++) {
			this.list.add(new MemberDTO("test"+i, "p" +i, "name"+i , "aaaa@bbbbb.com"));
		}
		
		
	}
	
	//회원가입
	//return 보다 강력한 throws exception
	public void insert(MemberDTO dto) throws Exception {
		//검사(EQ,HC) -- 중복체크
		//dto가 있니? --y == true
		
		
		//중복일경우
		if(this.list.contains(dto)) {
			throw new Exception("ID EXIST!!!");
		}
		this.list.add(dto);
		System.out.println("Debug : " +this.list);
	}
	
	public MemberDTO findById(String id) throws Exception{
		//테스트용 -- 가짜 회원
		MemberDTO member = new MemberDTO();
		member.setId(id);
		//인덱스번호 파악하기
		//이때 예외가 발생할수있음, - 회원이 없을경우 ==> throws exception
		int idx = this.list.indexOf(member);
		//예외일경우
		if(idx == -1) {
			throw new Exception("NOT EXIST");
		}
		
		return this.list.get(idx);
	}
	
	//로그인
	//사용자가 보낸 아이디, 비밀번호
	public MemberDTO findByMember(String id,String pw) throws Exception{
		//테스트용 -- 가짜 회원
		MemberDTO dto= findById(id);
		if(!(dto.getPw().equals(pw))) {
			throw new Exception("NOT EXIST");
		}
		return dto;	
	}
	
	
	//삭제
	public boolean delete(String id) {
		//테스트용 가짜 회원
		
		System.out.println();
		MemberDTO member = new MemberDTO();
		member.setId(id);
		
		
		return this.list.remove(member);
	}
	
	//회원목록 조회
	public List<MemberDTO> getList(){
		return this.list;
	}
	
	//수정 
	public void update(MemberDTO param) throws Exception{
		
		//찾을려면 또 index가 필요
		int idx = this.list.indexOf(param);
		
		if(idx == -1) {
			throw new Exception("NOT EXIST");
		}
		
		MemberDTO target = this.list.get(idx);
		target.setPw(param.getPw());
		target.setName(param.getName());
		target.setEmail(param.getEmail());
	}

//	//eq, hc를 사용하면
//	//for루프를 돌려서 확인할 일이없음 <<arraylist --> hash>>>
	
	}


