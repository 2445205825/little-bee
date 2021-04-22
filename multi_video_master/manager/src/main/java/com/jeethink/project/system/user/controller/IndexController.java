package com.jeethink.project.system.user.controller;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.jeethink.project.business.reportDay.domain.ReportDay;
import com.jeethink.project.business.reportDay.service.IReportDayService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jeethink.common.utils.CookieUtils;
import com.jeethink.common.utils.DateUtils;
import com.jeethink.common.utils.ServletUtils;
import com.jeethink.common.utils.StringUtils;
import com.jeethink.common.utils.text.Convert;
import com.jeethink.framework.config.JeeThinkConfig;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.project.system.config.service.IConfigService;
import com.jeethink.project.system.menu.domain.Menu;
import com.jeethink.project.system.menu.service.IMenuService;
import com.jeethink.project.system.user.domain.User;

/**
 * 首页 业务处理
 * 
 * @author jeethink  
 */
@Controller
public class IndexController extends BaseController
{
    @Autowired
    private IMenuService menuService;

    @Autowired
    private IConfigService configService;

    @Autowired
    private JeeThinkConfig jeeThinkConfig;

    @Autowired
    private IReportDayService reportDayService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        User user = getSysUser();
        // 根据用户id取出菜单
        List<Menu> menus = menuService.selectMenusByUser(user);

        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        mmap.put("ignoreFooter", configService.selectConfigByKey("sys.index.ignoreFooter"));
        mmap.put("copyrightYear", jeeThinkConfig.getCopyrightYear());
        mmap.put("demoEnabled", jeeThinkConfig.isDemoEnabled());
        mmap.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        mmap.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));

        //系统参数读取，edit by hanbin 2021年1月15日
        mmap.put("name",jeeThinkConfig.getName());
        mmap.put("version", jeeThinkConfig.getVersion());
        mmap.put("productorNike",jeeThinkConfig.getProductorNike());
        mmap.put("productorName",jeeThinkConfig.getProductorName());

        // 菜单导航显示风格
        String menuStyle = configService.selectConfigByKey("sys.index.menuStyle");
        // 移动端，默认使左侧导航菜单，否则取默认配置
        String indexStyle = ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")) ? "index" : menuStyle;
        
        // 优先Cookie配置导航菜单
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        for (Cookie cookie : cookies)
        {
            if (StringUtils.isNotEmpty(cookie.getName()) && "nav-style".equalsIgnoreCase(cookie.getName()))
            {
                indexStyle = cookie.getValue();
                break;
            }
        }
        String webIndex = "topnav".equalsIgnoreCase(indexStyle) ? "index-topnav" : "index";


        return webIndex;
    }

    // 切换主题
    @GetMapping("/system/switchSkin")
    public String switchSkin()
    {
        return "skin";
    }

    // 切换菜单
    @GetMapping("/system/menuStyle/{style}")
    public void menuStyle(@PathVariable String style, HttpServletResponse response)
    {
        CookieUtils.setCookie(response, "nav-style", style);
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        //需要读取首页面板数据，待补充 edit by hanbin 2021年1月15日
        /*获取第一行的任务数据*/
        ReportDay reportDay = new ReportDay();
        reportDayService.getMainData(reportDay,mmap);

        /*获取图表*/
        reportDayService.getChartList(reportDay,mmap);

        /*图表右侧数据*/
        reportDayService.getChartData(reportDay,mmap);

        /*获取列表*/
        reportDayService.getMainList(reportDay, mmap);

        return "main";
    }
    
    // 检查初始密码是否提醒修改
    public boolean initPasswordIsModify(Date pwdUpdateDate)
    {
        int initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify == 1 && pwdUpdateDate == null;
    }
    
    // 检查密码是否过期
    public boolean passwordIsExpiration(Date pwdUpdateDate)
    {
        int passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays > 0)
        {
            if (StringUtils.isNull(pwdUpdateDate))
            {
                // 如果从未修改过初始密码，直接提醒过期
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }
}
