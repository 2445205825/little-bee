package com.jeethink.project.monitor.job.task;

import com.jeethink.project.business.checkItems.domain.CheckItems;
import com.jeethink.project.business.checkItems.service.ICheckItemsService;
import com.jeethink.project.business.pointPartMap.domain.PointPartMap;
import com.jeethink.project.business.pointPartMap.service.IPointPartMapService;
import com.jeethink.project.business.reportDay.domain.ReportDay;
import com.jeethink.project.business.reportDay.service.IReportDayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 定时任务调度：日报生成
 *
 * @author hanbin
 * @date 2021年1月30日
 */
@Component("RyTaskDay")
public class RyTaskDay {

    /*生成日报表*/
    @Autowired
    private IReportDayService reportDayService;

    @Autowired
    private ICheckItemsService checkItemsService;

    @Autowired
    private IPointPartMapService pointPartMapService;

    /*生成日报表*/
    public void ryReportDay()
    {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date currentDate = new Date();
        Date tempDate = new Date();
        Integer compLimit = 0;

        ReportDay reportDay= new ReportDay();
        CheckItems checkItems = new CheckItems();
        Long dateInterval = 0L;
        Long maxValue = 1L;                                             /*避免除数为0*/

        /*查询当前设定，筛查满足条件的记录*/
        List<CheckItems> checkItemsList = checkItemsService.selectCheckItemsList(checkItems);
        PointPartMap pointPartMap =new PointPartMap();

        Date startDate = new Date();
        Date endDate = new Date();
        String itemStatus = new String();
        String computLimit = new String();
        String realTimeFlag = new String();
        String checkType = new String();

        if (checkItemsList != null) {
            for (int i = 0; i < checkItemsList.size(); i++) {
                startDate = checkItemsList.get(i).getStartDate();
                endDate = checkItemsList.get(i).getEndDate();
                itemStatus = checkItemsList.get(i).getStatus();
                computLimit = checkItemsList.get(i).getComputLimit();
                maxValue = checkItemsList.get(i).getMaxValue().longValue();
                realTimeFlag = checkItemsList.get(i).getRealtimeType();
                checkType = checkItemsList.get(i).getCheckType();

                /*为了提升效率，需要按照下列步骤进行统计：
                * (1)对抽取的list数据的有效性验证；
                * (2)对按照时间长度（日期）进行的日报要求的数据进行提取；
                * (3)对符合时间日期间隔的数据进行提取；
                * (4)对大于、等于、小于的数据进行计算；
                * (5)完成入库操作。
                *
                * 需要注意的是：日期的间隔计算需要使用format，同时Date类型有线程风险，其他地方尽可能的少用Date类型
                * dateFormat.parse需要使用try...catch
                * * */
                /*状态正常，非实时性，日期区间符合要求*/
                    if (itemStatus.equals("0") && realTimeFlag.equals("1") && currentDate.compareTo(startDate)>=0 && currentDate.compareTo(endDate)<=0) {
                    /*计时日报*/
                    if (checkType.equals("2") == true) {
                        try {
                            currentDate = dateFormat.parse(dateFormat.format(currentDate));
                            tempDate = dateFormat.parse(dateFormat.format(startDate));
                            dateInterval = currentDate.getTime()/(1000 * 3600 * 24) - tempDate.getTime()/(1000 * 3600 * 24);

//                            if(dateInterval/maxValue == dateInterval * 1.0/maxValue)
                            if(dateInterval % maxValue == 0)
                            {
                                /*1:等于 ，2：大于，5：大于等于*/
                                if (computLimit.equals("1") || computLimit.equals("2") || computLimit.equals("5"))
                                {
                                    reportDay.setCheckName(checkItemsList.get(i).getCheckName());
                                    pointPartMap.setCheckName(checkItemsList.get(i).getCheckName());

                                    if(pointPartMap != null) {
                                        List<PointPartMap> pointPartMaps = pointPartMapService.selectPointPartMapList(pointPartMap);

                                        /**
                                         * 必须满足配件表有对应的配件信息才行，否则不能生成日报
                                         */
                                        if (pointPartMaps.size() > 0 ) {
                                            System.out.println("step 2 ....");
                                            reportDay.setPartName(pointPartMaps.get(0).getPartName());
                                            reportDay.setPartItem(pointPartMaps.get(0).getPartItem());
                                            reportDay.setUnitName(pointPartMaps.get(0).getUnitName());
                                            System.out.println("step 3 ....");
                                        } else {
                                            reportDay.setPartName("未指定配件信息...");
                                            reportDay.setPartItem("未指定配件信息...");
                                            reportDay.setUnitName("未指定配件信息...");
                                        }
                                    }
                                    else {
                                        reportDay.setPartName("未指定配件信息...");
                                        reportDay.setPartItem("未指定配件信息...");
                                        reportDay.setUnitName("未指定配件信息...");
                                    }
                                    reportDay.setPartCount(0L);
                                    reportDay.setCreateBy("SYSTEM");
                                    reportDay.setCreateDate(currentDate);
                                    reportDay.setComment("系统自动生成");
                                    reportDayService.insertReportDay(reportDay);
                                }
                            }

                        }
                        catch (Exception e)
                        {
                            System.out.println("=======似乎是没有指定配件信息的错误，请联系系统管理员==========" + e.toString());
                        }

                    }
                    /*计次日报*/
                    else if(checkType.equals("1") == true)
                    {
                        /*待补充*/
                    }
                }
            }
        }
    }
}
