package online.incc.vo;

import java.io.Serializable;

public class NotesVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 498806942459885185L;

	/**
	 * 
	 */

	private String title;

	private String link;

	private String date;

	private String content;
	
	private String preLink;
	private String nextLink;

	private String preTitle;
	private String nextTitle;
	
	public String getPreTitle() {
		return preTitle;
	}

	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNextLink() {
		return nextLink;
	}

	public void setNextLink(String nextLink) {
		this.nextLink = nextLink;
	}

	public String getPreLink() {
		return preLink;
	}

	public void setPreLink(String preLink) {
		this.preLink = preLink;
	}
}
