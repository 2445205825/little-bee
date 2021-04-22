package com.jeethink.project.business.checkItems.domain;

import java.math.BigDecimal;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 检查项设置对象 busi_checkitems
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public class CheckItems extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 检查编码 */
    private Long checkCode;

    /** 所在位置 */
    @Excel(name = "所在位置")
    private String address;

    /** 检查点名称 */
    @Excel(name = "检查点名称")
    private String checkName;

    /** 实时性 */
    @Excel(name = "实时性")
    private String realtimeType;

    /** 检查类型 */
    @Excel(name = "检查类型")
    private String checkType;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 条件判断 */
    @Excel(name = "条件判断")
    private String computLimit;

    /** 阈值（10,4） */
    @Excel(name = "阈值", readConverterExp = "1=0,4")
    private BigDecimal maxValue;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 开始日期 */
    @Excel(name = "开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 结束日期 */
    @Excel(name = "结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    public void setCheckCode(Long checkCode)
    {
        this.checkCode = checkCode;
    }

    public Long getCheckCode()
    {
        return checkCode;
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
    public void setRealtimeType(String realtimeType)
    {
        this.realtimeType = realtimeType;
    }

    public String getRealtimeType()
    {
        return realtimeType;
    }
    public void setCheckType(String checkType)
    {
        this.checkType = checkType;
    }

    public String getCheckType()
    {
        return checkType;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
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
    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
    }
    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }

    public Date getStartDate()
    {
        return startDate;
    }
    public void setEndDate(Date endDate)
    {
        this.endDate = endDate;
    }

    public Date getEndDate()
    {
        return endDate;
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
            .append("checkCode", getCheckCode())
            .append("address", getAddress())
            .append("checkName", getCheckName())
            .append("realtimeType", getRealtimeType())
            .append("checkType", getCheckType())
            .append("status", getStatus())
            .append("computLimit", getComputLimit())
            .append("maxValue", getMaxValue())
            .append("orderNum", getOrderNum())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("comment", getComment())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
