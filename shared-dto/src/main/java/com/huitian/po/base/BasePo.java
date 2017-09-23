package com.huitian.po.base;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.huitian.util.DateUtil;


/**
 * 凡是继承这个类的实体类，都自动包含ID、CREATE_BY、CREATE_DATE、MODIFY_DATE几个实体字段，以及相应的属性
 * @author ZlyjB
 *
 * @param <ID>
 */
@JsonAutoDetect()
@EntityListeners(PoListener.class)
@MappedSuperclass
public class BasePo<ID extends Serializable> implements Serializable {

    private static final long serialVersionUID = 1L;//序列号

    public static final String ID_PROPERTY_NAME = "id";//ID

    public static final String CREATE_DATE_PROPERTY_NAME = "createDate";//创建时间

    public static final String MODIFY_DATE_PROPERTY_NAME = "modifyDate";

    public static final String DEF_STRING = "";
    public static final Integer DEF_INTEGER = 0;
    public static final float DEF_FLOAT = 0F;
    public static final BigDecimal DEF_DECIMAL = BigDecimal.ZERO;
    public static final Date DEF_DATE = DateUtil.date1900();
    
    // PK ID
    @Id
    @JsonProperty
    @GenericGenerator(name = "systemUUID", strategy = "uuid")
    @GeneratedValue(generator = "systemUUID")
    @Column(name = "ID", nullable = false, length = 32)
    private ID id;

    @JsonProperty
    @Column(name = "CREATE_DATE", columnDefinition = "DATETIME DEFAULT 19000101", nullable = false, updatable = false)
    private Date createDate;

    @Column(name = "CREATE_BY", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''", updatable = false)
    private String createBy;

    @JsonProperty
    @Column(name = "MODIFY_DATE", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifyDate;

    @Column(name = "MODIFY_BY", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
    private String modifyBy;
    
    public BasePo() {
        this.createBy = DEF_STRING;
        this.modifyBy = DEF_STRING;
    }

    //以下是几个属性的get、set方法
    
    public ID getId() {
        return id;
    }

    public void setId(ID id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(String modifyBy) {
        this.modifyBy = modifyBy;
    }

    /**
     * 判断两个对象是否相等
     * 
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!BasePo.class.isAssignableFrom(obj.getClass())) {
            return false;
        }

        @SuppressWarnings("unchecked")
        BasePo<ID> other = (BasePo<ID>) obj;
        return getId() != null ? getId().equals(other.getId()) : false;
    }

    /**
     * 哈希值
     */
    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode += null == getId() ? 0 : getId().hashCode() * 31;
        return hashCode;
    }
}