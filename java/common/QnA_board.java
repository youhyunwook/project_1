package common;

public class QnA_board {
	private String title;
	private String body;
	private String customer_user_id;
	private String admin_id;
	private String answer;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustomer_user_id() {
		return customer_user_id;
	}
	public void setCustomer_user_id(String customer_user_id) {
		this.customer_user_id = customer_user_id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
