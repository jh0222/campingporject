package com.fi.pj.campingplace;

public class placeSearch {
	private String searchplace;
	private String search;
	private int from;
	private int to;
	private int from_p;
	private int to_p;
	
	public placeSearch() {
		// TODO Auto-generated constructor stub
	}

	public placeSearch(String searchplace, String search, int from, int to, int from_p, int to_p) {
		super();
		this.searchplace = searchplace;
		this.search = search;
		this.from = from;
		this.to = to;
		this.from_p = from_p;
		this.to_p = to_p;
	}

	public String getSearchplace() {
		return searchplace;
	}

	public void setSearchplace(String searchplace) {
		this.searchplace = searchplace;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getTo() {
		return to;
	}

	public void setTo(int to) {
		this.to = to;
	}

	public int getFrom_p() {
		return from_p;
	}

	public void setFrom_p(int from_p) {
		this.from_p = from_p;
	}

	public int getTo_p() {
		return to_p;
	}

	public void setTo_p(int to_p) {
		this.to_p = to_p;
	}
	
	
}
