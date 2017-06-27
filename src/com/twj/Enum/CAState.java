package com.twj.Enum;

public enum CAState {
	/**
	 * 没审核
	 */
	PASS(1,"通过"),
	/**
	 * 签发
	 */
	NOPASS(2,"未通过");
	
	private int statCode;
	private String discribe;
	/**
	 * 构�?方法
	 * @param stateCode
	 * @param discribe
	 */
	private CAState(int stateCode,String discribe){
		this.statCode = stateCode;
		this.discribe = discribe;
	}
	/**
	 * 得到状�?�?
	 * @return
	 */
	public int getStatCode() {
		return statCode;
	}
	/**
	 * 得到枚举值得描述
	 * @return
	 */
	public String getDiscribe() {
		return discribe;
	}
	/**
	 * 根据枚举值得到状态�?
	 * @param stateCode
	 * @return
	 */
	public static CAState valueOf(int stateCode){
		switch(stateCode){
		case 1:
			return CAState.PASS;
		case 2:
			return CAState.NOPASS;
		
		default:
			return null;
		}
	}
	

}
