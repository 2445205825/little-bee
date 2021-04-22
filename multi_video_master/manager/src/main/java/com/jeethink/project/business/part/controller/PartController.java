package com.jeethink.project.business.part.controller;

import java.util.List;

import com.jeethink.common.utils.security.ShiroUtils;
import com.jeethink.project.business.unit.service.IUnitService;
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
import com.jeethink.project.business.part.domain.Part;
import com.jeethink.project.business.part.service.IPartService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 备件信息Controller
 * 
 * @author hanbin
 * @date 2021-01-27
 */
@Controller
@RequestMapping("/business/part")
public class PartController extends BaseController
{
    private String prefix = "business/part";

    @Autowired
    private IPartService partService;

    @Autowired
    private IUnitService unitService;

    @RequiresPermissions("business:part:view")
    @GetMapping()
    public String part()
    {
        return prefix + "/part";
    }

    /**
     * 查询备件信息列表
     */
    @RequiresPermissions("business:part:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Part part)
    {
        startPage();
        List<Part> list = partService.selectPartList(part);
        return getDataTable(list);
    }

    /**
     * 导出备件信息列表
     */
    @RequiresPermissions("business:part:export")
    @Log(title = "备件信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Part part)
    {
        List<Part> list = partService.selectPartList(part);
        ExcelUtil<Part> util = new ExcelUtil<Part>(Part.class);
        return util.exportExcel(list, "part");
    }

    /**
     * 新增备件信息
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<String> unitNameList = unitService.selectUnitNameList();
        if (unitNameList == null) {
            unitNameList.add("未知");
        }

        mmap.put("unitNameList",unitNameList);
        return prefix + "/add";
    }

    /**
     * 新增保存备件信息
     */
    @RequiresPermissions("business:part:add")
    @Log(title = "备件信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Part part)
    {
        part.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(partService.insertPart(part));
    }

    /**
     * 修改备件信息
     */
    @GetMapping("/edit/{partId}")
    public String edit(@PathVariable("partId") Long partId, ModelMap mmap)
    {
        Part part = partService.selectPartById(partId);
        mmap.put("part", part);

        /*初始化单位下拉列表*/
        List<String> unitNameList = unitService.selectUnitNameList();
        if (unitNameList == null) {
            unitNameList.add("未知");
        }
        mmap.put("unitNameList",unitNameList);
        return prefix + "/edit";
    }

    /**
     * 修改保存备件信息
     */
    @RequiresPermissions("business:part:edit")
    @Log(title = "备件信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Part part)
    {
        part.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(partService.updatePart(part));
    }

    /**
     * 删除备件信息
     */
    @RequiresPermissions("business:part:remove")
    @Log(title = "备件信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(partService.deletePartByIds(ids));
    }
}
