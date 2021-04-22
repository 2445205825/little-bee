package com.jeethink.project.business.behavior.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 动物行为对象 sys_animal_behavior
 * 
 * @author dan
 * @date 2021-04-20
 */
public class SysAnimalBehavior extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 行为名称 */
    @Excel(name = "行为名称")
    private String behaviorName;

    /** 动物名称 */
    @Excel(name = "动物名称")
    private String animalName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setBehaviorName(String behaviorName)
    {
        this.behaviorName = behaviorName;
    }

    public String getBehaviorName()
    {
        return behaviorName;
    }
    public void setAnimalName(String animalName)
    {
        this.animalName = animalName;
    }

    public String getAnimalName()
    {
        return animalName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("behaviorName", getBehaviorName())
            .append("animalName", getAnimalName())
            .append("remark", getRemark())
            .toString();
    }
}
