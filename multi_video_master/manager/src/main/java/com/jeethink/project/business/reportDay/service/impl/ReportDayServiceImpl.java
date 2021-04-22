package com.jeethink.project.business.reportDay.service.impl;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeethink.project.business.reportDay.mapper.ReportDayMapper;
import com.jeethink.project.business.reportDay.domain.ReportDay;
import com.jeethink.project.business.reportDay.service.IReportDayService;
import com.jeethink.common.utils.text.Convert;
import org.springframework.ui.ModelMap;

/**
 * 日报表Service业务层处理
 * 
 * @author hanbin
 * @date 2021-01-29
 */
@Service
public class ReportDayServiceImpl implements IReportDayService 
{
    @Autowired
    private ReportDayMapper reportDayMapper;

    @Autowired
    private  IReportDayService reportDayService;

    /**
     * 查询日报表
     * 
     * @param reportId 日报表ID
     * @return 日报表
     */
    @Override
    public ReportDay selectReportDayById(Long reportId)
    {
        return reportDayMapper.selectReportDayById(reportId);
    }

    /**
     * 查询日报表列表
     * 
     * @param reportDay 日报表
     * @return 日报表
     */
    @Override
    public List<ReportDay> selectReportDayList(ReportDay reportDay)
    {
        return reportDayMapper.selectReportDayList(reportDay);
    }


    /**
     * 取最大编号*/
    @Override
    public Long selectMaxReport()
    {
        return reportDayMapper.selectMaxReport();
    }

    /**
     * 新增日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    @Override
    public int insertReportDay(ReportDay reportDay)
    {
        return reportDayMapper.insertReportDay(reportDay);
    }

    /**
     * 修改日报表
     * 
     * @param reportDay 日报表
     * @return 结果
     */
    @Override
    public int updateReportDay(ReportDay reportDay)
    {
        return reportDayMapper.updateReportDay(reportDay);
    }

    /**
     * 删除日报表对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteReportDayByIds(String ids)
    {
        return reportDayMapper.deleteReportDayByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除日报表信息
     * 
     * @param reportId 日报表ID
     * @return 结果
     */
    @Override
    public int deleteReportDayById(Long reportId)
    {
        return reportDayMapper.deleteReportDayById(reportId);
    }

    /**
     * @author hanbin
     * @return 维修任务数
     */
    @Override
    public int selectTodayTaskCount(ReportDay reportDay,Integer itype)
    {
        Integer taskCount = 0;
        String currentDateYear = new String();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        HashMap<String,Object> paramsMap = new HashMap<String, Object>();

        Calendar currentDate = Calendar.getInstance();
        currentDate.setTime(new Date());

        if (itype <=2 ) {
            paramsMap.put("beginStartDate", df.format(currentDate.getTime()));
            paramsMap.put("endStartDate", df.format(currentDate.getTime()));
        }
        else if(itype == 3){
            paramsMap.put("endStartDate", df.format(currentDate.getTime()));
            currentDate.set(Calendar.DAY_OF_MONTH, 1);

            paramsMap.put("beginStartDate", df.format(currentDate.getTime()));
        }
        else{
            paramsMap.put("beginStartDate", String.valueOf(currentDate.get(currentDate.YEAR)+"-01-01"));
            paramsMap.put("endStartDate", df.format(currentDate.getTime()));
        }

        reportDay.setParams(paramsMap);
        List<ReportDay> reportDays = reportDayMapper.selectReportDayList(reportDay);

        if (itype == 2) {
            for (int i = 0; i < reportDays.size(); i++) {
                if (reportDays.get(i).getDealTime() == null) {
                    taskCount++;
                }
            }
        }
        else{
            taskCount = reportDays.size();
        }

        return taskCount;
    }

    /**
     * 获取主页中的第一行的数据
     * @param
     * @param mmap
     */
    @Override
    public void getMainData(ReportDay reportDay, ModelMap mmap)
    {
        //需要读取首页面板数据，待补充 edit by hanbin 2021年1月15日
        int todayTasksum = reportDayService.selectTodayTaskCount(reportDay,1);
        mmap.put("todayTasksum",todayTasksum);

        int todayNoTaskCount = reportDayService.selectTodayTaskCount(reportDay,2);
        mmap.put("todayNoTaskCount",todayNoTaskCount);

        int curMonthTask = reportDayService.selectTodayTaskCount(reportDay,3);
        mmap.put("curMonthTask",curMonthTask);

        int curYearTask = reportDayService.selectTodayTaskCount(reportDay,4);
        mmap.put("curYearTask",curYearTask);

        /*求比值*/
        /*全年完成量*/
        DecimalFormat df = new DecimalFormat("0.00");

        String currYearFinishRatio = "0";
        String currMonthFinishRatio = "0";
        String currTodayFinishRatio = "0";
        String currTodayNoFinishRatio = "0";
        float temp = 0;

        if (curYearTask != 0) {
            temp = ((float) curYearTask - (float) todayTasksum) / (float) curYearTask * 100;
            currYearFinishRatio = df.format(temp);
        }

        if(curMonthTask != 0){
            temp =  ((float) curMonthTask - (float)todayTasksum) / (float) curMonthTask * 100;
            currMonthFinishRatio = df.format(temp);
        }

        if (todayTasksum != 0) {
            temp = ((float) todayNoTaskCount - (float)todayNoTaskCount) /(float) todayTasksum * 100;
            currTodayFinishRatio = df.format(temp);
        }

        if((todayNoTaskCount - todayNoTaskCount) != 0) {
            temp = ((float) todayNoTaskCount) /(float) (todayNoTaskCount -(float) todayNoTaskCount) * 100;
            currTodayNoFinishRatio = df.format(temp);
        }

        mmap.put("currYearFinishRatio",currYearFinishRatio);
        mmap.put("currMonthFinishRatio",currMonthFinishRatio);
        mmap.put("currTodayFinishRatio",currTodayFinishRatio);
        mmap.put("currTodayNoFinishRatio",currTodayNoFinishRatio);
    }

