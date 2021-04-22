package com.jeethink.project.business.part.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 备件信息对象 busi_partinformation
 * 
 * @author hanbin
 * @date 2021-01-27
 */
public class Part extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配件编码 */
    private Long partId;

    /** 配件名称 */
    @Excel(name = "配件名称")
    private String partName;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String partItem;

    /** 单位名称 */
    @Excel(name = "单位名称")
    private String unitName;

    /** 使用状态 */
    @Excel(name = "使用状态")
    private String status;

    /** 删除标志 */
    private String delFlag;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    public void setPartId(Long partId)
    {
        this.partId = partId;
    }

    public Long getPartId()
    {
        return partId;
    }
    public void setPartName(String partName)
    {
        this.partName = partName;
    }

    public String getPartName()
    {
        return partName;
    }
    public void setPartItem(String partItem)
    {
        this.partItem = partItem;
    }

    public String getPartItem()
    {
        return partItem;
    }
    public void setUnitName(String unitName)
    {
        this.unitName = unitName;
    }

    public String getUnitName()
    {
        return unitName;
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
            .append("partId", getPartId())
            .append("partName", getPartName())
            .append("partItem", getPartItem())
            .append("unitName", getUnitName())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("comment", getComment())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
