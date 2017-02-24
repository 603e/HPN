package zone.framework.model.base;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.StringUtils;
@MappedSuperclass
public class Base {

	private String id;
	private String operaterLoginname;
	private int deleteFlag;
	private Date createdatetime;
	private Date updatedatetime;
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		if (!StringUtils.isBlank(this.id)) {
			return this.id;
		}
		return UUID.randomUUID().toString();
	}	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdatetime", length = 7)
	public Date getCreatedatetime() {
		if (this.createdatetime != null)
			return this.createdatetime;
		return new Date();
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updatedatetime", length = 7)
	public Date getUpdatedatetime() {
		if (this.updatedatetime != null)
			return this.updatedatetime;
		return new Date();
	}
	@Column(name = "deleteFlag", length = 1)
	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setId(String id) {
		this.id = id;
	}

	public void setCreatedatetime(Date createdatetime) {
		this.createdatetime = createdatetime;
	}
	
	public void setUpdatedatetime(Date updatedatetime) {
		this.updatedatetime = updatedatetime;
	}

	@Column(name = "operaterLoginname", nullable = false, length = 20)
	public String getOperaterLoginname() {
		return operaterLoginname;
	}

	public void setOperaterLoginname(String operaterLoginname) {
		this.operaterLoginname = operaterLoginname;
	}

	
}
