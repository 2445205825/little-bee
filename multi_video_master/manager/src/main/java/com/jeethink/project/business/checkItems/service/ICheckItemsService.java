package com.jeethink.project.business.checkItems.service;

import java.util.List;
import com.jeethink.project.business.checkItems.domain.CheckItems;

/**
 * 检查项设置Service接口
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public interface ICheckItemsService 
{
    /**
     * 查询检查项设置
     * 
     * @param checkCode 检查项设置ID
     * @return 检查项设置
     */
    public CheckItems selectCheckItemsById(Long checkCode);

    /**
     * 查询检查项设置列表
     * 
     * @param checkItems 检查项设置
     * @return 检查项设置集合
     */
    public List<CheckItems> selectCheckItemsList(CheckItems checkItems);

    /**
     * 新增检查项设置
     * 
     * @param checkItems 检查项设置
     * @return 结果
     */
    public int insertCheckItems(CheckItems checkItems);

    /**
     * 修改检查项设置
     * 
     * @param checkItems 检查项设置
     * @return 结果
     */
    public int updateCheckItems(CheckItems checkItems);

    /**
     * 批量删除检查项设置
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCheckItemsByIds(String ids);

    /**
     * 删除检查项设置信息
     * 
     * @param checkCode 检查项设置ID
     * @return 结果
     */
    public int deleteCheckItemsById(Long checkCode);
}
