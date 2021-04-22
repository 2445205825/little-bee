package com.jeethink.project.business.unit.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.unit.mapper.UnitMapper;
import com.jeethink.project.business.unit.domain.Unit;
import com.jeethink.project.business.unit.service.IUnitService;
import com.jeethink.common.utils.text.Convert;

/**
 * 计量单位Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-27
 */
@Service
public class UnitServiceImpl implements IUnitService 
{
    @Autowired
    private UnitMapper unitMapper;

    /**
     * 查询计量单位
     * 
     * @param unitId 计量单位ID
     * @return 计量单位
     */
    @Override
    public Unit selectUnitById(Long unitId)
    {
        return unitMapper.selectUnitById(unitId);
    }

    /**
     * 查询计量单位列表
     * 
     * @param unit 计量单位
     * @return 计量单位
     */
    @Override
    public List<Unit> selectUnitList(Unit unit)
    {
        return unitMapper.selectUnitList(unit);
    }

    public ArrayList<String> selectUnitNameList()
    {
        return unitMapper.selectUnitNameList();
    }
    /**
     * 新增计量单位
     * 
     * @param unit 计量单位
     * @return 结果
     */
    @Override
    public int insertUnit(Unit unit)
    {
        unit.setCreateTime(DateUtils.getNowDate());
        return unitMapper.insertUnit(unit);
    }

    /**
     * 修改计量单位
     * 
     * @param unit 计量单位
     * @return 结果
     */
    @Override
    public int updateUnit(Unit unit)
    {
        return unitMapper.updateUnit(unit);
    }

    /**
     * 删除计量单位对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUnitByIds(String ids)
    {
        return unitMapper.deleteUnitByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除计量单位信息
     * 
     * @param unitId 计量单位ID
     * @return 结果
     */
    @Override
    public int deleteUnitById(Long unitId)
    {
        return unitMapper.deleteUnitById(unitId);
    }
}
