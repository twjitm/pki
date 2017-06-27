package com.twj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Cabook entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "cabook", catalog = "pki")
public class Cabook implements java.io.Serializable {

	// Fields

	private Integer caId;
	private String caCn;
	private String caOu;
	private String caO;
	private String caL;
	private String caSt;
	private String caC;
	private String caStorepass;
	private String caKeypass;
	private String caUrl;
	private Integer UId;
	private String caStart;

	// Constructors

	/** default constructor */
	public Cabook() {
	}

	/** minimal constructor */
	public Cabook(String caUrl) {
		this.caUrl = caUrl;
	}

	/** full constructor */
	public Cabook(String caCn, String caOu, String caO, String caL,
			String caSt, String caC, String caStorepass, String caKeypass,
			String caUrl, Integer UId, String caStart) {
		this.caCn = caCn;
		this.caOu = caOu;
		this.caO = caO;
		this.caL = caL;
		this.caSt = caSt;
		this.caC = caC;
		this.caStorepass = caStorepass;
		this.caKeypass = caKeypass;
		this.caUrl = caUrl;
		this.UId = UId;
		this.caStart = caStart;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ca_id", unique = true, nullable = false)
	public Integer getCaId() {
		return this.caId;
	}

	public void setCaId(Integer caId) {
		this.caId = caId;
	}

	@Column(name = "ca_CN")
	public String getCaCn() {
		return this.caCn;
	}

	public void setCaCn(String caCn) {
		this.caCn = caCn;
	}

	@Column(name = "ca_OU")
	public String getCaOu() {
		return this.caOu;
	}

	public void setCaOu(String caOu) {
		this.caOu = caOu;
	}

	@Column(name = "ca_O")
	public String getCaO() {
		return this.caO;
	}

	public void setCaO(String caO) {
		this.caO = caO;
	}

	@Column(name = "ca_L")
	public String getCaL() {
		return this.caL;
	}

	public void setCaL(String caL) {
		this.caL = caL;
	}

	@Column(name = "ca_ST")
	public String getCaSt() {
		return this.caSt;
	}

	public void setCaSt(String caSt) {
		this.caSt = caSt;
	}

	@Column(name = "ca_C")
	public String getCaC() {
		return this.caC;
	}

	public void setCaC(String caC) {
		this.caC = caC;
	}

	@Column(name = "ca_storepass")
	public String getCaStorepass() {
		return this.caStorepass;
	}

	public void setCaStorepass(String caStorepass) {
		this.caStorepass = caStorepass;
	}

	@Column(name = "ca_keypass")
	public String getCaKeypass() {
		return this.caKeypass;
	}

	public void setCaKeypass(String caKeypass) {
		this.caKeypass = caKeypass;
	}

	@Column(name = "ca_URL", nullable = false)
	public String getCaUrl() {
		return this.caUrl;
	}

	public void setCaUrl(String caUrl) {
		this.caUrl = caUrl;
	}

	@Column(name = "u_id")
	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	@Column(name = "ca_start")
	public String getCaStart() {
		return this.caStart;
	}

	public void setCaStart(String caStart) {
		this.caStart = caStart;
	}

}