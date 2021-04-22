package com.jeethink.project.system.dept.mapper;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.system.dept.domain.Dept;

/**
 * 企业部门Mapper接口
 * 
 * @author hanbin
 * @date 2021-01-23
 */
public interface DeptMapper 
{
    /**
     * 查询企业部门
     * 
     * @param deptId 企业部门ID
     * @return 企业部门
     */
    public Dept selectDeptById(Long deptId);

    /**
     * 查询部门列表
     * @param
     * @return 部门列表
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
     * 查询部门名称列表，用于其他页面的下拉列表
     * @param dept
     * @return 部门名称列表
     */
    public List<Dept> selectDeptNameList(Dept dept);

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
     * 删除企业部门
     * 
     * @param deptId 企业部门ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);

    /**
     * 批量删除企业部门
     * 
     * @param deptIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteDeptByIds(String[] deptIds);
}
