package com.jeethink.project.business.unit.controller;

import java.util.List;

import com.jeethink.common.utils.security.ShiroUtils;
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
import com.jeethink.project.business.unit.domain.Unit;
import com.jeethink.project.business.unit.service.IUnitService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 计量单位Controller
 * 
 * @author hanbin
 * @date 2021-01-27
 */
@Controller
@RequestMapping("/business/unit")
public class UnitController extends BaseController
{
    private String prefix = "business/unit";

    @Autowired
    private IUnitService unitService;


    @RequiresPermissions("business:unit:view")
    @GetMapping()
    public String unit()
    {
        return prefix + "/unit";
    }

    /**
     * 查询计量单位列表
     */
    @RequiresPermissions("business:unit:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Unit unit)
    {
        startPage();
        List<Unit> list = unitService.selectUnitList(unit);
        return getDataTable(list);
    }

    /**
     * 导出计量单位列表
     */
    @RequiresPermissions("business:unit:export")
    @Log(title = "计量单位", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Unit unit)
    {
        List<Unit> list = unitService.selectUnitList(unit);
        ExcelUtil<Unit> util = new ExcelUtil<Unit>(Unit.class);
        return util.exportExcel(list, "unit");
    }

    /**
     * 新增计量单位
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存计量单位
     */
    @RequiresPermissions("business:unit:add")
    @Log(title = "计量单位", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Unit unit)
    {
        String operName = ShiroUtils.getLoginName();
        unit.setCreateBy(operName);
        return toAjax(unitService.insertUnit(unit));
    }

    /**
     * 修改计量单位
     */
    @GetMapping("/edit/{unitId}")
    public String edit(@PathVariable("unitId") Long unitId, ModelMap mmap)
    {
        Unit unit = unitService.selectUnitById(unitId);
        mmap.put("unit", unit);
        return prefix + "/edit";
    }

    /**
     * 修改保存计量单位
     */
    @RequiresPermissions("business:unit:edit")
    @Log(title = "计量单位", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Unit unit)
    {
        return toAjax(unitService.updateUnit(unit));
    }

    /**
     * 删除计量单位
     */
    @RequiresPermissions("business:unit:remove")
    @Log(title = "计量单位", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(unitService.deleteUnitByIds(ids));
    }
}
