/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;


public class StringResource implements Serializable {

    /**
     * 短经纪人分享需要绑定的数据key
     */
    public static String SHORT_JINGJIREN_SHARE_VALUE = "?staffno=%s";

    /**
     * 长经纪人分享需要绑定的数据key
     */
    public static String LONG_JINGJIREN_SHARE_VALUE = "?staffno=%s&from=%s";

    /**
     * 短经纪人存储key
     */
    public static String SHORT_JINGJIREN_SHARE_KEY = "shortJingJiRenShareKey";

    /**
     * 长经纪人存储key
     */
    public static String LONG_JINGJIREN_SHARE_KEY = "longJingJiRenShareKey";

    /**
     * 长经纪人是否安装应用绑定数据key
     */
    public static String IS_APP_INSTALLED_LONG_JINGJIREN_SHARE_VALUE = "?staffno=%s&from=%s&isappinstalled=%s";

    /**
     * 长经纪人是否安装应用存储key
     */
    public static String IS_APP_INSTALLED_LONG_JINGJIREN_SHARE_KEY = "isAppInstalledLongJingJiRenShareKey";

    /**
     *
     * @param input 需要处理的字符串
     * @param substring 通过什么字符进行分割
     * @return 获取substring的索引位置
     */
    public static int lastIndexOf(String input, String substring) {
        if (input == null) input = "";
        if (substring == null) substring = "";
        return input.lastIndexOf(substring);
    }

}
