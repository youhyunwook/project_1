package common;

import java.sql.Date;

public class Announcement {
	private int Ann_id;
	private String Ann_author_id;
	private String Ann_title;
	private String Ann_body;
	
	public int getAnn_id() {
		return Ann_id;
	}
	public void setAnn_id(int ann_id) {
		Ann_id = ann_id;
	}

	public String getAnn_author_id() {
		return Ann_author_id;
	}
	public void setAnn_author_id(String ann_author_id) {
		Ann_author_id = ann_author_id;
	}
	public String getAnn_title() {
		return Ann_title;
	}
	public void setAnn_title(String ann_title) {
		Ann_title = ann_title;
	}
	public String getAnn_body() {
		return Ann_body;
	}
	public void setAnn_body(String ann_body) {
		Ann_body = ann_body;
	}		
}
