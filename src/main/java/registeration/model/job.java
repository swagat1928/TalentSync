package registeration.model;

public class job {
	private String title;
	private String description;
	private String deadline;
	private String skill;
	private double amount;
	private String email;
	
	public job(String email,String title, String description, String deadline, String skill, double amount) {
		super();
		this.email=email;
		this.title = title;
		this.description = description;
		this.deadline = deadline;
		this.skill = skill;
		this.amount = amount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
