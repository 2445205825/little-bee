package com.jeethink.project.business.reportMonth.controller;

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
import com.jeethink.project.business.reportMonth.domain.Reportmonth;
import com.jeethink.project.business.reportMonth.service.IReportmonthService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 维修月报Controller
 * 
 * @author hanbin
 * @date 2021-01-31
 */
@Controller
@RequestMapping("/business/reportMonth")
public class ReportmonthController extends BaseController
{
    private String prefix = "business/reportMonth";

    @Autowired
    private IReportmonthService reportmonthService;

    @RequiresPermissions("business:reportMonth:view")
    @GetMapping()
    public String reportMonth()
    {
        return prefix + "/reportMonth";
    }

    /**
     * 查询维修月报列表
     */
    @RequiresPermissions("business:reportMonth:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Reportmonth reportmonth)
    {
        startPage();
        List<Reportmonth> list = reportmonthService.selectReportmonthList(reportmonth);
        return getDataTable(list);
    }

    /**
     * 导出维修月报列表
     */
    @RequiresPermissions("business:reportMonth:export")
    @Log(title = "维修月报", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Reportmonth reportmonth)
    {
        List<Reportmonth> list = reportmonthService.selectReportmonthList(reportmonth);
        ExcelUtil<Reportmonth> util = new ExcelUtil<Reportmonth>(Reportmonth.class);
        return util.exportExcel(list, "reportMonth");
    }

    /**
     * 新增维修月报
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存维修月报
     */
    @RequiresPermissions("business:reportMonth:add")
    @Log(title = "维修月报", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Reportmonth reportmonth)
    {
        return toAjax(reportmonthService.insertReportmonth(reportmonth));
    }

    /**
     * 修改维修月报
     */
    @GetMapping("/edit/{reportId}")
    public String edit(@PathVariable("reportId") Long reportId, ModelMap mmap)
    {
        Reportmonth reportmonth = reportmonthService.selectReportmonthById(reportId);
        mmap.put("reportmonth", reportmonth);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修月报
     */
    @RequiresPermissions("business:reportMonth:edit")
    @Log(title = "维修月报", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Reportmonth reportmonth)
    {
        return toAjax(reportmonthService.updateReportmonth(reportmonth));
    }

    /**
     * 删除维修月报
     */
    @RequiresPermissions("business:reportMonth:remove")
    @Log(title = "维修月报", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(reportmonthService.deleteReportmonthByIds(ids));
    }
}
