package com.jeethink.project.business.checkPoints.service.impl;

import java.util.List;
import java.util.ArrayList;
import com.jeethink.framework.web.domain.Ztree;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.checkPoints.mapper.CheckPointsMapper;
import com.jeethink.project.business.checkPoints.domain.CheckPoints;
import com.jeethink.project.business.checkPoints.service.ICheckPointsService;
import com.jeethink.common.utils.text.Convert;

/**
 * 检查点信息Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Service
public class CheckPointsServiceImpl implements ICheckPointsService 
{
    @Autowired
    private CheckPointsMapper checkPointsMapper;

    /**
     * 查询检查点信息
     * 
     * @param checkId 检查点信息ID
     * @return 检查点信息
     */
    @Override
    public CheckPoints selectCheckPointsById(Long checkId)
    {
        return checkPointsMapper.selectCheckPointsById(checkId);
    }

    /**
     * 补充
     */
    @Override
    public ArrayList<String> selectCheckPointsNameResult(){
        return checkPointsMapper.selectCheckPointsNameResult();
    }

    /**
     * 查询检查点信息列表
     * 
     * @param checkPoints 检查点信息
     * @return 检查点信息
     */
    @Override
    public List<CheckPoints> selectCheckPointsList(CheckPoints checkPoints)
    {
        return checkPointsMapper.selectCheckPointsList(checkPoints);
    }

    /**
     * 新增检查点信息
     * 
     * @param checkPoints 检查点信息
     * @return 结果
     */
    @Override
    public int insertCheckPoints(CheckPoints checkPoints)
    {
        checkPoints.setCreateTime(DateUtils.getNowDate());
        return checkPointsMapper.insertCheckPoints(checkPoints);
    }

    /**
     * 修改检查点信息
     * 
     * @param checkPoints 检查点信息
     * @return 结果
     */
    @Override
    public int updateCheckPoints(CheckPoints checkPoints)
    {
        return checkPointsMapper.updateCheckPoints(checkPoints);
    }

    /**
     * 删除检查点信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCheckPointsByIds(String ids)
    {
        return checkPointsMapper.deleteCheckPointsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除检查点信息信息
     * 
     * @param checkId 检查点信息ID
     * @return 结果
     */
    @Override
    public int deleteCheckPointsById(Long checkId)
    {
        return checkPointsMapper.deleteCheckPointsById(checkId);
    }

    /**
     * 查询检查点信息树列表
     * 
     * @return 所有检查点信息信息
     */
    @Override
    public List<Ztree> selectCheckPointsTree()
    {
        List<CheckPoints> checkPointsList = checkPointsMapper.selectCheckPointsList(new CheckPoints());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (CheckPoints checkPoints : checkPointsList)
        {
            Ztree ztree = new Ztree();
            ztree.setId(checkPoints.getCheckId());
            ztree.setpId(checkPoints.getParentId());
            ztree.setName(checkPoints.getCheckName());
            ztree.setTitle(checkPoints.getCheckName());
            ztrees.add(ztree);
        }
        return ztrees;
    }
}
