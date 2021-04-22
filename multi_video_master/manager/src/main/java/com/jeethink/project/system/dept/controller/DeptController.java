package com.jeethink.project.system.dept.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jeethink.framework.aspectj.lang.annotation.Log;
import com.jeethink.framework.aspectj.lang.enums.BusinessType;
import com.jeethink.project.system.dept.domain.Dept;
import com.jeethink.project.system.dept.service.IDeptService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.common.utils.StringUtils;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 企业部门Controller
 * 
 * @author hanbin
 * @date 2021-01-23
 */
@Controller
@RequestMapping("/system/dept")
public class DeptController extends BaseController
{
    private String prefix = "system/dept";

    @Autowired
    private IDeptService deptService;

    @RequiresPermissions("system:dept:view")
    @GetMapping()
    public String dept()
    {
        return prefix + "/dept";
    }

    /**
     * 查询企业部门树列表
     */
    @RequiresPermissions("system:dept:list")
    @PostMapping("/list")
    @ResponseBody
    public List<Dept> list(Dept dept)
    {
        List<Dept> list = deptService.selectDeptList(dept);
        return list;
    }

    /**
     * 导出企业部门列表
     */
    @RequiresPermissions("system:dept:export")
    @Log(title = "企业部门", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Dept dept)
    {
        List<Dept> list = deptService.selectDeptList(dept);
        ExcelUtil<Dept> util = new ExcelUtil<Dept>(Dept.class);
        return util.exportExcel(list, "dept");
    }

    /**
     * 新增企业部门
     */
    @GetMapping(value = { "/add/{deptId}", "/add/" })
    public String add(@PathVariable(value = "deptId", required = false) Long deptId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(deptId))
        {
            mmap.put("dept", deptService.selectDeptById(deptId));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存企业部门
     */
    @RequiresPermissions("system:dept:add")
    @Log(title = "企业部门", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Dept dept)
    {
        return toAjax(deptService.insertDept(dept));
    }

    /**
     * 修改企业部门
     */
    @GetMapping("/edit/{deptId}")
    public String edit(@PathVariable("deptId") Long deptId, ModelMap mmap)
    {
        Dept dept = deptService.selectDeptById(deptId);
        mmap.put("dept", dept);
        return prefix + "/edit";
    }

    /**
     * 修改保存企业部门
     */
    @RequiresPermissions("system:dept:edit")
    @Log(title = "企业部门", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Dept dept)
    {
        return toAjax(deptService.updateDept(dept));
    }

    /**
     * 删除
     */
    @RequiresPermissions("system:dept:remove")
    @Log(title = "企业部门", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{deptId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("deptId") Long deptId)
    {
        return toAjax(deptService.deleteDeptById(deptId));
    }

    /**
     * 选择企业部门树
     */
    @GetMapping(value = { "/selectDeptTree/{deptId}", "/selectDeptTree/" })
    public String selectDeptTree(@PathVariable(value = "deptId", required = false) Long deptId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(deptId))
        {
            mmap.put("dept", deptService.selectDeptById(deptId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载企业部门树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = deptService.selectDeptTree();
        return ztrees;
    }
}
