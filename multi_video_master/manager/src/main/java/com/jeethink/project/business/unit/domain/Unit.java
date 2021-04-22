package com.jeethink.project.business.unit.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 计量单位对象 busi_unit
 * 
 * @author hanbin
 * @date 2021-01-27
 */
public class Unit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 计量编码 */
    private Long unitId;

    /** 计量名称 */
    @Excel(name = "计量名称")
    private String unitName;

    /** 国际名称 */
    @Excel(name = "国际名称")
    private String foreignName;

    /** 计量符号 */
    @Excel(name = "计量符号")
    private String unitMark;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 使用状态 */
    @Excel(name = "使用状态")
    private String status;

    /** 删除标志 */
    private String delFlag;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    public void setUnitId(Long unitId)
    {
        this.unitId = unitId;
    }

    public Long getUnitId()
    {
        return unitId;
    }
    public void setUnitName(String unitName)
    {
        this.unitName = unitName;
    }

    public String getUnitName()
    {
        return unitName;
    }
    public void setForeignName(String foreignName)
    {
        this.foreignName = foreignName;
    }

    public String getForeignName()
    {
        return foreignName;
    }
    public void setUnitMark(String unitMark)
    {
        this.unitMark = unitMark;
    }

    public String getUnitMark()
    {
        return unitMark;
    }
    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
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
            .append("unitId", getUnitId())
            .append("unitName", getUnitName())
            .append("foreignName", getForeignName())
            .append("unitMark", getUnitMark())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("comment", getComment())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
