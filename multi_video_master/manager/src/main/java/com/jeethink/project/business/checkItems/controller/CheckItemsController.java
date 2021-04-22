package com.jeethink.project.business.checkItems.controller;

import java.util.List;

import com.jeethink.common.utils.security.ShiroUtils;
import com.jeethink.project.business.address.service.IAddressService;
import com.jeethink.project.business.checkPoints.service.ICheckPointsService;
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
import com.jeethink.project.business.checkItems.domain.CheckItems;
import com.jeethink.project.business.checkItems.service.ICheckItemsService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 检查项设置Controller
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Controller
@RequestMapping("/business/checkItems")
public class CheckItemsController extends BaseController
{
    private String prefix = "business/checkItems";

    @Autowired
    private ICheckItemsService checkItemsService;

    @Autowired
    private IAddressService addressService;

    @Autowired
    private ICheckPointsService checkPointsService;

    @RequiresPermissions("business:checkItems:view")
    @GetMapping()
    public String checkItems(ModelMap mmap)
    {
        /*初始化下拉列表信息*/
        /*1.位置*/
        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);

        /*2.检查点列表*/
        List<String> checkNameList = checkPointsService.selectCheckPointsNameResult();
        if (checkNameList == null) {
            checkNameList.add("未知");
        }
        mmap.put("checkNameList",checkNameList);

        return prefix + "/checkItems";
    }

    /**
     * 查询检查项设置列表
     */
    @RequiresPermissions("business:checkItems:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CheckItems checkItems)
    {
        startPage();
        List<CheckItems> list = checkItemsService.selectCheckItemsList(checkItems);
        return getDataTable(list);
    }

    /**
     * 导出检查项设置列表
     */
    @RequiresPermissions("business:checkItems:export")
    @Log(title = "检查项设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CheckItems checkItems)
    {
        List<CheckItems> list = checkItemsService.selectCheckItemsList(checkItems);
        ExcelUtil<CheckItems> util = new ExcelUtil<CheckItems>(CheckItems.class);
        return util.exportExcel(list, "checkItems");
    }

    /**
     * 新增检查项设置
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        /*初始化下拉列表信息*/
        /*1.位置*/
        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);

        /*2.检查点列表*/
        List<String> checkNameList = checkPointsService.selectCheckPointsNameResult();
        if (checkNameList == null) {
            checkNameList.add("未知");
        }
        mmap.put("checkNameList",checkNameList);
        return prefix + "/add";
    }

    /**
     * 新增保存检查项设置
     */
    @RequiresPermissions("business:checkItems:add")
    @Log(title = "检查项设置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CheckItems checkItems)
    {
        checkItems.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(checkItemsService.insertCheckItems(checkItems));
    }

    /**
     * 修改检查项设置
     */
    @GetMapping("/edit/{checkCode}")
    public String edit(@PathVariable("checkCode") Long checkCode, ModelMap mmap)
    {
        CheckItems checkItems = checkItemsService.selectCheckItemsById(checkCode);
        mmap.put("checkItems", checkItems);

        /*初始化下拉列表信息*/
        /*1.位置*/
        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);

        /*2.检查点列表*/
        List<String> checkNameList = checkPointsService.selectCheckPointsNameResult();
        if (checkNameList == null) {
            checkNameList.add("未知");
        }
        mmap.put("checkNameList",checkNameList);

        return prefix + "/edit";
    }

    /**
     * 修改保存检查项设置
     */
    @RequiresPermissions("business:checkItems:edit")
    @Log(title = "检查项设置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CheckItems checkItems)
    {
        checkItems.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(checkItemsService.updateCheckItems(checkItems));
    }

    /**
     * 删除检查项设置
     */
    @RequiresPermissions("business:checkItems:remove")
    @Log(title = "检查项设置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(checkItemsService.deleteCheckItemsByIds(ids));
    }
}
