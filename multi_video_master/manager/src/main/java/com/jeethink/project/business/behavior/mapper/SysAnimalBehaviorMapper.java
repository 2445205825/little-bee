package com.jeethink.project.business.behavior.mapper;

import java.util.List;
import com.jeethink.project.business.behavior.domain.SysAnimalBehavior;

/**
 * 动物行为Mapper接口
 * 
 * @author dan
 * @date 2021-04-20
 */
public interface SysAnimalBehaviorMapper 
{
    /**
     * 查询动物行为
     * 
     * @param id 动物行为ID
     * @return 动物行为
     */
    public SysAnimalBehavior selectSysAnimalBehaviorById(Long id);

    /**
     * 查询动物行为列表
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 动物行为集合
     */
    public List<SysAnimalBehavior> selectSysAnimalBehaviorList(SysAnimalBehavior sysAnimalBehavior);

    /**
     * 新增动物行为
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 结果
     */
    public int insertSysAnimalBehavior(SysAnimalBehavior sysAnimalBehavior);

    /**
     * 修改动物行为
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 结果
     */
    public int updateSysAnimalBehavior(SysAnimalBehavior sysAnimalBehavior);

    /**
     * 删除动物行为
     * 
     * @param id 动物行为ID
     * @return 结果
     */
    public int deleteSysAnimalBehaviorById(Long id);

    /**
     * 批量删除动物行为
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAnimalBehaviorByIds(String[] ids);
}
