package registeration.model;
import java.io.Serializable;

public class logincheck implements Serializable {
	    /**
	     * 
	     */
//	    private static final long serialVersionUID = 1L;
	    private String email;
	    private String password;
	    private String usertype;
	    private boolean ftime;
		
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
		public boolean isFtime() {
			return ftime;
		}
		public void setFtime(boolean ftime) {
			this.ftime = ftime;
		}

	    
	}

