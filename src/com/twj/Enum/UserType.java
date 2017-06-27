package com.twj.Enum;

public enum UserType {
	/**
	 * 没审核
	 */
	PTUSER(1,"普通用户"),
	/**
	 * 签发
	 */
	ADMIN(2,"管理员");
	
	private int statCode;
	private String discribe;
	/**
	 * 构�?方法
	 * @param stateCode
	 * @param discribe
	 */
	private UserType(int stateCode,String discribe){
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
	public static UserType valueOf(int stateCode){
		switch(stateCode){
		case 1:
			return UserType.PTUSER;
		case 2:
			return UserType.ADMIN;
		
		default:
			return null;
		}
	}
	

}
