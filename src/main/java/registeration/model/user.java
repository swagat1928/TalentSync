package registeration.model;

public class user {
	private String username;
	private String email;
	private String password;
	private String usertype;
	
	public user(String username, String email, String password,String usertype) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.usertype=usertype;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	
}
