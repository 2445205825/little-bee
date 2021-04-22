package com.jeethink.project.business.address.controller;

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
import com.jeethink.project.business.address.domain.Address;
import com.jeethink.project.business.address.service.IAddressService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.common.utils.StringUtils;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 设备位置的信息Controller
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Controller
@RequestMapping("/business/address")
public class AddressController extends BaseController
{
    private String prefix = "business/address";

    @Autowired
    private IAddressService addressService;

    @RequiresPermissions("business:address:view")
    @GetMapping()
    public String address()
    {
        return prefix + "/address";
    }
    
    /**
     * 查询设备位置的信息树列表
     */
    @RequiresPermissions("business:address:list")
    @PostMapping("/list")
    @ResponseBody
    public List<Address> list(Address address)
    {
        List<Address> list = addressService.selectAddressList(address);
        return list;
    }

    /**
     * 导出设备位置的信息列表
     */
    @RequiresPermissions("business:address:export")
    @Log(title = "设备位置的信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Address address)
    {
        List<Address> list = addressService.selectAddressList(address);
        ExcelUtil<Address> util = new ExcelUtil<Address>(Address.class);
        return util.exportExcel(list, "address");
    }

    /**
     * 新增设备位置的信息
     */
    @GetMapping(value = { "/add/{addressId}", "/add/" })
    public String add(@PathVariable(value = "addressId", required = false) Long addressId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(addressId))
        {
            mmap.put("address", addressService.selectAddressById(addressId));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存设备位置的信息
     */
    @RequiresPermissions("business:address:add")
    @Log(title = "设备位置的信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Address address)
    {
        address.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(addressService.insertAddress(address));
    }

    /**
     * 修改设备位置的信息
     */
    @GetMapping("/edit/{addressId}")
    public String edit(@PathVariable("addressId") Long addressId, ModelMap mmap)
    {
        Address address = addressService.selectAddressById(addressId);
        mmap.put("address", address);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备位置的信息
     */
    @RequiresPermissions("business:address:edit")
    @Log(title = "设备位置的信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Address address)
    {
        address.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(addressService.updateAddress(address));
    }

    /**
     * 删除
     */
    @RequiresPermissions("business:address:remove")
    @Log(title = "设备位置的信息", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{addressId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("addressId") Long addressId)
    {
        return toAjax(addressService.deleteAddressById(addressId));
    }

    /**
     * 选择设备位置的信息树
     */
    @GetMapping(value = { "/selectAddressTree/{addressId}", "/selectAddressTree/" })
    public String selectAddressTree(@PathVariable(value = "addressId", required = false) Long addressId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(addressId))
        {
            mmap.put("address", addressService.selectAddressById(addressId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载设备位置的信息树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = addressService.selectAddressTree();
        return ztrees;
    }
}
