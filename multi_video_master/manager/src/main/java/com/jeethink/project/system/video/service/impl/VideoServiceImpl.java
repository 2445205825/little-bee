package com.jeethink.project.system.video.service.impl;

import java.util.List;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.system.video.mapper.VideoMapper;
import com.jeethink.project.system.video.domain.Video;
import com.jeethink.project.system.video.service.IVideoService;
import com.jeethink.common.utils.text.Convert;

/**
 * 视频管理Service业务层处理
 * 
 * @author lcy
 * @date 2021-04-20
 */
@Service
public class VideoServiceImpl implements IVideoService 
{
    @Autowired
    private VideoMapper videoMapper;

    /**
     * 查询视频管理
     * 
     * @param videoId 视频管理ID
     * @return 视频管理
     */
    @Override
    public Video selectVideoById(Long videoId)
    {
        return videoMapper.selectVideoById(videoId);
    }

    /**
     * 查询视频管理列表
     * 
     * @param video 视频管理
     * @return 视频管理
     */
    @Override
    public List<Video> selectVideoList(Video video)
    {
        return videoMapper.selectVideoList(video);
    }

    /**
     * 新增视频管理
     * 
     * @param video 视频管理
     * @return 结果
     */
    @Override
    public int insertVideo(Video video)
    {
        video.setCreateTime(DateUtils.getNowDate());
        return videoMapper.insertVideo(video);
    }

    /**
     * 修改视频管理
     * 
     * @param video 视频管理
     * @return 结果
     */
    @Override
    public int updateVideo(Video video)
    {
        video.setUpdateTime(DateUtils.getNowDate());
        return videoMapper.updateVideo(video);
    }

    /**
     * 删除视频管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteVideoByIds(String ids)
    {
        return videoMapper.deleteVideoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除视频管理信息
     * 
     * @param videoId 视频管理ID
     * @return 结果
     */
    @Override
    public int deleteVideoById(Long videoId)
    {
        return videoMapper.deleteVideoById(videoId);
    }
}
