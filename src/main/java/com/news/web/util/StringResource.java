/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("all")
public class StringResource implements Serializable {

    /**
     * 经纪人信息需要存储的参数
     */
    public static String JINGJIREN_SHARE_VALUE = "?%s";

    /**
     * 经纪人存储key
     */
    public static String JINGJIREN_SHARE_KEY = "jingJiRenShareKey";

    public static final String NEWS = "news";
    public static final String CK_USER = "ck_user";
    public static final String CK_USER_WAP = "ck_user_wap";
    public static final String BIG_U = "U";
    public static final String AND = "&";
    public static final String COOKIE_NAME = "Y190cmFja2lk";
    public static final String WINDOWS = "Windows";
    public static final String INTEL_MAC_OS = "Intel Mac OS";
    public static final String PC = "pc";
    public static final String LIKE_MAC_OS = "like Mac OS";
    public static final String ANDROID = "Android";
    public static final String SALE_HOUSE = "salehouse";
    public static final String APP_IOS = "APP_IOS";
    public static final String APP_ANDROID = "APP_ANDROID";
    public static final String MICRO_MESSENGER = "MicroMessenger";
    public static final String WE_CHAT = "WeChat";
    public static final String WAP = "WAP";
    public static final String USER_AGENT = "user-agent";
    public static final String INSERT_VIEW_HISTORY_REQUEST_BY_RABBIT = "%sInsertViewHistoryRequestByRabbit";


    /**
     * 根据城市缩写获取城市代码
     * @param ：城市拼音缩写
     * return:城市代码
     * */
    public static String getCityCode(String cityShort) {
        Map<String, String> map = new HashMap<>();
        map.put("bj", "010");
        map.put("tj", "022");
        map.put("gz", "020");
        map.put("sz", "0755");
        map.put("cd", "028");
        map.put("cq", "023");
        map.put("nj", "025");
        map.put("wh", "027");
        map.put("hz", "0752");
        map.put("cc", "0431");
        map.put("dl", "0411");
        map.put("sy", "024");
        map.put("dg", "0769");
        map.put("nn", "0771");
        map.put("fs", "0757");
        map.put("hrb", "0451");
        map.put("xm", "0592");
        map.put("wx", "0510");
        map.put("xy", "0710");
        map.put("zh", "0756");
        map.put("cs", "0731");
        map.put("zj", "0571");
        map.put("ganzhou", "0797");
        map.put("hf", "0551");
        map.put("jn", "0531");
        map.put("km", "0871");
        map.put("nb", "0574");
        map.put("xa", "029");
        map.put("zs", "0760");
        map.put("zq", "0758");
        map.put("zz", "0371");
        return map.get(cityShort);
    }

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
