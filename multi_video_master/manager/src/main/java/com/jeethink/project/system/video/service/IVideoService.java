package com.jeethink.project.system.video.service;

import java.util.List;
import com.jeethink.project.system.video.domain.Video;

/**
 * 视频管理Service接口
 * 
 * @author lcy
 * @date 2021-04-20
 */
public interface IVideoService 
{
    /**
     * 查询视频管理
     * 
     * @param videoId 视频管理ID
     * @return 视频管理
     */
    public Video selectVideoById(Long videoId);

    /**
     * 查询视频管理列表
     * 
     * @param video 视频管理
     * @return 视频管理集合
     */
    public List<Video> selectVideoList(Video video);

    /**
     * 新增视频管理
     * 
     * @param video 视频管理
     * @return 结果
     */
    public int insertVideo(Video video);

    /**
     * 修改视频管理
     * 
     * @param video 视频管理
     * @return 结果
     */
    public int updateVideo(Video video);

    /**
     * 批量删除视频管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteVideoByIds(String ids);

    /**
     * 删除视频管理信息
     * 
     * @param videoId 视频管理ID
     * @return 结果
     */
    public int deleteVideoById(Long videoId);
}
