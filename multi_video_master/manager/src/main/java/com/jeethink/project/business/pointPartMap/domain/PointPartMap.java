package com.jeethink.project.business.pointPartMap.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 检查点备件对应对象 busi_pointpartmap
 * 
 * @author hanbin
 * @date 2021-01-30
 */
public class PointPartMap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 映射编码 */
    private Long mapId;

    /** 检查项编码 */
    private Long checkId;

    /** 设备编码 */
    private Long partId;

    /** 位置名称 */
    @Excel(name = "位置名称")
    private String address;

    /** 检查点名称 */
    @Excel(name = "检查点名称")
    private String checkName;

    /** 备件名称 */
    @Excel(name = "备件名称")
    private String partName;

    /** 备件型号 */
    @Excel(name = "备件型号")
    private String partItem;

    /** 单位名称 */
    @Excel(name = "单位名称")
    private String unitName;

    /** 默认标志 */
    @Excel(name = "默认标志")
    private String defaultFlag;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String comment;

    public void setMapId(Long mapId)
    {
        this.mapId = mapId;
    }

    public Long getMapId()
    {
        return mapId;
    }
    public void setCheckId(Long checkId)
    {
        this.checkId = checkId;
    }

    public Long getCheckId()
    {
        return checkId;
    }
    public void setPartId(Long partId)
    {
        this.partId = partId;
    }

    public Long getPartId()
    {
        return partId;
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
    public void setDefaultFlag(String defaultFlag)
    {
        this.defaultFlag = defaultFlag;
    }

    public String getDefaultFlag()
    {
        return defaultFlag;
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
            .append("mapId", getMapId())
            .append("checkId", getCheckId())
            .append("partId", getPartId())
            .append("address", getAddress())
            .append("checkName", getCheckName())
            .append("partName", getPartName())
            .append("partItem", getPartItem())
            .append("unitName", getUnitName())
            .append("defaultFlag", getDefaultFlag())
            .append("comment", getComment())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
