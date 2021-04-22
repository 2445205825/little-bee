package com.jeethink.project.business.address.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.TreeEntity;

/**
 * 设备位置的信息对象 busi_address
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public class Address extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 地址编码 */
    private Long addressId;

    /** 地址名称 */
    @Excel(name = "地址名称")
    private String addressName;

    /** 负责人 */
    @Excel(name = "负责人")
    private String leader;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private Long phone;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    /** 使用状态 */
    @Excel(name = "使用状态")
    private String status;

    /** 删除标志 */
    private String delFlag;

    public void setAddressId(Long addressId)
    {
        this.addressId = addressId;
    }

    public Long getAddressId()
    {
        return addressId;
    }
    public void setAddressName(String addressName)
    {
        this.addressName = addressName;
    }

    public String getAddressName()
    {
        return addressName;
    }
    public void setLeader(String leader)
    {
        this.leader = leader;
    }

    public String getLeader()
    {
        return leader;
    }
    public void setPhone(Long phone)
    {
        this.phone = phone;
    }

    public Long getPhone()
    {
        return phone;
    }
    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public String getComment()
    {
        return comment;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("addressId", getAddressId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("addressName", getAddressName())
            .append("orderNum", getOrderNum())
            .append("leader", getLeader())
            .append("phone", getPhone())
            .append("comment", getComment())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
