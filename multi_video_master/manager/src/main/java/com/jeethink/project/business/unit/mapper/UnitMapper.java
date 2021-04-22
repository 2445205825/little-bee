package com.jeethink.project.business.unit.mapper;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.business.unit.domain.Unit;

/**
 * 计量单位Mapper接口
 * 
 * @author hanbin
 * @date 2021-01-27
 */
public interface UnitMapper 
{
    /**
     * 查询计量单位
     * 
     * @param unitId 计量单位ID
     * @return 计量单位
     */
    public Unit selectUnitById(Long unitId);

    /**
     * 查询计量单位列表
     * 
     * @param unit 计量单位
     * @return 计量单位集合
     */
    public List<Unit> selectUnitList(Unit unit);

    /**
     * 查询单位列表，用于其他页面的下拉列表的展示
     * @return
     */
    public ArrayList<String> selectUnitNameList();

    /**
     * 新增计量单位
     * 
     * @param unit 计量单位
     * @return 结果
     */
    public int insertUnit(Unit unit);

    /**
     * 修改计量单位
     * 
     * @param unit 计量单位
     * @return 结果
     */
    public int updateUnit(Unit unit);

    /**
     * 删除计量单位
     * 
     * @param unitId 计量单位ID
     * @return 结果
     */
    public int deleteUnitById(Long unitId);

    /**
     * 批量删除计量单位
     * 
     * @param unitIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUnitByIds(String[] unitIds);
}
