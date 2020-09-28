import java.util.List;

import dao.UserDao;
import model.User;

public class DAOTest7 {
	public static void main(String[] args) {
		//8. Dao클래스를 작성하고 UserDao가 상속받도록
		UserDao udao = UserDao.getInstance();
		
		List<User> list = udao.selectAllUsers();
		
		System.out.println(list);
		
	}
}
