package com.jeethink.project.business.part.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.part.mapper.PartMapper;
import com.jeethink.project.business.part.domain.Part;
import com.jeethink.project.business.part.service.IPartService;
import com.jeethink.common.utils.text.Convert;

/**
 * 备件信息Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-27
 */
@Service
public class PartServiceImpl implements IPartService 
{
    @Autowired
    private PartMapper partMapper;

    /**
     * 查询备件信息
     * 
     * @param partId 备件信息ID
     * @return 备件信息
     */
    @Override
    public Part selectPartById(Long partId)
    {
        return partMapper.selectPartById(partId);
    }

    @Override
    public ArrayList<String> selectPartNameList(){
        return partMapper.selectPartNameList();
    }
    /**
     * 查询备件信息列表
     * 
     * @param part 备件信息
     * @return 备件信息
     */
    @Override
    public List<Part> selectPartList(Part part)
    {
        return partMapper.selectPartList(part);
    }

    /**
     * 新增备件信息
     * 
     * @param part 备件信息
     * @return 结果
     */
    @Override
    public int insertPart(Part part)
    {
        part.setCreateTime(DateUtils.getNowDate());
        return partMapper.insertPart(part);
    }

    /**
     * 修改备件信息
     * 
     * @param part 备件信息
     * @return 结果
     */
    @Override
    public int updatePart(Part part)
    {
        return partMapper.updatePart(part);
    }

    /**
     * 删除备件信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePartByIds(String ids)
    {
        return partMapper.deletePartByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除备件信息信息
     * 
     * @param partId 备件信息ID
     * @return 结果
     */
    @Override
    public int deletePartById(Long partId)
    {
        return partMapper.deletePartById(partId);
    }
}
