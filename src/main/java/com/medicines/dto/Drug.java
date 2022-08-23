package com.medicines.dto;

public class Drug {
	private String entpName;
	private String itemName;
	private String itemSeq;
	private String efcyQesitm;
	private String useMethodQesitm;
	private String atpnWarnQesitm;
	private String atpnQesitm;
	private String intrcQesitm;
	private String seQesitm;
	private String depositMethodQesitm;
	private String itemImage;
	
	public Drug() {
		// TODO Auto-generated constructor stub
	}

	public Drug(String entpName, String itemName, String itemSeq, String efcyQesitm, String useMethodQesitm,
			String atpnWarnQesitm, String atpnQesitm, String intrcQesitm, String seQesitm, String depositMethodQesitm,
			String itemImage) {
		super();
		this.entpName = entpName;
		this.itemName = itemName;
		this.itemSeq = itemSeq;
		this.efcyQesitm = efcyQesitm;
		this.useMethodQesitm = useMethodQesitm;
		this.atpnWarnQesitm = atpnWarnQesitm;
		this.atpnQesitm = atpnQesitm;
		this.intrcQesitm = intrcQesitm;
		this.seQesitm = seQesitm;
		this.depositMethodQesitm = depositMethodQesitm;
		this.itemImage = itemImage;
	}

	public String getEntpName() {
		return entpName;
	}

	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getEfcyQesitm() {
		return efcyQesitm;
	}

	public void setEfcyQesitm(String efcyQesitm) {
		this.efcyQesitm = efcyQesitm;
	}

	public String getUseMethodQesitm() {
		return useMethodQesitm;
	}

	public void setUseMethodQesitm(String useMethodQesitm) {
		this.useMethodQesitm = useMethodQesitm;
	}

	public String getAtpnWarnQesitm() {
		return atpnWarnQesitm;
	}

	public void setAtpnWarnQesitm(String atpnWarnQesitm) {
		this.atpnWarnQesitm = atpnWarnQesitm;
	}

	public String getAtpnQesitm() {
		return atpnQesitm;
	}

	public void setAtpnQesitm(String atpnQesitm) {
		this.atpnQesitm = atpnQesitm;
	}

	public String getIntrcQesitm() {
		return intrcQesitm;
	}

	public void setIntrcQesitm(String intrcQesitm) {
		this.intrcQesitm = intrcQesitm;
	}

	public String getSeQesitm() {
		return seQesitm;
	}

	public void setSeQesitm(String seQesitm) {
		this.seQesitm = seQesitm;
	}

	public String getDepositMethodQesitm() {
		return depositMethodQesitm;
	}

	public void setDepositMethodQesitm(String depositMethodQesitm) {
		this.depositMethodQesitm = depositMethodQesitm;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
}
