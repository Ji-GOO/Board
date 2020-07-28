package com.jigoo.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {

	private int pageNumber;
	
	private int amount;
	
	public int getPageStart() {
		
		return (this.pageNumber - 1) * amount;
	}
	
	public Paging() {
		
		this.pageNumber = 1;
		this.amount = 10;
	}
	
	public void setPageNumber(int pageNumber) {
		
		if(pageNumber <= 0) {
			
			this.pageNumber = 1;
		} else {
			
			this.pageNumber = pageNumber;
		}
	}
	
	public void setAmount(int pageCount) {
		
		int count = this.amount;
		
		if(pageCount != count) {
			
			this.amount = count;
		} else {
			
			this.amount = pageCount;
		}
	}
}
