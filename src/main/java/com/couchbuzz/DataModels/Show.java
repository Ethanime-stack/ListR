package com.couchbuzz.DataModels;

public class Show {
	// Show attributes 
	private String title; 
	private String season;
	private String coverUrl;
	private String about; 

	// constructor 
	public Show(String title, String season, String coverUrl, String about) { 
	this.title = title;
	this.season = season; 
	this.coverUrl = coverUrl; 
	this.about = about;
	}
	
	// setters getters
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title =  title;
	}
	public String getSeason() {
		return season; 
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getCoverUrl() {
		return coverUrl;
	}
	public void setCoverUrl(String coverUrl) {
	this.coverUrl = coverUrl;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	
	@Override
	public String toString() {
		return "Show [Title=" + title + "| Season= " + "| coverUrl=" + coverUrl + "| about= " + about + "]";
	}
}
