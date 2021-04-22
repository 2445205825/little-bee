package com.jeethink.project.business.checkPoints.controller;

import java.util.List;

import com.jeethink.common.utils.security.ShiroUtils;
import com.jeethink.project.business.address.domain.Address;
import com.jeethink.project.business.address.service.IAddressService;
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
import com.jeethink.project.business.checkPoints.domain.CheckPoints;
import com.jeethink.project.business.checkPoints.service.ICheckPointsService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.common.utils.StringUtils;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 检查点信息Controller
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Controller
@RequestMapping("/business/checkPoints")
public class CheckPointsController extends BaseController
{
    private String prefix = "business/checkPoints";

    @Autowired
    private ICheckPointsService checkPointsService;

    @Autowired
    private IAddressService addressService;

    @RequiresPermissions("business:checkPoints:view")
    @GetMapping()
    public String checkPoints(ModelMap mmap)
    {
        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);
        return prefix + "/checkPoints";
    }

    /**
     * 查询检查点信息树列表
     */
    @RequiresPermissions("business:checkPoints:list")
    @PostMapping("/list")
    @ResponseBody
    public List<CheckPoints> list(CheckPoints checkPoints)
    {
        List<CheckPoints> list = checkPointsService.selectCheckPointsList(checkPoints);
        return list;
    }

    /**
     * 导出检查点信息列表
     */
    @RequiresPermissions("business:checkPoints:export")
    @Log(title = "检查点信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CheckPoints checkPoints)
    {
        List<CheckPoints> list = checkPointsService.selectCheckPointsList(checkPoints);
        ExcelUtil<CheckPoints> util = new ExcelUtil<CheckPoints>(CheckPoints.class);
        return util.exportExcel(list, "checkPoints");
    }

    /**
     * 新增检查点信息
     */
    @GetMapping(value = { "/add/{checkId}", "/add/" })
    public String add(@PathVariable(value = "checkId", required = false) Long checkId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(checkId))
        {
            mmap.put("checkPoints", checkPointsService.selectCheckPointsById(checkId));
        }

        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);

        return prefix + "/add";
    }

    /**
     * 新增保存检查点信息
     */
    @RequiresPermissions("business:checkPoints:add")
    @Log(title = "检查点信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CheckPoints checkPoints)
    {
        checkPoints.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(checkPointsService.insertCheckPoints(checkPoints));
    }

    /**
     * 修改检查点信息
     */
    @GetMapping("/edit/{checkId}")
    public String edit(@PathVariable("checkId") Long checkId, ModelMap mmap)
    {
        CheckPoints checkPoints = checkPointsService.selectCheckPointsById(checkId);
        mmap.put("checkPoints", checkPoints);

        List<String> addressNameList = addressService.selectAddressNameList();
        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        mmap.put("addressNameList",addressNameList);

        return prefix + "/edit";
    }

    /**
     * 修改保存检查点信息
     */
    @RequiresPermissions("business:checkPoints:edit")
    @Log(title = "检查点信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CheckPoints checkPoints)
    {
        checkPoints.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(checkPointsService.updateCheckPoints(checkPoints));
    }

    /**
     * 删除
     */
    @RequiresPermissions("business:checkPoints:remove")
    @Log(title = "检查点信息", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{checkId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("checkId") Long checkId)
    {
        return toAjax(checkPointsService.deleteCheckPointsById(checkId));
    }

    /**
     * 选择检查点信息树
     */
    @GetMapping(value = { "/selectCheckPointsTree/{checkId}", "/selectCheckPointsTree/" })
    public String selectCheckPointsTree(@PathVariable(value = "checkId", required = false) Long checkId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(checkId))
        {
            mmap.put("checkPoints", checkPointsService.selectCheckPointsById(checkId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载检查点信息树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = checkPointsService.selectCheckPointsTree();
        return ztrees;
    }
}
