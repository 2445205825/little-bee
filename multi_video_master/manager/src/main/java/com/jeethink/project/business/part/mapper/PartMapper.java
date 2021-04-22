package com.jeethink.project.business.part.mapper;

import java.util.ArrayList;
import java.util.List;
import com.jeethink.project.business.part.domain.Part;

/**
 * 备件信息Mapper接口
 * 
 * @author hanbin
 * @date 2021-01-27
 */
public interface PartMapper 
{
    /**
     * 查询备件信息
     * 
     * @param partId 备件信息ID
     * @return 备件信息
     */
    public Part selectPartById(Long partId);

    /**
     * 查询备件信息列表
     * 
     * @param part 备件信息
     * @return 备件信息集合
     */
    public List<Part> selectPartList(Part part);

    /**
     * 补充，提供下拉列表
     * @return
     */
    public ArrayList<String> selectPartNameList();

    /**
     * 新增备件信息
     * 
     * @param part 备件信息
     * @return 结果
     */
    public int insertPart(Part part);

    /**
     * 修改备件信息
     * 
     * @param part 备件信息
     * @return 结果
     */
    public int updatePart(Part part);

    /**
     * 删除备件信息
     * 
     * @param partId 备件信息ID
     * @return 结果
     */
    public int deletePartById(Long partId);

    /**
     * 批量删除备件信息
     * 
     * @param partIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePartByIds(String[] partIds);
}
