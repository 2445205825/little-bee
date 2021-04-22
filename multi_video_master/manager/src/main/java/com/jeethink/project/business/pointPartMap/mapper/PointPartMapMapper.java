package com.jeethink.project.business.pointPartMap.mapper;

import java.util.List;
import com.jeethink.project.business.pointPartMap.domain.PointPartMap;

/**
 * 检查点备件对应Mapper接口
 * 
 * @author hanbin
 * @date 2021-01-30
 */
public interface PointPartMapMapper 
{
    /**
     * 查询检查点备件对应
     * 
     * @param mapId 检查点备件对应ID
     * @return 检查点备件对应
     */
    public PointPartMap selectPointPartMapById(Long mapId);

    /**
     * 查询检查点备件对应列表
     * 
     * @param pointPartMap 检查点备件对应
     * @return 检查点备件对应集合
     */
    public List<PointPartMap> selectPointPartMapList(PointPartMap pointPartMap);

    /**
     * 新增检查点备件对应
     * 
     * @param pointPartMap 检查点备件对应
     * @return 结果
     */
    public int insertPointPartMap(PointPartMap pointPartMap);

    /**
     * 修改检查点备件对应
     * 
     * @param pointPartMap 检查点备件对应
     * @return 结果
     */
    public int updatePointPartMap(PointPartMap pointPartMap);

    /**
     * 删除检查点备件对应
     * 
     * @param mapId 检查点备件对应ID
     * @return 结果
     */
    public int deletePointPartMapById(Long mapId);

    /**
     * 批量删除检查点备件对应
     * 
     * @param mapIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePointPartMapByIds(String[] mapIds);
}
