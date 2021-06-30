package com.news.web.util;

import org.apache.jasper.compiler.JspUtil;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class CentaioUtil {
    /**
     * 埋点系统开关，true表示打开，
     * NewsController中的
     */
    //测试url
//    m/cd/?platform=wechat&sem=wechat&hmpl=&openid=oc7gI0bVkg8ZYu2hK2ebUZXEtAUE&unionid=odCF9jgI75oB3Kf_YTbqyCMOsQTU&userid=123432
    public static final boolean IS_CENTIO_ON = true;
    //埋点日志是否打开
    public static final boolean IS_CENTIO_LOG_ON = true;
    //是否是测试环境
    public static final boolean IS_CENTIO_DEV_ON = true;
    //跳转自动触发的功能是否开启，需开启
    public static final boolean IS_CENTIO_MONITOR_ON = true;
    //是否来自小程序
    public static boolean IS_FROM_WECHAT = false;
    /**
     * 埋点和微信相关的各种信息
     */
    //cookie名字Y190cmFunion3Idja2lk
    public static final String WECHAT_UNION_ID_KEY = "wechat_union_id";
    //cookie名字Y190open2Idcmja2lk
    public static final String WECHAT_OPEN_ID_KEY = "wechat_open_id";
    //cookie名字Y1usedrId90cmFunion3Idja2lk
    public static final String WECHAT_USER_ID_KEY = "wechat_user_id";
    public static final String CENTAIO_CITYCODE_KEY = "centio_citycode";
    /**
     * 根据城市缩写获取城市代码
     * @param ：城市拼音缩写
     * return:城市代码
     * */
    /**
     * index page
     * 包含埋点功能
     */
    public static final String INDEX_PAGE_CENTAIO = "index_centaio";
    /**
     * 详情页面
     */
    public static final String NEWS_DETAIL_PAGE_CENTAIO = "news_detail_centaio";

    /**
     * 通过城市缩写获取区号
     */

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
     * 把从url中接到的参数，openId，unionId，userId，citycode返回到view中
     * citycode：接受的城市缩写cityshort，返回的是城市区号 citycode
     */

    public static void setWechatAppInfo(Model model, String openId, String unionId, String userId, String cityShort, HttpServletRequest request) {
        if(request.getHeader("user-agent").contains("MicroMessenger")){
            IS_FROM_WECHAT=true;
        }else {
            IS_FROM_WECHAT=false;
        }
        if (openId != null) {
            model.addAttribute(WECHAT_OPEN_ID_KEY, openId);
        } else {
            model.addAttribute(WECHAT_OPEN_ID_KEY, "");
        }

        if (unionId != null) {
            model.addAttribute(WECHAT_UNION_ID_KEY, unionId);
        } else {
            model.addAttribute(WECHAT_UNION_ID_KEY, "");
        }

        if (userId != null) {
            model.addAttribute(WECHAT_USER_ID_KEY, userId);
        } else {
            model.addAttribute(WECHAT_USER_ID_KEY, "");
        }

        if (cityShort != null) {
            model.addAttribute(CENTAIO_CITYCODE_KEY, CentaioUtil.getCityCode(cityShort));
        } else {
            model.addAttribute(CENTAIO_CITYCODE_KEY, "");
        }
        model.addAttribute("is_log_on", IS_CENTIO_LOG_ON);
        model.addAttribute("is_dev_on", IS_CENTIO_DEV_ON);
        model.addAttribute("is_monitor_on", IS_CENTIO_MONITOR_ON);
    }
}
