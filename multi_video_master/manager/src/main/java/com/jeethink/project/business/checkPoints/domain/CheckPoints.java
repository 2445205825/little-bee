package com.jeethink.project.business.checkPoints.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.TreeEntity;

/**
 * 检查点信息对象 busi_checkpoints
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public class CheckPoints extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 检查点编码 */
    private Long checkId;

    /** 所在地址 */
    @Excel(name = "所在地址")
    private String address;

    /** 检查点名称 */
    @Excel(name = "检查点名称")
    private String checkName;

    /** 检查类型 */
    @Excel(name = "检查类型")
    private String checkType;

    /** 计算类型 */
    @Excel(name = "计算类型")
    private String computLimit;

    /** 阈值 */
    @Excel(name = "阈值")
    private BigDecimal maxValue;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    public void setCheckId(Long checkId)
    {
        this.checkId = checkId;
    }

    public Long getCheckId()
    {
        return checkId;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setCheckName(String checkName)
    {
        this.checkName = checkName;
    }

    public String getCheckName()
    {
        return checkName;
    }
    public void setCheckType(String checkType)
    {
        this.checkType = checkType;
    }

    public String getCheckType()
    {
        return checkType;
    }
    public void setComputLimit(String computLimit)
    {
        this.computLimit = computLimit;
    }

    public String getComputLimit()
    {
        return computLimit;
    }
    public void setMaxValue(BigDecimal maxValue)
    {
        this.maxValue = maxValue;
    }

    public BigDecimal getMaxValue()
    {
        return maxValue;
    }
    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public String getComment()
    {
        return comment;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("checkId", getCheckId())
            .append("parentId", getParentId())
            .append("address", getAddress())
            .append("ancestors", getAncestors())
            .append("checkName", getCheckName())
            .append("checkType", getCheckType())
            .append("computLimit", getComputLimit())
            .append("maxValue", getMaxValue())
            .append("orderNum", getOrderNum())
            .append("comment", getComment())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
