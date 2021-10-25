package com.news.web.util;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class DwMaiDianUtiil {
    public static final boolean isMaiDianON=true;
    public  static  final String  NEWS_DETAIL_PAGE_DW_MAIDIAN="news_detail_dw_centaio";
    public  static  final String  INDEX_DW_MAIDIAN="index_centaio_dw";

    public static void setModel(Model model, String entry, String cityen, HttpServletRequest request) {
        if(!isNullOrEmpty(entry)){
            model.addAttribute("entry",entry);
        }else {
            model.addAttribute("entry","资讯icon");
        }
        if(!isNullOrEmpty(cityen)){
            model.addAttribute("cityCode",getCityCode(cityen));
        }
//        String[] urlParts=request.getRequestURL().toString().split("/");
//        if(request.getHeader("user-agent").contains("MicroMessenger")){
//            String sendUrl=urlParts[0]+"//"+urlParts[2]+"/"+urlParts[3]+"/"+urlParts[4]+"/";
//            model.addAttribute("sendUrl",sendUrl);
//        }
    }
    public static boolean isNullOrEmpty(Object o){
        return null==o||o.toString().equals("");
    }
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
}
