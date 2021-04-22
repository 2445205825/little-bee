package com.jeethink;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * 调试内存：
 * 生成dump文件：-Xms10m -Xmx80m -XX:+HeapDumpOnOutOfMemoryError 使用jprofiler
 * 查看内存分配：-Xms10m -Xmx80m -XX:+PrintGCDetails
 *
 * @author jeethink
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class JeeThinkApplication
{
    public static void main(String[] args)
    {
        long maxMemory = Runtime.getRuntime().maxMemory()/1024/1024;
        long currentMemory = Runtime.getRuntime().totalMemory()/1024/1024;
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(JeeThinkApplication.class, args);
        System.out.println("系统启动成功！\t 当前申请的最大内存为：" + maxMemory + "M, 初始化内存为：" + currentMemory + "M");

    }
}