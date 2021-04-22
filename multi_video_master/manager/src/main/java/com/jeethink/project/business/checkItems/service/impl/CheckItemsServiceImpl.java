package com.jeethink.project.business.checkItems.service.impl;

import java.util.List;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.checkItems.mapper.CheckItemsMapper;
import com.jeethink.project.business.checkItems.domain.CheckItems;
import com.jeethink.project.business.checkItems.service.ICheckItemsService;
import com.jeethink.common.utils.text.Convert;

/**
 * 检查项设置Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Service
public class CheckItemsServiceImpl implements ICheckItemsService 
{
    @Autowired
    private CheckItemsMapper checkItemsMapper;

    /**
     * 查询检查项设置
     * 
     * @param checkCode 检查项设置ID
     * @return 检查项设置
     */
    @Override
    public CheckItems selectCheckItemsById(Long checkCode)
    {
        return checkItemsMapper.selectCheckItemsById(checkCode);
    }

    /**
     * 查询检查项设置列表
     * 
     * @param checkItems 检查项设置
     * @return 检查项设置
     */
    @Override
    public List<CheckItems> selectCheckItemsList(CheckItems checkItems)
    {
        return checkItemsMapper.selectCheckItemsList(checkItems);
    }

    /**
     * 新增检查项设置
     * 
     * @param checkItems 检查项设置
     * @return 结果
     */
    @Override
    public int insertCheckItems(CheckItems checkItems)
    {
        checkItems.setCreateTime(DateUtils.getNowDate());
        return checkItemsMapper.insertCheckItems(checkItems);
    }

    /**
     * 修改检查项设置
     * 
     * @param checkItems 检查项设置
     * @return 结果
     */
    @Override
    public int updateCheckItems(CheckItems checkItems)
    {
        return checkItemsMapper.updateCheckItems(checkItems);
    }

    /**
     * 删除检查项设置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCheckItemsByIds(String ids)
    {
        return checkItemsMapper.deleteCheckItemsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除检查项设置信息
     * 
     * @param checkCode 检查项设置ID
     * @return 结果
     */
    @Override
    public int deleteCheckItemsById(Long checkCode)
    {
        return checkItemsMapper.deleteCheckItemsById(checkCode);
    }
}
