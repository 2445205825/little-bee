package com.jeethink.project.business.behavior.controller;

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
import com.jeethink.project.business.behavior.domain.SysAnimalBehavior;
import com.jeethink.project.business.behavior.service.ISysAnimalBehaviorService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 动物行为Controller
 * 
 * @author dan
 * @date 2021-04-20
 */
@Controller
@RequestMapping("/business/behavior")
public class SysAnimalBehaviorController extends BaseController
{
    private String prefix = "business/behavior";

    @Autowired
    private ISysAnimalBehaviorService sysAnimalBehaviorService;

    @RequiresPermissions("business:behavior:view")
    @GetMapping()
    public String behavior()
    {
        return prefix + "/behavior";
    }

    /**
     * 查询动物行为列表
     */
    @RequiresPermissions("business:behavior:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysAnimalBehavior sysAnimalBehavior)
    {
        startPage();
        List<SysAnimalBehavior> list = sysAnimalBehaviorService.selectSysAnimalBehaviorList(sysAnimalBehavior);
        return getDataTable(list);
    }

    /**
     * 导出动物行为列表
     */
    @RequiresPermissions("business:behavior:export")
    @Log(title = "动物行为", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysAnimalBehavior sysAnimalBehavior)
    {
        List<SysAnimalBehavior> list = sysAnimalBehaviorService.selectSysAnimalBehaviorList(sysAnimalBehavior);
        ExcelUtil<SysAnimalBehavior> util = new ExcelUtil<SysAnimalBehavior>(SysAnimalBehavior.class);
        return util.exportExcel(list, "behavior");
    }

    /**
     * 新增动物行为
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存动物行为
     */
    @RequiresPermissions("business:behavior:add")
    @Log(title = "动物行为", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysAnimalBehavior sysAnimalBehavior)
    {
        return toAjax(sysAnimalBehaviorService.insertSysAnimalBehavior(sysAnimalBehavior));
    }

    /**
     * 修改动物行为
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        SysAnimalBehavior sysAnimalBehavior = sysAnimalBehaviorService.selectSysAnimalBehaviorById(id);
        mmap.put("sysAnimalBehavior", sysAnimalBehavior);
        return prefix + "/edit";
    }

    /**
     * 修改保存动物行为
     */
    @RequiresPermissions("business:behavior:edit")
    @Log(title = "动物行为", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysAnimalBehavior sysAnimalBehavior)
    {
        return toAjax(sysAnimalBehaviorService.updateSysAnimalBehavior(sysAnimalBehavior));
    }

    /**
     * 删除动物行为
     */
    @RequiresPermissions("business:behavior:remove")
    @Log(title = "动物行为", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysAnimalBehaviorService.deleteSysAnimalBehaviorByIds(ids));
    }
}
