package org.zerock.note;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class NoteService {
	
	//싱글톤 패턴 = 객체를 1개만 만든다.
	private static NoteService instance = new NoteService();
	private List<Note> noteList;
	//복사본 
	public static NoteService getInstance() {
		return instance;																						
	}
	
	//외부에서 new를 불가능
	private NoteService() {
		this.noteList = new ArrayList<>();
		
		for (int i = 0; i < 10; i++) {
			noteList.add(new Note(""+i,"27","Hello"));
			
		}
	}
	
	public List<Note> receiveList(String userNum){
		//필터링
	
		return noteList.stream()
				.filter(n -> n.getTo().equals(userNum))
				.collect(Collectors.toList());
	}

	public void add(Note note) {
		
		noteList.add(note);
	}
	
	public List<Note> sendList(String userNum){
		return noteList.stream()
				.filter(n -> n.getFrom().equals(userNum))
				.collect(Collectors.toList());
	}
	
	
	
}
