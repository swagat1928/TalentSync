package registeration.model;

public class client {
	private String fname;
	private String lname;
	private String cname;
	private String description;
	private String cno;
	private String email;
	private String inputStream; 
	public client(String fname, String lname, String cname, String description, String cno, String email,String inputStream) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.cname = cname;
		this.description = description;
		this.cno = cno;
		this.email = email;
		this.inputStream=inputStream;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInputStream() {
		return inputStream;
	}
	public void setInputStream(String inputStream) {
		this.inputStream = inputStream;
	}
	
	
}
