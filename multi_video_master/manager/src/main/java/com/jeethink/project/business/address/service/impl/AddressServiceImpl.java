package com.jeethink.project.business.address.service.impl;

import java.util.List;
import java.util.ArrayList;
import com.jeethink.framework.web.domain.Ztree;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.address.mapper.AddressMapper;
import com.jeethink.project.business.address.domain.Address;
import com.jeethink.project.business.address.service.IAddressService;
import com.jeethink.common.utils.text.Convert;

/**
 * 设备位置的信息Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-28
 */
@Service
public class AddressServiceImpl implements IAddressService 
{
    @Autowired
    private AddressMapper addressMapper;

    /**
     * 查询设备位置的信息
     * 
     * @param addressId 设备位置的信息ID
     * @return 设备位置的信息
     */
    @Override
    public Address selectAddressById(Long addressId)
    {
        return addressMapper.selectAddressById(addressId);
    }

    @Override
    public ArrayList<String> selectAddressNameList(){
        return addressMapper.selectAddressNameList();
    }
    /**
     * 查询设备位置的信息列表
     * 
     * @param address 设备位置的信息
     * @return 设备位置的信息
     */
    @Override
    public List<Address> selectAddressList(Address address)
    {
        return addressMapper.selectAddressList(address);
    }

    /**
     * 新增设备位置的信息
     * 
     * @param address 设备位置的信息
     * @return 结果
     */
    @Override
    public int insertAddress(Address address)
    {
        address.setCreateTime(DateUtils.getNowDate());
        return addressMapper.insertAddress(address);
    }

    /**
     * 修改设备位置的信息
     * 
     * @param address 设备位置的信息
     * @return 结果
     */
    @Override
    public int updateAddress(Address address)
    {
        return addressMapper.updateAddress(address);
    }

    /**
     * 删除设备位置的信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteAddressByIds(String ids)
    {
        return addressMapper.deleteAddressByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除设备位置的信息信息
     * 
     * @param addressId 设备位置的信息ID
     * @return 结果
     */
    @Override
    public int deleteAddressById(Long addressId)
    {
        return addressMapper.deleteAddressById(addressId);
    }

    /**
     * 查询设备位置的信息树列表
     * 
     * @return 所有设备位置的信息信息
     */
    @Override
    public List<Ztree> selectAddressTree()
    {
        List<Address> addressList = addressMapper.selectAddressList(new Address());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (Address address : addressList)
        {
            Ztree ztree = new Ztree();
            ztree.setId(address.getAddressId());
            ztree.setpId(address.getParentId());
            ztree.setName(address.getAddressName());
            ztree.setTitle(address.getAddressName());
            ztrees.add(ztree);
        }
        return ztrees;
    }
}
