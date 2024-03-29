package shop.Service;

import shop.DAO.UserDAO;
import shop.DTO.Users;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAO();
	
	@Override
	public int join(Users user) {
		int result = userDAO.join(user);
		
		if( result > 0 ) {
			System.out.println("회원 가입 처리 성공!");
		} else {
			System.out.println("회원 가입 실패!");
		}
		// 기본 회원 권한을 추가...
		
		return result;
	}

}


