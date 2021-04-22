package com.jeethink.project.system.dept.service;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.system.dept.domain.Dept;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 企业部门Service接口
 * 
 * @author hanbin
 * @date 2021-01-23
 */
public interface IDeptService 
{
    /**
     * 查询企业部门
     * 
     * @param deptId 企业部门ID
     * @return 企业部门
     */
    public Dept selectDeptById(Long deptId);

    /**
     * 查询部门名称列表
     * @return
     */
    public ArrayList<String> selectDeptName();

    /**
     * 查询企业部门列表
     * 
     * @param dept 企业部门
     * @return 企业部门集合
     */
    public List<Dept> selectDeptList(Dept dept);

    /**
     * 新增企业部门
     * 
     * @param dept 企业部门
     * @return 结果
     */
    public int insertDept(Dept dept);

    /**
     * 修改企业部门
     * 
     * @param dept 企业部门
     * @return 结果
     */
    public int updateDept(Dept dept);

    /**
     * 批量删除企业部门
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDeptByIds(String ids);

    /**
     * 删除企业部门信息
     * 
     * @param deptId 企业部门ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);

    /**
     * 查询企业部门树列表
     * 
     * @return 所有企业部门信息
     */
    public List<Ztree> selectDeptTree();
}
