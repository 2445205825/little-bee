package com.jeethink.project.business.pointPartMap.controller;

import java.util.ArrayList;
import java.util.List;

import com.jeethink.common.utils.security.ShiroUtils;
import com.jeethink.project.business.address.service.IAddressService;
import com.jeethink.project.business.address.service.impl.AddressServiceImpl;
import com.jeethink.project.business.checkPoints.domain.CheckPoints;
import com.jeethink.project.business.checkPoints.service.ICheckPointsService;
import com.jeethink.project.business.part.domain.Part;
import com.jeethink.project.business.part.service.IPartService;
import com.jeethink.project.business.unit.service.IUnitService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.python.modules._py_compile;
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
import com.jeethink.project.business.pointPartMap.domain.PointPartMap;
import com.jeethink.project.business.pointPartMap.service.IPointPartMapService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;

/**
 * 检查点备件对应Controller
 * 
 * @author hanbin
 * @date 2021-01-30
 */
@Controller
@RequestMapping("/business/pointPartMap")
public class PointPartMapController extends BaseController
{
    private String prefix = "business/pointPartMap";

    @Autowired
    private IPointPartMapService pointPartMapService;

    @Autowired
    private IPartService partService;

    @Autowired
    private ICheckPointsService checkPointsService;

    @Autowired
    private IAddressService addressService;

    @Autowired
    private IUnitService unitService;

    @RequiresPermissions("business:pointPartMap:view")
    @GetMapping()
    public String pointPartMap(ModelMap mmap)
    {
        /*初始化下拉列表*/
        List<String> addressNameList = addressService.selectAddressNameList();
        List<String> partNameList = partService.selectPartNameList();
        List<String> checkPointList = checkPointsService.selectCheckPointsNameResult();

        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        if (checkPointList == null) {
            checkPointList.add("未知");
        }
        if (partNameList == null) {
            partNameList.add("未知");
        }

        mmap.put("addressNameList",addressNameList);
        mmap.put("checkNameList",checkPointList);
        mmap.put("partNameList",partNameList);

        return prefix + "/pointPartMap";
    }

    /**
     * 查询检查点备件对应列表
     */
    @RequiresPermissions("business:pointPartMap:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PointPartMap pointPartMap)
    {
        startPage();
        List<PointPartMap> list = pointPartMapService.selectPointPartMapList(pointPartMap);
        return getDataTable(list);
    }

    /**
     * 导出检查点备件对应列表
     */
    @RequiresPermissions("business:pointPartMap:export")
    @Log(title = "检查点备件对应", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PointPartMap pointPartMap)
    {
        List<PointPartMap> list = pointPartMapService.selectPointPartMapList(pointPartMap);
        ExcelUtil<PointPartMap> util = new ExcelUtil<PointPartMap>(PointPartMap.class);
        return util.exportExcel(list, "pointPartMap");
    }

    /**
     * 新增检查点备件对应
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        /*初始化下拉列表*/
        List<String> addressNameList = addressService.selectAddressNameList();
        Part part = new Part();
        List<Part> partList = partService.selectPartList(part);
        List<String> checkPointList = checkPointsService.selectCheckPointsNameResult();

        List<String> unitNameList = unitService.selectUnitNameList();

        if (addressNameList == null) {
            addressNameList.add("未知");
        }
        if (checkPointList == null) {
            checkPointList.add("未知");
        }
        if (unitNameList == null) {
            unitNameList.add("未知");
        }

        mmap.put("addressNameList",addressNameList);
        mmap.put("checkNameList",checkPointList);
        mmap.put("partNameList",partList);
        mmap.put("unitNameList",unitNameList);

        return prefix + "/add";
    }

    /**
     * 新增保存检查点备件对应
     */
    @RequiresPermissions("business:pointPartMap:add")
    @Log(title = "检查点备件对应", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PointPartMap pointPartMap)
    {
        pointPartMap.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(pointPartMapService.insertPointPartMap(pointPartMap));
    }

    /**
     * 修改检查点备件对应
     */
    @GetMapping("/edit/{mapId}")
    public String edit(@PathVariable("mapId") Long mapId, ModelMap mmap)
    {
        PointPartMap pointPartMap = pointPartMapService.selectPointPartMapById(mapId);
        mmap.put("pointPartMap", pointPartMap);

        /*初始化下来列表*/
        /*位置*/
        ArrayList<String> addressNameList = addressService.selectAddressNameList();

        /*检查点*/
        List<String> checkPointsList = checkPointsService.selectCheckPointsNameResult();

        /*配件列表*/
        ArrayList<String> parList = partService.selectPartNameList();

        mmap.put("addressNameList",addressNameList);
        mmap.put("checkPointsList",checkPointsList);
        mmap.put("parList",parList);
        return prefix + "/edit";
    }

    /**
     * 修改保存检查点备件对应
     */
    @RequiresPermissions("business:pointPartMap:edit")
    @Log(title = "检查点备件对应", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PointPartMap pointPartMap)
    {
        return toAjax(pointPartMapService.updatePointPartMap(pointPartMap));
    }

    /**
     * 删除检查点备件对应
     */
    @RequiresPermissions("business:pointPartMap:remove")
    @Log(title = "检查点备件对应", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pointPartMapService.deletePointPartMapByIds(ids));
    }
}
