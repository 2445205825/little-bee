package com.jeethink.project.business.reportDay.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

import com.jeethink.common.utils.security.ShiroUtils;
import com.jeethink.project.business.checkItems.domain.CheckItems;
import com.jeethink.project.business.checkItems.service.ICheckItemsService;
import com.jeethink.project.business.checkPoints.service.ICheckPointsService;
import com.jeethink.project.business.part.service.IPartService;
import com.jeethink.project.business.pointPartMap.domain.PointPartMap;
import com.jeethink.project.business.pointPartMap.service.IPointPartMapService;
import com.jeethink.project.business.unit.service.IUnitService;
import com.jeethink.project.system.dept.domain.Dept;
import com.jeethink.project.system.dept.service.IDeptService;
import com.jeethink.project.system.user.domain.User;
import com.jeethink.project.system.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.python.modules._hashlib;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jeethink.framework.aspectj.lang.annotation.Log;
import com.jeethink.framework.aspectj.lang.enums.BusinessType;
import com.jeethink.project.business.reportDay.domain.ReportDay;
import com.jeethink.project.business.reportDay.service.IReportDayService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 日报表Controller
 * 
 * @author hanbin
 * @date 2021-01-29
 */
@Controller
@RequestMapping("/business/reportDay")
public class ReportDayController extends BaseController
{
    private String prefix = "business/reportDay";

    @Autowired
    private IReportDayService reportDayService;

    @Autowired
    private ICheckPointsService checkPointsService;

    @Autowired
    private IDeptService deptService;

    @Autowired
     private IPartService partService;

    @Autowired
    private IUnitService unitService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ICheckItemsService checkItemsService;

    @Autowired
    private IPointPartMapService pointPartMapService;

    @RequiresPermissions("business:reportDay:view")
    @GetMapping()
    public String reportDay(ModelMap mmap)
    {
        List<String> checkNameList = checkPointsService.selectCheckPointsNameResult();
        if (checkNameList == null) {
            checkNameList.add("未知");
        }
        List<String> repairDeptList = deptService.selectDeptName();
        if (repairDeptList == null) {
            repairDeptList.add("未知");
        }

        mmap.put("checkNameList",checkNameList);
        mmap.put("repairDeptList",repairDeptList);

        return prefix + "/reportDay";
    }

    /**
     * 查询日报表列表
     */
    @RequiresPermissions("business:reportDay:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ReportDay reportDay)
    {
        startPage();
        List<ReportDay> list = reportDayService.selectReportDayList(reportDay);

        return getDataTable(list);
    }

    /**
     * 导出日报表列表
     */
    @RequiresPermissions("business:reportDay:export")
    @Log(title = "日报表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ReportDay reportDay)
    {
        List<ReportDay> list = reportDayService.selectReportDayList(reportDay);
        ExcelUtil<ReportDay> util = new ExcelUtil<ReportDay>(ReportDay.class);
        return util.exportExcel(list, "reportDay");
    }

    /**
     * 新增日报表
     */
    @GetMapping("/add")
    public String add(ModelMap mmap, Model model) {

        List<String> checkNameList = checkPointsService.selectCheckPointsNameResult();
        if (checkNameList == null) {
            checkNameList.add("未知");
        }
        List<String> repairDeptList = deptService.selectDeptName();
        if (repairDeptList == null) {
            repairDeptList.add("未知");
        }

        List<String> partNameList = partService.selectPartNameList();
        if (partNameList == null) {
            partNameList.add("未知");
        }

        List<String> unitNameList = unitService.selectUnitNameList();
        if (unitNameList == null) {
            unitNameList.add("未知");
        }

        mmap.put("checkNameList", checkNameList);
        mmap.put("repairDeptList", repairDeptList);
        mmap.put("partNameList", partNameList);
        mmap.put("unitNameList", unitNameList);

        return prefix + "/add";
    }

    /**
     * 新增保存日报表
     */
    @RequiresPermissions("business:reportDay:add")
    @Log(title = "日报表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ReportDay reportDay)
    {
        /*判断权限，只有一级部门用户才能新增*/
        String loginName = ShiroUtils.getLoginName();
        Long parentId = userService.selectUserByLoginName(loginName).getDeptId();

        if (parentId == 1 || parentId == null) {
            reportDay.setCreateBy(ShiroUtils.getLoginName());
            return toAjax(reportDayService.insertReportDay(reportDay));
        }
        else {
            return AjaxResult.warn("对不起，您没有权限新增任务");
        }
    }

    /**
     * 修改日报表
     */
    @GetMapping("/edit/{reportId}")
    public String edit(@PathVariable("reportId") Long reportId, ModelMap mmap)
    {
        ReportDay reportDay = reportDayService.selectReportDayById(reportId);
        mmap.put("reportDay", reportDay);

        List<String> repairDeptList = deptService.selectDeptName();
        if (repairDeptList == null) {
            repairDeptList.add("未知");
        }
        mmap.put("repairDeptList",repairDeptList);

        return prefix + "/edit";
    }

    /**
     * 修改保存日报表
     */
    @RequiresPermissions("business:reportDay:edit")
    @Log(title = "日报表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ReportDay reportDay)
    {
        /*判断权限，只有一级部门用户才能新增*/
        String loginName = ShiroUtils.getLoginName();
        Long parentId = userService.selectUserByLoginName(loginName).getDeptId();

        if (parentId == 1 || parentId != null) {
            /*判断时间不能小于当前日期*/
            Date currentDate = new Date();

            if (currentDate.compareTo(reportDay.getRequireTime()) > 0 || (reportDay.getRequireTime().compareTo(reportDay.getDealTime()) > 0)) {
                return AjaxResult.warn("对不起，您设置的要求完成时间或实际完成时间不正确！");
            }
            else{
                reportDay.setLeader(ShiroUtils.getLoginName());
                return toAjax(reportDayService.updateReportDay(reportDay));
            }
        }
        else {
            return AjaxResult.warn("对不起，您没有权限编辑任务");
        }
    }

    /**
     * 删除日报表
     */
    @RequiresPermissions("business:reportDay:remove")
    @Log(title = "日报表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        /*判断权限，只有一级部门用户才能新增*/
        String loginName = ShiroUtils.getLoginName();
        Long parentId = userService.selectUserByLoginName(loginName).getDeptId();

        if (parentId == 1 || parentId != null) {
            return toAjax(reportDayService.deleteReportDayByIds(ids));
        }
        else {
            return AjaxResult.warn("对不起，您没有权限删除任务");
        }
    }
}
