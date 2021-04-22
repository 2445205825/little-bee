package com.jeethink.project.business.reportDay.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 日报表对象 busi_reportday
 * 
 * @author hanbin
 * @date 2021-01-29
 */
public class ReportDay extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报表编码 */
    private Long reportId;

    /** 检查点名 */
    @Excel(name = "检查点名")
    private String checkName;

    /** 配件名称 */
    @Excel(name = "配件名称")
    private String partName;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String partItem;

    /** 单位名称 */
    @Excel(name = "单位名称")
    private String unitName;

    /** 数量 */
    @Excel(name = "数量")
    private Long partCount;

    /** 创建日期 */
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 分配者 */
    @Excel(name = "分配者")
    private String leader;

    /** 要求时限 */
    @Excel(name = "要求时限", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dealTime;

    /** 维修机组 */
    @Excel(name = "维修机组")
    private String repairDept;

    /** 完成时间 */
    @Excel(name = "完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date requireTime;

    /** 备注 */
    private String comment;

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
    public void setPartCount(Long partCount)
    {
        this.partCount = partCount;
    }

    public Long getPartCount()
    {
        return partCount;
    }
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public Date getCreateDate()
    {
        return createDate;
    }
    public void setLeader(String leader)
    {
        this.leader = leader;
    }

    public String getLeader()
    {
        return leader;
    }
    public void setDealTime(Date dealTime)
    {
        this.dealTime = dealTime;
    }

    public Date getDealTime()
    {
        return dealTime;
    }
    public void setRepairDept(String repairDept)
    {
        this.repairDept = repairDept;
    }

    public String getRepairDept()
    {
        return repairDept;
    }
    public void setRequireTime(Date requireTime)
    {
        this.requireTime = requireTime;
    }

    public Date getRequireTime()
    {
        return requireTime;
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
            .append("reportId", getReportId())
            .append("checkName", getCheckName())
            .append("partName", getPartName())
            .append("partItem", getPartItem())
            .append("unitName", getUnitName())
            .append("partCount", getPartCount())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("leader", getLeader())
            .append("dealTime", getDealTime())
            .append("repairDept", getRepairDept())
            .append("requireTime", getRequireTime())
            .append("comment", getComment())
            .toString();
    }
}
