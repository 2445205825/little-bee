package com.jeethink.project.system.video.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jeethink.framework.aspectj.lang.annotation.Excel;
import com.jeethink.framework.web.domain.BaseEntity;

/**
 * 视频管理对象 sys_video
 * 
 * @author lcy
 * @date 2021-04-20
 */
public class Video extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 视频ID */
    @Excel(name = "视频ID")
    private Long videoId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long deviceId;

    /** 视频名称 */
    @Excel(name = "视频名称")
    private String videoName;

    /** 视频路径 */
    @Excel(name = "视频路径")
    private String videoUrl;

    /** 动物 */
    @Excel(name = "动物")
    private String animalName;

    /** 动物行为 */
    @Excel(name = "动物行为")
    private String animalBehavior;

    public void setVideoId(Long videoId)
    {
        this.videoId = videoId;
    }

    public Long getVideoId()
    {
        return videoId;
    }
    public void setDeviceId(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId()
    {
        return deviceId;
    }
    public void setVideoName(String videoName)
    {
        this.videoName = videoName;
    }

    public String getVideoName()
    {
        return videoName;
    }
    public void setVideoUrl(String videoUrl)
    {
        this.videoUrl = videoUrl;
    }

    public String getVideoUrl()
    {
        return videoUrl;
    }
    public void setAnimalName(String animalName)
    {
        this.animalName = animalName;
    }

    public String getAnimalName()
    {
        return animalName;
    }
    public void setAnimalBehavior(String animalBehavior)
    {
        this.animalBehavior = animalBehavior;
    }

    public String getAnimalBehavior()
    {
        return animalBehavior;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("videoId", getVideoId())
            .append("deviceId", getDeviceId())
            .append("videoName", getVideoName())
            .append("videoUrl", getVideoUrl())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .append("animalName", getAnimalName())
            .append("animalBehavior", getAnimalBehavior())
            .toString();
    }
}
