import java.util.List;

import dao.UserDao2;
import model.User;

public class DAOTest8 {
	public static void main(String[] args) {

		//8. Dao클래스를 작성하고 UserDao가 상속받도록
		UserDao2 udao = new UserDao2(); 
		
		List<User> list = udao.selectAllUsers();
		
		System.out.println(list);
		
	}
}
