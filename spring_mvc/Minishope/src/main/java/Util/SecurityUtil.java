package Util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.thong.DTO.MyUser;

public class SecurityUtil {

	public static List<String> getAuthortities(){
		List<String> result = new ArrayList<String>();
		List<GrantedAuthority> listAuthor = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		for(GrantedAuthority g :listAuthor) {
			result.add(g.getAuthority());
		}
		return result;
	}	
//	public static MyUser securityUser() {
//		MyUser user =(MyUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		return user;
//	}
}
