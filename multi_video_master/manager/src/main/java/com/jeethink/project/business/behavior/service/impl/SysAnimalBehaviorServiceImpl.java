package com.jeethink.project.business.behavior.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.behavior.mapper.SysAnimalBehaviorMapper;
import com.jeethink.project.business.behavior.domain.SysAnimalBehavior;
import com.jeethink.project.business.behavior.service.ISysAnimalBehaviorService;
import com.jeethink.common.utils.text.Convert;

/**
 * 动物行为Service业务层处理
 * 
 * @author dan
 * @date 2021-04-20
 */
@Service
public class SysAnimalBehaviorServiceImpl implements ISysAnimalBehaviorService 
{
    @Autowired
    private SysAnimalBehaviorMapper sysAnimalBehaviorMapper;

    /**
     * 查询动物行为
     * 
     * @param id 动物行为ID
     * @return 动物行为
     */
    @Override
    public SysAnimalBehavior selectSysAnimalBehaviorById(Long id)
    {
        return sysAnimalBehaviorMapper.selectSysAnimalBehaviorById(id);
    }

    /**
     * 查询动物行为列表
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 动物行为
     */
    @Override
    public List<SysAnimalBehavior> selectSysAnimalBehaviorList(SysAnimalBehavior sysAnimalBehavior)
    {
        return sysAnimalBehaviorMapper.selectSysAnimalBehaviorList(sysAnimalBehavior);
    }

    /**
     * 新增动物行为
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 结果
     */
    @Override
    public int insertSysAnimalBehavior(SysAnimalBehavior sysAnimalBehavior)
    {
        return sysAnimalBehaviorMapper.insertSysAnimalBehavior(sysAnimalBehavior);
    }

    /**
     * 修改动物行为
     * 
     * @param sysAnimalBehavior 动物行为
     * @return 结果
     */
    @Override
    public int updateSysAnimalBehavior(SysAnimalBehavior sysAnimalBehavior)
    {
        return sysAnimalBehaviorMapper.updateSysAnimalBehavior(sysAnimalBehavior);
    }

    /**
     * 删除动物行为对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysAnimalBehaviorByIds(String ids)
    {
        return sysAnimalBehaviorMapper.deleteSysAnimalBehaviorByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除动物行为信息
     * 
     * @param id 动物行为ID
     * @return 结果
     */
    @Override
    public int deleteSysAnimalBehaviorById(Long id)
    {
        return sysAnimalBehaviorMapper.deleteSysAnimalBehaviorById(id);
    }
}
