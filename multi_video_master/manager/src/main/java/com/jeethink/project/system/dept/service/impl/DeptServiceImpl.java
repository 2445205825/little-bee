package com.jeethink.project.system.dept.service.impl;

import java.util.List;
import java.util.ArrayList;
import com.jeethink.framework.web.domain.Ztree;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.system.dept.mapper.DeptMapper;
import com.jeethink.project.system.dept.domain.Dept;
import com.jeethink.project.system.dept.service.IDeptService;
import com.jeethink.common.utils.text.Convert;

/**
 * 企业部门Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-23
 */
@Service
public class DeptServiceImpl implements IDeptService 
{
    @Autowired
    private DeptMapper deptMapper;

    /**
     * 查询企业部门
     * 
     * @param deptId 企业部门ID
     * @return 企业部门
     */
    @Override
    public Dept selectDeptById(Long deptId)
    {
        return deptMapper.selectDeptById(deptId);
    }

    @Override
    public ArrayList<String> selectDeptName(){
        return deptMapper.selectDeptName();
    }
    /**
     * 查询企业部门列表
     * 
     * @param dept 企业部门
     * @return 企业部门
     */
    @Override
    public List<Dept> selectDeptList(Dept dept)
    {
        return deptMapper.selectDeptList(dept);
    }

    /**
     * 新增企业部门
     * 
     * @param dept 企业部门
     * @return 结果
     */
    @Override
    public int insertDept(Dept dept)
    {
        dept.setCreateTime(DateUtils.getNowDate());
        return deptMapper.insertDept(dept);
    }

    /**
     * 修改企业部门
     * 
     * @param dept 企业部门
     * @return 结果
     */
    @Override
    public int updateDept(Dept dept)
    {
        dept.setUpdateTime(DateUtils.getNowDate());
        return deptMapper.updateDept(dept);
    }

    /**
     * 删除企业部门对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDeptByIds(String ids)
    {
        return deptMapper.deleteDeptByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除企业部门信息
     * 
     * @param deptId 企业部门ID
     * @return 结果
     */
    @Override
    public int deleteDeptById(Long deptId)
    {
        return deptMapper.deleteDeptById(deptId);
    }

    /**
     * 查询企业部门树列表
     * 
     * @return 所有企业部门信息
     */
    @Override
    public List<Ztree> selectDeptTree()
    {
        List<Dept> deptList = deptMapper.selectDeptList(new Dept());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (Dept dept : deptList)
        {
            Ztree ztree = new Ztree();
            ztree.setId(dept.getDeptId());
            ztree.setpId(dept.getParentId());
            ztree.setName(dept.getDeptName());
            ztree.setTitle(dept.getDeptName());
            ztrees.add(ztree);
        }
        return ztrees;
    }
}
