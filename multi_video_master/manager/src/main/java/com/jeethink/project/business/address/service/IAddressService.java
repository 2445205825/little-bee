package com.jeethink.project.business.address.service;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.business.address.domain.Address;
import com.jeethink.framework.web.domain.Ztree;

/**
 * 设备位置的信息Service接口
 * 
 * @author hanbin
 * @date 2021-01-28
 */
public interface IAddressService 
{
    /**
     * 查询设备位置的信息
     * 
     * @param addressId 设备位置的信息ID
     * @return 设备位置的信息
     */
    public Address selectAddressById(Long addressId);

    public ArrayList<String> selectAddressNameList();
    /**
     * 查询设备位置的信息列表
     * 
     * @param address 设备位置的信息
     * @return 设备位置的信息集合
     */
    public List<Address> selectAddressList(Address address);

    /**
     * 新增设备位置的信息
     * 
     * @param address 设备位置的信息
     * @return 结果
     */
    public int insertAddress(Address address);

    /**
     * 修改设备位置的信息
     * 
     * @param address 设备位置的信息
     * @return 结果
     */
    public int updateAddress(Address address);

    /**
     * 批量删除设备位置的信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAddressByIds(String ids);

    /**
     * 删除设备位置的信息信息
     * 
     * @param addressId 设备位置的信息ID
     * @return 结果
     */
    public int deleteAddressById(Long addressId);

    /**
     * 查询设备位置的信息树列表
     * 
     * @return 所有设备位置的信息信息
     */
    public List<Ztree> selectAddressTree();
}
