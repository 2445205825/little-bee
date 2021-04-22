package com.jeethink.project.business.reportMonth.service;

import java.util.List;
import com.jeethink.project.business.reportMonth.domain.Reportmonth;

/**
 * 维修月报Service接口
 * 
 * @author hanbin
 * @date 2021-01-31
 */
public interface IReportmonthService 
{
    /**
     * 查询维修月报
     * 
     * @param reportId 维修月报ID
     * @return 维修月报
     */
    public Reportmonth selectReportmonthById(Long reportId);

    /**
     * 查询维修月报列表
     * 
     * @param reportmonth 维修月报
     * @return 维修月报集合
     */
    public List<Reportmonth> selectReportmonthList(Reportmonth reportmonth);

    /**
     * 新增维修月报
     * 
     * @param reportmonth 维修月报
     * @return 结果
     */
    public int insertReportmonth(Reportmonth reportmonth);

    /**
     * 修改维修月报
     * 
     * @param reportmonth 维修月报
     * @return 结果
     */
    public int updateReportmonth(Reportmonth reportmonth);

    /**
     * 批量删除维修月报
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteReportmonthByIds(String ids);

    /**
     * 删除维修月报信息
     * 
     * @param reportId 维修月报ID
     * @return 结果
     */
    public int deleteReportmonthById(Long reportId);
}
