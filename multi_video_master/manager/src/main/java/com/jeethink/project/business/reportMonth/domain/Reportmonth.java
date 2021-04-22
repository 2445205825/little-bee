package com.jeethink.project.business.reportMonth.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 维修月报对象 busi_reportmonth
 * 
 * @author hanbin
 * @date 2021-01-31
 */
public class Reportmonth extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修数量 */
    @Excel(name = "维修数量")
    private Long checkCount;

    /** 报表编码 */
    private Long reportId;

    /** 检查点名称 */
    @Excel(name = "检查点名称")
    private String checkName;

    /** 配件名称 */
    @Excel(name = "配件名称")
    private String partName;

    /** 维修数量 */
    @Excel(name = "维修数量")
    private Long partCount;

    /** 配件型号 */
    @Excel(name = "配件型号")
    private String partItem;

    /** 单位 */
    @Excel(name = "单位")
    private String unitName;

    /** 配件数量 */
    @Excel(name = "配件数量")
    private Long itemCount;

    /** 创建日期 */
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 备注 */
    @Excel(name = "备注")
    private String comment;

    public void setCheckCount(Long checkCount)
    {
        this.checkCount = checkCount;
    }

    public Long getCheckCount()
    {
        return checkCount;
    }
    public void setReportId(Long reportId)
    {
        this.reportId = reportId;
    }

    public Long getReportId()
    {
        return reportId;
    }
    public void setCheckName(String checkName)
    {
        this.checkName = checkName;
    }

    public String getCheckName()
    {
        return checkName;
    }
    public void setPartName(String partName)
    {
        this.partName = partName;
    }

    public String getPartName()
    {
        return partName;
    }
    public void setPartCount(Long partCount)
    {
        this.partCount = partCount;
    }

    public Long getPartCount()
    {
        return partCount;
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
    public void setItemCount(Long itemCount)
    {
        this.itemCount = itemCount;
    }

    public Long getItemCount()
    {
        return itemCount;
    }
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public Date getCreateDate()
    {
        return createDate;
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
            .append("checkCount", getCheckCount())
            .append("reportId", getReportId())
            .append("checkName", getCheckName())
            .append("partName", getPartName())
            .append("partCount", getPartCount())
            .append("partItem", getPartItem())
            .append("unitName", getUnitName())
            .append("itemCount", getItemCount())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("comment", getComment())
            .toString();
    }
}
