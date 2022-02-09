package com.fi.pj.board;

public class Search {
	private String searchsort;
	private String search;
	private int from;
	private int to;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public String getSearchsort() {
		return searchsort;
	}

	public void setSearchsort(String searchsort) {
		this.searchsort = searchsort;
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

	public Search(String searchsort, String search, int from, int to) {
		super();
		this.searchsort = searchsort;
		this.search = search;
		this.from = from;
		this.to = to;
	}

}
