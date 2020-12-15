package com.intecon.sample.tfeft202.model;

public class Tfeft202 {
	
	private int id;
	public String action;
	private String comp;
	private String itemCode;
	private String gtibCode;
	private String codeListName;
	private String objectName;
	private String crt_usr;
	private String crt_tst;
	private String upd_usr;
	private String upd_tst;
	private boolean isActive;
	
	
	public Tfeft202(int id, String comp, String itemCode, String gtibCode, String codeListName, String objectName, String crt_usr,
			String crt_tst, String upd_usr, String upd_tst, boolean isActive) {
		super();
		this.id=id;
		this.comp = comp;
		this.itemCode = itemCode;
		this.gtibCode = gtibCode;
		this.codeListName = codeListName;
		this.objectName = objectName;
		this.crt_usr = crt_usr;
		this.crt_tst = crt_tst;
		this.upd_usr = upd_usr;
		this.upd_tst = upd_tst;
		this.isActive = isActive;
	}
	
	public Tfeft202(String comp, String itemCode, String gtibCode, String codeListName, String objectName, String crt_usr, //This constructor is only for insert option
			String crt_tst, boolean isActive) { // No ID and Update operations
		super();
		this.comp = comp;
		this.itemCode = itemCode;
		this.gtibCode = gtibCode;
		this.codeListName = codeListName;
		this.objectName = objectName;
		this.crt_usr = crt_usr;
		this.crt_tst = crt_tst;
		this.isActive = isActive;
	}
	
	
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getGtibCode() {
		return gtibCode;
	}
	public void setGtibCode(String gtibCode) {
		this.gtibCode = gtibCode;
	}
	public String getCodeListName() {
		return codeListName;
	}
	public void setCodeListName(String codeListName) {
		this.codeListName = codeListName;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	public String getCrt_usr() {
		return crt_usr;
	}
	public void setCrt_usr(String crt_usr) {
		this.crt_usr = crt_usr;
	}
	public String getCrt_tst() {
		return crt_tst;
	}
	public void setCrt_tst(String crt_tst) {
		this.crt_tst = crt_tst;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getUpd_usr() {
		return upd_usr;
	}

	public void setUpd_usr(String upd_usr) {
		this.upd_usr = upd_usr;
	}

	public String getUpd_tst() {
		return upd_tst;
	}

	public void setUpd_tst(String upd_tst) {
		this.upd_tst = upd_tst;
	}

}
