package com.jeethink.project.system.video.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.jeethink.common.utils.file.FileUploadUtils;
import com.jeethink.framework.config.JeeThinkConfig;
import com.jeethink.project.business.behavior.domain.SysAnimalBehavior;
import com.jeethink.project.business.behavior.service.ISysAnimalBehaviorService;
import com.jeethink.project.system.user.domain.User;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.jeethink.framework.aspectj.lang.annotation.Log;
import com.jeethink.framework.aspectj.lang.enums.BusinessType;
import com.jeethink.project.system.video.domain.Video;
import com.jeethink.project.system.video.service.IVideoService;
import com.jeethink.framework.web.controller.BaseController;
import com.jeethink.framework.web.domain.AjaxResult;
import com.jeethink.common.utils.poi.ExcelUtil;
import com.jeethink.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;




/**
 * 视频管理Controller
 *
 * @author lcy
 * @date 2021-04-14
 */
@Controller
@RequestMapping("/system/video")
public class VideoController extends BaseController
{
    private String prefix = "system/video";

    @Autowired
    private ISysAnimalBehaviorService animalBehavior;

    @Autowired
    private IVideoService videoService;

    @RequiresPermissions("system:video:view")
    @GetMapping()
    public String video()
    {
        return prefix + "/video";
    }

    /**
     * 查询视频管理列表
     */
    @RequiresPermissions("system:video:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Video video)
    {
        startPage();
        List<Video> list = videoService.selectVideoList(video);
        return getDataTable(list);
    }

    /**
     * 导出视频管理列表
     */
    @RequiresPermissions("system:video:export")
    @Log(title = "视频管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Video video)
    {
        List<Video> list = videoService.selectVideoList(video);
        ExcelUtil<Video> util = new ExcelUtil<Video>(Video.class);
        return util.exportExcel(list, "video");
    }

    /**
     * 新增视频管理
     */
    @GetMapping("/add")
    public String add(SysAnimalBehavior sysAnimalBehavior,ModelMap map)
    {
        List<SysAnimalBehavior> list = animalBehavior.selectSysAnimalBehaviorList(sysAnimalBehavior);
        map.put("sysAnimalBehaviors",list);
        return prefix + "/add";
    }
/******************************************************************************************/
    /**
     * 新增保存视频管理
     */
    @RequiresPermissions("system:video:add")
    @Log(title = "视频管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Video video, @RequestParam("file") MultipartFile[] file) throws IOException {
        int sum=0,i=0;
        for (MultipartFile multipartFile : file) {
            if (file.length<2){
                String filePath = JeeThinkConfig.getUploadPath();
                String filePathName = FileUploadUtils.upload(filePath, file[sum]);
                video.setVideoUrl(filePathName);
                utils(video);
                return toAjax(videoService.insertVideo(video));
            }else{
                String originalFilename = multipartFile.getOriginalFilename();
                String[] split = originalFilename.split("\\.");
                video.setVideoName(split[0]);
                utils(video);
                String filePath = JeeThinkConfig.getUploadPath();
                String filePathName = FileUploadUtils.upload(filePath, file[sum]);
                video.setVideoUrl(filePathName);
                i = videoService.insertVideo(video);
                sum += i;
            }
        }
        return toAjax(sum == file.length);
    }

    public  void utils(Video video){
        User sysUser = getSysUser();
        video.setCreateBy(sysUser.getLoginName());
        video.setCreateTime(new Date());
    }
/*******************************************************************************************/


    /**
     * 修改视频管理
     */
    @GetMapping("/edit/{videoId}")
    public String edit(@PathVariable("videoId") Long videoId, ModelMap mmap,SysAnimalBehavior sysAnimalBehavior)
    {
        List<SysAnimalBehavior> list = animalBehavior.selectSysAnimalBehaviorList(sysAnimalBehavior);
        mmap.put("sysAnimalBehaviors",list);

        Video video = videoService.selectVideoById(videoId);
        mmap.put("video", video);
        return prefix + "/edit";
    }
/*******************************************************************************************/
    /**
     * 修改保存视频管理
     */
    @RequiresPermissions("system:video:edit")
    @Log(title = "视频管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Video video)
    {
        User sysUser = getSysUser();
        video.setUpdateBy(sysUser.getLoginName());
        return toAjax(videoService.updateVideo(video));
    }
/*******************************************************************************************/

    /**
     * 删除视频管理
     */
    @RequiresPermissions("system:video:remove")
    @Log(title = "视频管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(videoService.deleteVideoByIds(ids));
    }

    /**
     * 视频详情页面
     * */
    @RequiresPermissions("system:video:video_list")
    @RequestMapping("/v_list")
    public String video_Lists(ModelMap map,Video video){

        List<Video> list = videoService.selectVideoList(video);
        map.put("videoList",list);
        return prefix + "/video_list";
    }


    /**
     * 视频搜索页面,先暂时这样写
     * */
    @RequiresPermissions("system:video:video_list")
    @RequestMapping("/v_list2")
    public String video_search(ModelMap map,Video video,String videoName){

        List<Video> list = videoService.selectVideoList(video);
        Iterator<Video> iterator = list.iterator();
        while(iterator.hasNext()){
            Video video1 = iterator.next();
            if (video1.getVideoName().equals(videoName)){
                map.put("videoList",video1);
                break;
            }
        }
        return prefix + "/video_list";
    }

    /**
     * 修改标注
     * */
  /*  @RequiresPermissions("system:video:video_list")
    @RequestMapping("/v_list_remark")
    public String changeRemark(ModelMap map,Video video,@RequestBody String btnSelected,@RequestBody String videoName){
        System.out.println(btnSelected);
        List<Video> list = videoService.selectVideoList(video);
        List<Video> list2 = null;
        Iterator<Video> iterator = list.iterator();
        while(iterator.hasNext()){
            Video video1 = iterator.next();
            if (video1.getRemark().equals(videoName)){
                video1.setRemark(btnSelected);
                list2.add(video1);
            }else
                list2.add(video1);
        }
        map.put("videoList",list2);
        return prefix + "/video_list";
    }*/


    /**
     * 视频预览
     * */
    @RequiresPermissions("system:video:video_watch")
    @RequestMapping("/video_watch/{videoId}")
    public String video_watch(ModelMap map,@PathVariable("videoId") Long videoId){
        Video video = videoService.selectVideoById(videoId);
        map.put("videoList",video);
        return prefix + "/videoView";
    }
}
