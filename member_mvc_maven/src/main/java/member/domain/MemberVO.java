package member.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class MemberVO {
	private String userid;
	private String password;
	private String confirmPassword;
	private String name;
	private String gender;
	private String email;

	
	
	public boolean passwordEqualsConfirmPassword() {
		
		return password.equals(confirmPassword);
		
	}
}
