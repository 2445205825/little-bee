package com.jeethink.project.business.reportMonth.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.reportMonth.mapper.ReportmonthMapper;
import com.jeethink.project.business.reportMonth.domain.Reportmonth;
import com.jeethink.project.business.reportMonth.service.IReportmonthService;
import com.jeethink.common.utils.text.Convert;

/**
 * 维修月报Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-31
 */
@Service
public class ReportmonthServiceImpl implements IReportmonthService 
{
    @Autowired
    private ReportmonthMapper reportmonthMapper;

    /**
     * 查询维修月报
     * 
     * @param reportId 维修月报ID
     * @return 维修月报
     */
    @Override
    public Reportmonth selectReportmonthById(Long reportId)
    {
        return reportmonthMapper.selectReportmonthById(reportId);
    }

    /**
     * 查询维修月报列表
     * 
     * @param reportmonth 维修月报
     * @return 维修月报
     */
    @Override
    public List<Reportmonth> selectReportmonthList(Reportmonth reportmonth)
    {
        return reportmonthMapper.selectReportmonthList(reportmonth);
    }

    /**
     * 新增维修月报
     * 
     * @param reportmonth 维修月报
     * @return 结果
     */
    @Override
    public int insertReportmonth(Reportmonth reportmonth)
    {
        return reportmonthMapper.insertReportmonth(reportmonth);
    }

    /**
     * 修改维修月报
     * 
     * @param reportmonth 维修月报
     * @return 结果
     */
    @Override
    public int updateReportmonth(Reportmonth reportmonth)
    {
        return reportmonthMapper.updateReportmonth(reportmonth);
    }

    /**
     * 删除维修月报对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteReportmonthByIds(String ids)
    {
        return reportmonthMapper.deleteReportmonthByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修月报信息
     * 
     * @param reportId 维修月报ID
     * @return 结果
     */
    @Override
    public int deleteReportmonthById(Long reportId)
    {
        return reportmonthMapper.deleteReportmonthById(reportId);
    }
}
