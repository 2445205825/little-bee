package com.jeethink.project.business.reportDay.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.jeethink.project.business.reportDay.domain.ReportDay;
import org.springframework.ui.ModelMap;

/**
 * 日报表Service接口
 * 
 * @author hanbin
 * @date 2021-01-29
 */
public interface IReportDayService 
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
     * 取最大编号*/
    public Long selectMaxReport();


    /**
     * 新增日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    public int insertReportDay(ReportDay reportDay);

    /**
     * 修改日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    public int updateReportDay(ReportDay reportDay);

    /**
     * 批量删除日报表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteReportDayByIds(String ids);

    /**
     * 删除日报表信息
     * 
     * @param reportId 日报表ID
     * @return 结果
     */
    public int deleteReportDayById(Long reportId);

    /**
     * @author hanbin
     * @return 维修任务数
     */
    public int selectTodayTaskCount(ReportDay reportDay,Integer itype);

    public void getMainData(ReportDay reportDay, ModelMap mmmap);

    public void getMainList(ReportDay reportDay,ModelMap mmap);

    public void getChartData(ReportDay reportDay,ModelMap mmap);

    public void getChartList(ReportDay reportDay,ModelMap mmap);
}
