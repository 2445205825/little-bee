package com.jeethink.project.business.checkPoints.service;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.business.checkPoints.domain.CheckPoints;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 检查点信息Service接口
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public interface ICheckPointsService 
{
    /**
     * 查询检查点信息
     * 
     * @param checkId 检查点信息ID
     * @return 检查点信息
     */
    public CheckPoints selectCheckPointsById(Long checkId);

    /**
     * 查询检查点信息列表
     * 
     * @param checkPoints 检查点信息
     * @return 检查点信息集合
     */
    public List<CheckPoints> selectCheckPointsList(CheckPoints checkPoints);

    /**
     * 补充
     */
    public ArrayList<String> selectCheckPointsNameResult();


    /**
     * 新增检查点信息
     * 
     * @param checkPoints 检查点信息
     * @return 结果
     */
    public int insertCheckPoints(CheckPoints checkPoints);

    /**
     * 修改检查点信息
     * 
     * @param checkPoints 检查点信息
     * @return 结果
     */
    public int updateCheckPoints(CheckPoints checkPoints);

    /**
     * 批量删除检查点信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCheckPointsByIds(String ids);

    /**
     * 删除检查点信息信息
     * 
     * @param checkId 检查点信息ID
     * @return 结果
     */
    public int deleteCheckPointsById(Long checkId);

    /**
     * 查询检查点信息树列表
     * 
     * @return 所有检查点信息信息
     */
    public List<Ztree> selectCheckPointsTree();
}
