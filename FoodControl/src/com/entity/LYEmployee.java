package com.entity;

/**
 * @类功能说明：  员工信息实体类
 * @类修改者：  
 * @修改日期：  
 * @修改说明：   
 * @作者：TZT
 * @创建时间：2017-6-19 下午1:44:00  
 * @版本：V1.0
 */
public class LYEmployee {	
	
	private int emid;
	private String emname;
	private int emsex;
	private int emage;
	private String emphone;			
	private String emadress;
	private String emjointime;
	private int partId;
	public int getPartId() {
		return partId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	private String account;
	
	public String getAccount() {

		


		return account;
	}
	private int staffinfoState;
	public int getStaffinfoState() {
		staffinfoState=19;
		return staffinfoState;
	}
	public void setStaffinfoState(int staffinfoState) {
		this.staffinfoState = staffinfoState;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	
	
	public int getEmid() {
		return emid;
	}
	public void setEmid(int emid) {
		this.emid = emid;
	}
	public String getEmname() {
		return emname;
	}
	public void setEmname(String emname) {
		this.emname = emname;
	}
	public int getEmsex() {
		return emsex;
	}
	public void setEmsex(int emsex) {
		this.emsex = emsex;
	}
	public int getEmage() {
		return emage;
	}
	public void setEmage(int emage) {
		this.emage = emage;
	}
	public String getEmphone() {
		return emphone;
	}
	public void setEmphone(String emphone) {
		this.emphone = emphone;
	}
	public String getEmadress() {
		return emadress;
	}
	public void setEmadress(String emadress) {
		this.emadress = emadress;
	}
	public String getEmjointime() {
		return emjointime;
	}
	public void setEmjointime(String emjointime) {
		this.emjointime = emjointime;
	}
	
}
