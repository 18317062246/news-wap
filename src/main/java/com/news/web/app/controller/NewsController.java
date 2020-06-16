package com.news.web.app.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.news.web.app.model.NewsType;
import com.news.web.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;


/*
 * @Author zouyuan1
 * @Description 资讯信息
 * @Date 18:01 2020-05-20
 * @Param
 * @return
 **/
@Slf4j
@Controller
public class NewsController {

    @Autowired
    private RestTemplate restTemplate;
    @Value("${api.domain}")
    public String apiurl;
    @Value("${static.url}")
    public String staticurl;
    @Value("${static.version}")
    public String ver;
    @Value("${city.dss}")
    public String dss;
    /**
     * 热门专题
     */
    private static final String HOT_SUB = "热门专题";

    private static final String NEWS_LIST = "NewsList";
    private static final String RESULT = "Result";
    private static final String DSS_COLNAME = "东三省共用频道";

    /**
     * @param: null
     * @description: 资讯城市首页
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    @GetMapping(value = {"/m/{cityen}/", "/m/{cityen}/list/c{type}", "/m/{cityen}/list/c{type}/p{page}"})
    public String index(Model model, @PathVariable(name = "cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize,
                        @RequestParam(value = "key", required = false) String key) {
        setCommon(model, cityen);
        //获取栏目类型
        List<NewsType> types = typeList(cityen, null);
        //栏目编号获取文章列表
        List<NewsType> jtyyTypes = typeList("jtyy", null);
        List<NewsType> childTypes = new ArrayList<>();
        if (!ObjectUtils.isEmpty(jtyyTypes)) {
            for (NewsType t : jtyyTypes) {
                childTypes.addAll(t.getChildList());
            }
        }
        types.addAll(jtyyTypes);
        List<NewsType> dssType = new ArrayList<>();
        //默认取第一个tab_type
        type = ObjectUtils.isEmpty(type) ? types.get(0).getId() : type;
        if (types.isEmpty()) {
            log.error("栏目类型为空=>{}", cityen);
            return "index";
        } else if (dss.contains(cityen)) {
            //东三省sy,cc,dl,hrb结构不同
            for (NewsType s : types) {
                if (DSS_COLNAME.equals(s.getColumnsName())) {
                    dssType.addAll(s.getChildList());
                } else {
                    dssType.add(s);
                }
            }
            type = ObjectUtils.isEmpty(type) ? dssType.get(0).getId() : type;
        }
        List<Integer> typeid = Arrays.asList(type);
        List<Map> news = new ArrayList<>();
        //当前栏目ID是否集团资讯下的栏目
        Boolean isJtyy = false;
        for (NewsType jt : childTypes) {
            if (type.equals(jtyyTypes.get(0).getId())) {
                isJtyy = true;
                //获取集团资讯栏目下的文章
                JSONObject jtResult = newsList("jtyy", typeid, 1, 15, null, null);
                if (!ObjectUtils.isEmpty(jtResult.get("NewsList"))) {
                    List<Map> jtNews = JSON.parseArray(JSON.toJSONString(jtResult.get("NewsList")), Map.class);
                    news.addAll(jtNews);
                }
            }
        }
        if (isJtyy == false) {
            //栏目非集团栏目编号获取文章列表
            JSONObject result = newsList(cityen, typeid, 1, 15, null, key);
            news = JSON.parseArray(JSON.toJSONString(result.get("NewsList")), Map.class);
        }
        model.addAttribute("types", dss.contains(cityen) ? dssType : types);
        model.addAttribute("tabtype", type);
        model.addAttribute("news", news);
        model.addAttribute("key", key);
        for (NewsType t : types) {
            if (type.equals(t.getId())) {
                String colName = t.getColumnsName();
                if (HOT_SUB.equals(colName)) {
                    return "hot_list";
                }
            }
        }
        return "index";
    }

    /**
     * @param: null
     * @description: 公共变量
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    private void setCommon(Model model, String cityen) {
        model.addAttribute("cityen", cityen);
        model.addAttribute("staticurl", staticurl);
        model.addAttribute("ver", ver);
    }

    /**
     * @param: 城市编号
     * @description: 栏目列表接口
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    private List<NewsType> typeList(String cityen, String location) {
        Map map = new HashMap();
        map.put("cityen", cityen);
        map.put("platform", "wap");
        map.put("location", location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get("Result"));
        List<NewsType> news = JSON.parseArray(data, NewsType.class);
        return news;
    }


    /**
     * @param: cityen 城市
     * @param: typeid 栏目类型
     * @description: 默认资讯列表
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-25
     */
    private JSONObject newsList(String cityen, List<Integer> typeId, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put("cityen", cityen);
        if(StringUtils.isEmpty(key)){
            map.put("typeid", typeId.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        }else{
            map.put("typeid", null);
        }
        map.put("key", key);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=wap&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}"
                , JSONObject.class, map);
        JSONObject result = (JSONObject) jSONObject.getJSONObject("Result");
        return result;
    }

    /**
     * @param: null
     * @description: TODO
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-28
     */
    @GetMapping("/m/{cityen}/detail/{id}.html")
    public String index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "id") String id) {
        log.info("detail id=>{}", id);
        setCommon(model, cityen);
        //详情
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        JSONObject detail = result.getJSONObject("Result");

        //热点排行
        List<Integer> typeid = Arrays.asList();
        JSONObject newsList = newsList(cityen, typeid, 1, 10, 1, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get("NewsList")), Map.class);
        if (!ObjectUtils.isEmpty(detail.get("Url"))) {
            return "redirect:" + detail.get("Url");
        }
        model.addAttribute("news", news);
        //将文章内容进行格式化
        String content = (String) detail.get("Content");
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute("detailContent", content.replace("crossorigin=\"anonymous\"", ""));
        }
        model.addAttribute("detail", detail);
        return "news_detail";
    }

    /**
     * @param model  异步滚动分页
     * @param cityen 城市编号
     * @param type   栏目类型编号
     * @param page   页码
     * @return
     */
    @ResponseBody
    @GetMapping(value = {"/m/{cityen}/list/c{type}p{page}/page"})
    public JSONObject index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "type", required = false) Integer type
            , @PathVariable(name = "page", required = false) Integer page
            , @RequestParam(value = "key", required = false) String key
            , @RequestParam(value = "pagesize", defaultValue = "10", required = false) Integer pagesize) {
        JSONObject obj = new JSONObject();
        //文章列表
        List<Integer> typeid = new ArrayList<>(Arrays.asList(type));
        JSONObject result = newsList(cityen, typeid, page, pagesize, null, key);
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        Integer pageTotal = result.getInteger("PageTotal");
        obj.put("Result", news);
        obj.put("TotalPage", pageTotal);
        obj.put("ResultNo", 0);
        return obj;
    }

    /**
     * @param: type 文章类型
     * @description: 百科
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    @GetMapping(value = {"/m/{cityen}/baike", "/m/{cityen}/baike/c{type}/p{page}"})
    public String baike(Model model, @PathVariable("cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize) {
        page = ObjectUtils.isEmpty(page) ? 1 : page;
        //栏目类型
        List<NewsType> types = typeList(cityen, "baike");
        List<NewsType> baikeTypes = new ArrayList<>();
        if (null != types && !types.isEmpty()) {
            if (!types.get(0).getChildList().isEmpty()) {
                baikeTypes = types.get(0).getChildList().get(0).getChildList();
                //第三层 841
                type = ObjectUtils.isEmpty(type) ? types.get(0).getChildList().get(0).getChildList().get(0).getId() : type;
            }
        }

        //文章列表
        List<Map> news = new ArrayList<>();
        JSONObject result = new JSONObject();
        for (NewsType baike : baikeTypes) {
            List<Integer> typeid = new ArrayList<>(Arrays.asList(baike.getId()));
            result = newsList(cityen, typeid, page, pagesize, null, null);
            //news= JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            news.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
        }
        setCommon(model, cityen);
        model.addAttribute("types", baikeTypes);
        model.addAttribute("tabtype", type);
        model.addAttribute("news", news);
        Integer pageCount = result.getInteger("PageTotal");
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        return "baike";
    }


}
