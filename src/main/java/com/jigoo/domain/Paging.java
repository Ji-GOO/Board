package com.jigoo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Paging {

	private int pageNumber;
	
	private int amount;
	
	public Paging() {
		
		this(1, 10);
	}
	
	public Paging(int pageNumber, int amount) {
		
		this.pageNumber = pageNumber;
		this.amount = amount;
	}
}
