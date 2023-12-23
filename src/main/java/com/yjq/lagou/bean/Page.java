package com.yjq.lagou.bean;

import org.springframework.stereotype.Component;

/**
 * 分页基本信息
 * @author llq
 *
 */
@Component
public class Page {
	private int page = 1;//当前页码
	
	private int rows;//每页显示数量
	
	private int totalPage;  //总页数
	
	private int offset;//对应数据库中的偏移量
	
	private int totalCount;  //总记录数

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getOffset() {
		this.offset = (page - 1) * rows;
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	public int getTotalPage() {
		return (totalCount-1)/rows+1;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
