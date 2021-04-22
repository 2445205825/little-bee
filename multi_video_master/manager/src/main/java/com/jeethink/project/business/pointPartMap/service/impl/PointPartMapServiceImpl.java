package com.jeethink.project.business.pointPartMap.service.impl;

import java.util.List;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.pointPartMap.mapper.PointPartMapMapper;
import com.jeethink.project.business.pointPartMap.domain.PointPartMap;
import com.jeethink.project.business.pointPartMap.service.IPointPartMapService;
import com.jeethink.common.utils.text.Convert;

/**
 * 检查点备件对应Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-30
 */
@Service
public class PointPartMapServiceImpl implements IPointPartMapService 
{
    @Autowired
    private PointPartMapMapper pointPartMapMapper;

    /**
     * 查询检查点备件对应
     * 
     * @param mapId 检查点备件对应ID
     * @return 检查点备件对应
     */
    @Override
    public PointPartMap selectPointPartMapById(Long mapId)
    {
        return pointPartMapMapper.selectPointPartMapById(mapId);
    }

    /**
     * 查询检查点备件对应列表
     * 
     * @param pointPartMap 检查点备件对应
     * @return 检查点备件对应
     */
    @Override
    public List<PointPartMap> selectPointPartMapList(PointPartMap pointPartMap)
    {
        return pointPartMapMapper.selectPointPartMapList(pointPartMap);
    }

    /**
     * 新增检查点备件对应
     * 
     * @param pointPartMap 检查点备件对应
     * @return 结果
     */
    @Override
    public int insertPointPartMap(PointPartMap pointPartMap)
    {
        pointPartMap.setCreateTime(DateUtils.getNowDate());
        return pointPartMapMapper.insertPointPartMap(pointPartMap);
    }

    /**
     * 修改检查点备件对应
     * 
     * @param pointPartMap 检查点备件对应
     * @return 结果
     */
    @Override
    public int updatePointPartMap(PointPartMap pointPartMap)
    {
        return pointPartMapMapper.updatePointPartMap(pointPartMap);
    }

    /**
     * 删除检查点备件对应对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePointPartMapByIds(String ids)
    {
        return pointPartMapMapper.deletePointPartMapByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除检查点备件对应信息
     * 
     * @param mapId 检查点备件对应ID
     * @return 结果
     */
    @Override
    public int deletePointPartMapById(Long mapId)
    {
        return pointPartMapMapper.deletePointPartMapById(mapId);
    }
}