    /**
     * 获取第三行的列表数据
     * @param reportDay
     * @param mmap
     */
    @Override
    public void getMainList(ReportDay reportDay,ModelMap mmap)
    {
        Date currentDate = new Date();
        Map<String,Object> params = new HashMap<String,Object>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        params.put("beginStartDate",df.format(currentDate.getTime()));
        params.put("endStartDate",df.format(currentDate.getTime()));

        reportDay.setParams(params);
        reportDay.setDealTime(currentDate);
        reportDay.setCreateTime(currentDate);
        List<ReportDay> reportDays = reportDayService.selectReportDayList(reportDay);

        List<ReportDay> retReportList = new ArrayList<>();

        if (retReportList != null ) {
            for (int i = reportDays.size(); i >= 1; i--) {
                retReportList.add(reportDays.get(i-1));
            }

            mmap.put("reportList",retReportList);
        }
    }

    /*主页第二行右侧数据*/
    @Override
    public void getChartData(ReportDay reportDay,ModelMap mmap)
    {
        List<ReportDay> reportDays = reportDayService.selectReportDayList(reportDay);

        int taskSum = reportDays.size();
        Long partSum = 0L;
        int taskCompleteSum = 0;

        if (taskSum > 0) {
            for (int i = 0; i < reportDays.size(); i++) {
                partSum = partSum + reportDays.get(i).getPartCount();
                if (reportDays.get(i).getRequireTime() != null) {
                    taskCompleteSum++;
                }
            }
        }

        mmap.put("taskSum",taskSum);
        mmap.put("partSum",partSum);
        mmap.put("taskCompleteSum",taskCompleteSum);
    }

    /*主页第二行左侧*/
    @Override
    public void getChartList(ReportDay reportDay,ModelMap mmap) {

        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String tempDate = "";
        List<String> xDateList = new ArrayList<>();
        Long tempCount = 0L;
        Integer tempDepartCount = 0;
        List<Integer> yDepartCount = new ArrayList<>();
        List<Long> yCountList = new ArrayList<>();

        /*获取最后15个数据*/
        Integer showCount = 15;

        List<ReportDay> reportDaysList = reportDayService.selectReportDayList(new ReportDay());
        for (int i = 0; i < reportDaysList.size(); i++) {
            if (i == 0) {
                tempDate = dateFormat.format(reportDaysList.get(i).getCreateDate());
                tempCount = reportDaysList.get(i).getPartCount();
                tempDepartCount = 1;
            }
            else {
                if (i < (reportDaysList.size()-1)) {
                    if (tempDate.equals(dateFormat.format(reportDaysList.get(i).getCreateDate()))) {
                        tempCount = tempCount + reportDaysList.get(i).getPartCount();
                        tempDepartCount++;
                    } else {
                        /*完成一组*/
                        yCountList.add(tempCount);
                        xDateList.add(tempDate);
                        yDepartCount.add(tempDepartCount);

                        /*更新*/
                        tempCount = reportDaysList.get(i).getPartCount();;
                        tempDepartCount = 1;
                        tempDate = dateFormat.format(reportDaysList.get(i).getCreateDate());
                    }
                }
                if(i == (reportDaysList.size()-1))
                {
                    if (tempDate.equals(dateFormat.format(reportDaysList.get(i).getCreateDate()))) {
                        xDateList.add(tempDate);
                        yCountList.add(tempCount + reportDaysList.get(i).getPartCount());
                        yDepartCount.add(tempDepartCount + 1);
                    }
                    else {
                        xDateList.add(dateFormat.format(reportDaysList.get(i).getCreateDate()));
                        yCountList.add(reportDaysList.get(i).getPartCount());
                        yDepartCount.add(1);
                    }
                }
            }
        }

        /*取最后showCount条的记录*/
        if (xDateList.size() <= showCount) {
            mmap.put("xDateList", xDateList);
            mmap.put("yCountList", yCountList);
            mmap.put("yDepartCount", yDepartCount);
        } else {
            mmap.put("xDateList", xDateList.subList(xDateList.size() - showCount, xDateList.size()));
            mmap.put("yCountList", yCountList.subList(xDateList.size() - showCount, xDateList.size()));
            mmap.put("yDepartCount", yDepartCount.subList(xDateList.size() - showCount, xDateList.size()));
        }
    }
}
