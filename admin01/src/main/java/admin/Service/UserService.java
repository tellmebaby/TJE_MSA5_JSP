package admin.Service;

import admin.DTO.PersistentLogins;
import admin.DTO.Users;

public interface UserService {

	// 회원가입
	public int join(Users user);
	
	// 로그인
	public Users login(Users user);
	
	// 자동 로그인 - 토큰 갱신
	public String refreshToken(String userId);
	
	// 자동 로그인 - 토큰 삭제
	public int deleteToken(String userId);
	
	// 자동 로그인 - 토큰 조회
	public PersistentLogins selectTokenByToken(String token);
}
