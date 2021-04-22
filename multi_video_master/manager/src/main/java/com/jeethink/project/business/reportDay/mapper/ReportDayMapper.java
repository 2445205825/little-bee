package com.jeethink.project.business.reportDay.mapper;

import java.util.List;

import com.jeethink.project.business.reportDay.domain.ReportDay;

/**
 * 日报表Mapper接口
 * 
 * @author hanbin
 * @date 2021-01-29
 */
public interface ReportDayMapper 
{
    /**
     * 查询日报表
     * 
     * @param reportId 日报表ID
     * @return 日报表
     */
    public ReportDay selectReportDayById(Long reportId);

    /**
     * 查询日报表列表
     * 
     * @param reportDay 日报表
     * @return 日报表集合
     */
    public List<ReportDay> selectReportDayList(ReportDay reportDay);

    /**
     * 新增日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    public int insertReportDay(ReportDay reportDay);

    /**
     * 取最大编号*/
    public Long selectMaxReport();

    /**
     * 修改日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    public int updateReportDay(ReportDay reportDay);

    /**
     * 删除日报表
     * 
     * @param reportId 日报表ID
     * @return 结果
     */
    public int deleteReportDayById(Long reportId);

    /**
     * 批量删除日报表
     * 
     * @param reportIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteReportDayByIds(String[] reportIds);
}
