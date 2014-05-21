package il.ac.hit;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="members")
public class Members {

	@Id
	@Column(name="id")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="last_name")
	private String last_name;
	@Column(name="email")
	private String email;
	@Column(name="uname")
	private String uname;
	@Column(name="pass")
	private String pass;
	@Column(name="regdate")
	private Date regdate;
	@Column(name="Admin")
	private boolean admin;
	
	
	
	/**
	 * 
	 * @param id	-	Primary Key.	
	 * @param name
	 * @param last_name
	 * @param email
	 * @param uname
	 * @param pass
	 * @param regdate
	 * @param admin	-	True/False to know who is Admin
	 */
	public Members(int id, String name, String last_name, String email,
			String uname, String pass, Date regdate, boolean admin) {
		super();
		this.id = id;
		this.name = name;
		this.last_name = last_name;
		this.email = email;
		this.uname = uname;
		this.pass = pass;
		this.regdate = regdate;
		this.admin = admin;
	}
	public Members() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public boolean getAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
	
	
}
