import java.util.List;

import dao.UserDao;
import model.User;

public class DAOTest7 {
	public static void main(String[] args) {
		UserDao udao = UserDao.getInstance();
		
		List<User> list = udao.selectAllUsers();
		
		System.out.println(list);
		
	}
}
