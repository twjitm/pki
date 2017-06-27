package com.twj.util;

import java.util.List;

/**
 * 
 * @author 李利聪
 * 
 *         实现分页效果和设置分页信息
 * 
 * 
 * @param <T>
 */
public class Page<T> {
	// 总页数
	private long total;
	// 总条数
	private long totalNum;

	private List<T> datas;

	private int currentPage = 1;

	private int pageSize = 10;

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Page() {
		super();
	}

	public Page(int currentPage, int pageSize, long totalNum) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalNum = totalNum;

	}

	public Page(long total, List<T> datas) {
		super();
		this.total = total;
		this.datas = datas;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}

	/**
	 * 获取分页html 必须设置：currentPage 默认为1,totalNum，pageSize默认为20，
	 * 
	 * 包含默认值的，取值恰好是默认值可以不设置 其余必须设置默认值
	 * 
	 * @param url
	 *            ：分页页面的url
	 * @return
	 */
	public String getPage(String url) {
		// total为总页数
		long total = totalNum % pageSize > 0 ? (totalNum / pageSize + 1)
				: (totalNum / pageSize);
		// 判断是否有参数,没有用"?"连接;有用"&"连接
		String splitChar = url.indexOf("?") < 0 ? "?" : "&";

		// strPage返回的字符串,url上显示的当前页面参数cp
		String strPage = "";

		// 当前页面大于1时,显示上一页
		if (currentPage > 1) {
			strPage += "<A class='pre'  href=" + url + splitChar + "cp=" + (currentPage - 1)
					+ ">" + "上一页" + "</A>";
		}
		// 总页面数小于等于9页全部显示:上一页 1 2 3 4 5 6 7 8 9 下一页
		if (total <= 9) {
			for (int i = 1; i <= total; i++) {
				// 非当前页加上超链接
				if (currentPage != i) {
					strPage += " " + "<A href=" + url + splitChar + "cp=" + i
							+ " class='no_active'> " + i + "</A>";
				} else {
					strPage += " " +"<a href='javascript:void(0);' class='active'>"
							+ i + "</a>";
				}
			}
		} else {
			// 多于9个页面,且当前页小于7时,格式:上一页 1 2 3 4 5 6 7 .... total 下一页
			if (currentPage < 7) {
				for (int i = 1; i <= 7; i++) {
					if (currentPage != i) {
						strPage += " " + "<A href=" + url + splitChar + "cp="
								+ i + " class='no_active'> " + i + "</A>";
					} else {
						strPage += " " +"<a href='javascript:void(0);' class='active'>"
								+ i + "</a>";
					}
				}
				strPage += " ...";
				strPage += " " + "<A href=" + url + splitChar + "cp=" + total
						+ " class='no_active'> " + total + "</A>";
			}
			// 多页9个页面,当前页为7到总数-3之间: 上一页 1...(n-2)(n-1)n(n+1)(n+2)...total
			else if (currentPage >= 7 && (currentPage <= total - 3)) {
//				strPage += "<a href='javascript:void(0);'>1</a>";
				strPage += "<A href=" + url + splitChar + "cp=" + 1 + " class='no_active'> " + 1
						+ "</A>";
				strPage += " ...";
				for (int i = -2; i < 3; i++) {
					if (i == 0) {
//						strPage += " " + currentPage + " ";
						strPage += " " +"<a href='javascript:void(0);' class='active'>"
								+ currentPage + "</a>";
					} else {

						strPage += " " + "<A href=" + url + splitChar + "cp="
								+ (currentPage + i) + " class='no_active'> " + (currentPage + i)
								+ "</A>";

					}
				}
				strPage += " ...";
				strPage += " " + "<A href=" + url + splitChar + "cp=" + total
						+ " class='no_active'> " + total + "</A>";
			}
			// 多页9个页面,当前页大于总数-3,格式:上一页 1 2 3 ...(n-2) (n-1) n (n+1) total
			else if (currentPage > total - 3) {
				for(int i=1; i<6; i++){
					strPage += "<A href=" + url + splitChar + "cp=" + i + " class='no_active'> " + i+ "</A>"+" ";
				}
				
				strPage += " ...";
				for (int i = -2; i < 1; i++) {
					if (i == 0) {
//						strPage += " " + currentPage;
						strPage += " " +"<a href='javascript:void(0);' class='active'>"
								+ currentPage + "</a>";
					} else {
						strPage += " " + "<A href=" + url + splitChar + "cp="
								+ (currentPage + i) + " class='no_active'> " + (currentPage + i)
								+ "</A>";
					}
				}

				for (int i = currentPage; i < total; i++) {
					strPage += " " + "<A href=" + url + splitChar + "cp="
							+ (i + 1) + " class='no_active'> " + (i + 1) + "</A>";
				}
			}
		}
		// 当前页小于总页数显示下一页
		if (currentPage < total) {
			strPage += "<A class='next' href=" + url + splitChar + "cp=" + (currentPage + 1)
					+ ">" + "下一页" + "</A>";
		}
		strPage += "  跳转到"
				+ "<input type=\"text\" class=\"pageToIpt inputNumberLimit\" value=\"\"><a class=\"go\" href=\"javascript:void(0);\""
				+ " onclick=\"javascript:var total="+total+";var pageNum=$('.pageToIpt').val(); "
				+ "if(!isNumber2(pageNum))return false;if(pageNum<=0)pageNum=1;if(pageNum>total)pageNum=total;"
				+ "location='"+ url + splitChar + "cp='+pageNum;\">GO</a>";

		strPage+="&nbsp;&nbsp;共"+totalNum+"条";
		return strPage;
	}

	// 通过传入要分页的总数和页容量得到总页数
	public long getTotleCount() {

		if (totalNum % pageSize == 0) {
			return totalNum / pageSize;
		} else {
			return (totalNum / pageSize) + 1;
		}
	}

}