package com.news.web.app.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.news.web.app.model.NewsRelated;
import com.news.web.app.model.NewsType;
import com.news.web.app.model.common.CommonHouseResult;
import com.news.web.app.model.esf.ESFResult;
import com.news.web.app.model.xiaoqu.XiaoQuResult;
import com.news.web.app.model.xinfang.XinfangResult;
import com.news.web.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
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
    @Value("${api.xinfang.other.city}")
    public String xinfangOtherCityAddress;
    @Value("${api.xinfang.sz.city}")
    public String xinfangSZCityAddress;
    @Value("${api.esf.other.city}")
    public String esfOtherCityAddress;
    @Value("${api.esf.sz.city}")
    public String esfSZCityAddress;
    @Value("${api.xiaoqu.other.city}")
    public String xiaoquOtherCityAddress;
    @Value("${api.xiaoqu.sz.city}")
    public String xiaoquSZCityAddress;
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
    /**
     * 是否存在房源信息
     */
    private static final String NEWS_RELATED = "NewsRelated";
    private static final String DSS_COLNAME = "东三省共用频道";
    private static final String CITYEN = "cityen";
    private static final String TYPEID = "typeid";
    private static final String PAGE_TOTAL = "PageTotal";
    private static final String BAIKE = "baike";
    private static final String ARTICLE_IS_NULL_TEXT = "请求文章列表为空=>{}";

    /**
     * @param: null
     * @description: 资讯城市首页
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/m/{cityen}/", "/m/{cityen}/list/c{type}", "/m/{cityen}/list/c{type}/p{page}"})
    public String index(Model model, @PathVariable(name = "cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "15") Integer pagesize,
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
        //判断集团资讯是否有效
        if (type.equals(41)) {//说明是集团资讯
            isJtyy = true;//将集团资讯置为true
            if (!CollectionUtils.isEmpty(childTypes)) {
                //默认获取第一个id
                typeid = Arrays.asList(childTypes.get(0).getId());
            }
        }

            if (isJtyy) {//说明是集团资讯
                //获取集团资讯栏目下的文章
                JSONObject jtResult = newsList("jtyy", typeid, 1, 15, null, null);
                if (!ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                    List<Map> jtNews = JSON.parseArray(JSON.toJSONString(jtResult.get(NEWS_LIST)), Map.class);
                    news.addAll(jtNews);
                }
                model.addAttribute("flag", 1);
            }

        if (!isJtyy) {
            //栏目非集团栏目编号获取文章列表
            JSONObject result = newsList(cityen, typeid, 1, 15, null, key);
            news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            model.addAttribute("flag", 0);
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
        model.addAttribute(CITYEN, cityen);
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
        map.put(CITYEN, cityen);
        map.put("platform", "wap");
        map.put("location", location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get(RESULT));
        return JSON.parseArray(data, NewsType.class);
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
        map.put(CITYEN, cityen);
        if(StringUtils.isEmpty(key)){
            map.put(TYPEID, typeId.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        }else{
            map.put(TYPEID, null);
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
        return jSONObject.getJSONObject(RESULT);
    }

    /**
     * @param: cityen 城市
     * @description: 默认百科资讯列表
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-25
     */
    private JSONObject newsListByBaike(String cityen,Integer typeId,  String location, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        map.put("location", location);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);
        if(!ObjectUtils.isEmpty(typeId)){
            map.put(TYPEID, typeId);
        }

        StringBuilder sql = new StringBuilder("GetNewsList?cityen={cityen}&platform=wap&location={location}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}");
        if(!ObjectUtils.isEmpty(typeId)){
            sql.append("&typeid={typeid}");
        }
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        sql.toString()
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_IS_NULL_TEXT, newsList);
        }
        return newsList;
    }

    /**
     * 获取新房信息
     * @param xinfangTypes 新房集合
     * @param cityen 城市简称
     * @return
     */
    public List<CommonHouseResult> getXinFangInfo(List<NewsRelated> xinfangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = new ArrayList<>();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的新房接口
            serviceUrl = xinfangSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xinfangOtherCityAddress;
        }
        //循环新房集合,取出新房数据
        xinfangTypes.stream().forEach(l -> {
            map.put("estExtId", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject( serviceUrl + "?cityen={cityen}&EstExtId={estExtId}&platform=wap", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XinfangResult xinfangResult = JSON.parseObject(data, XinfangResult.class);
                if(!Objects.isNull(xinfangResult)){
                    xinfangResult.setNewsId(l.getNewsid());
                    xinfangResult.setOid(l.getOid());
                }
                resultList.add(new CommonHouseResult(xinfangResult , null , null));

            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * 获取二手房信息
     * @param ershoufangTypes 二手房集合
     * @param cityen 城市简称
     * @return
     */
    @SuppressWarnings("all")
    public List<CommonHouseResult> getErshouFangInfo(List<NewsRelated> ershoufangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = new ArrayList<>();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);

        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的新房接口
            serviceUrl = esfSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = esfOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        ershoufangTypes.stream().forEach(l -> {
            map.put("adsNo", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&AdsNo={adsNo}&platform=wap", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                ESFResult esfResult = JSON.parseObject(data, ESFResult.class);
                if(!Objects.isNull(esfResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(esfResult.getSalePrice() != null && esfResult.getSalePrice() > 0D) {
                        //将数据进行格式化
                        BigDecimal db = new BigDecimal(esfResult.getSalePrice());
                        String plainString = db.toPlainString();
                        String salePrice = plainString.substring(0, plainString.lastIndexOf("0000"));
                        esfResult.setSalePriceString(salePrice);
                        esfResult.setSalePrice(Double.parseDouble(salePrice));
                    }
                    esfResult.setNewsId(l.getNewsid());
                    esfResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , esfResult , null));
            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * 获取小区信息
     * @param xiaoquTypes 小区集合
     * @param cityen 城市简称
     * @return
     */
    public List<CommonHouseResult> getXiaoQuInfo(List<NewsRelated> xiaoquTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = Lists.newArrayList();

        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        //定义一个服务接口，用于获取房源数据
        String serviceUrl;

        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的小区接口
            serviceUrl = xiaoquSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xiaoquOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        xiaoquTypes.stream().forEach(l -> {
            map.put("estateCode", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&EstateCode={estateCode}&platform=pc&ImageWidth=375&ImageHeight=250", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_IS_NULL_TEXT, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XiaoQuResult xiaoQuResult = JSON.parseObject(data, XiaoQuResult.class);
                if(!Objects.isNull(xiaoQuResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(xiaoQuResult.getSaleAvgPrice() != null && xiaoQuResult.getSaleAvgPrice() > 0D) {
                        //将数据进行格式化
                        //对平均价进行四舍五入
                        long saleAvgPrice = Math.round(xiaoQuResult.getSaleAvgPrice());
                        xiaoQuResult.setSaleAvgPriceString(saleAvgPrice);
                    }
                    xiaoQuResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , null , xiaoQuResult));
            }

        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }



    /**
     * @param: null
     * @description:
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-28
     */
    @SuppressWarnings("all")
    @GetMapping("/m/{cityen}/detail/{id}.html")
    public String index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "id") String id) {
        log.info("detail id=>{}", id);
        setCommon(model, cityen);
        //详情
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        //判断是否存在房源
        if(result.get(RESULT) != null){
            JSONObject detailByProp = result.getJSONObject(RESULT);
            if(detailByProp != null) {
                //将房源对象进行转换
                String newsRelatedData = JSON.toJSONString(detailByProp.get(NEWS_RELATED));
                List<NewsRelated> types = JSON.parseArray(newsRelatedData, NewsRelated.class);
                //将新房和二手房进行过滤
                List<NewsRelated> xinfangTypes = types.stream().filter(l -> l.getOtype().equals("xinfang")).collect(Collectors.toList());
                List<NewsRelated> esfTypes = types.stream().filter(l -> l.getOtype().equals("ershoufang")).collect(Collectors.toList());

                List<NewsRelated> xiaoquTypes = types.stream().filter(l -> l.getOtype().equals("xiaoqu")).collect(Collectors.toList());
                //创建一个公共的对象，用于返回房源数据
                List<CommonHouseResult> commonHouseResult = new ArrayList<>();
                //判断新房是否有数据
                if (!CollectionUtils.isEmpty(xinfangTypes)) {
                    //获取新房信息
                    List<CommonHouseResult> xinFangInfo = getXinFangInfo(xinfangTypes, cityen);
                    //如果新房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xinFangInfo)) {
                        commonHouseResult.addAll(xinFangInfo);
                    }
                }

                //判断二手房是否有数据
                if (!CollectionUtils.isEmpty(esfTypes)) {
                    //获取二手房信息
                    List<CommonHouseResult> esfInfo = getErshouFangInfo(esfTypes, cityen);
                    //如果二手房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(esfInfo)) {
                        commonHouseResult.addAll(esfInfo);
                    }
                }

                //判断小区是否有数据
                if (!CollectionUtils.isEmpty(xiaoquTypes)) {
                    //获取小区信息
                    List<CommonHouseResult> xiaoquInfos = getXiaoQuInfo(xiaoquTypes, cityen);
                    //如果小区集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xiaoquInfos)) {
                        commonHouseResult.addAll(xiaoquInfos);
                    }
                }

                //判断总的房源是否为空，如果不为空就返回到页面
                if(!CollectionUtils.isEmpty(commonHouseResult)){

                    model.addAttribute("commonHouseResult" , commonHouseResult);
                }
            }
        }

        JSONObject detail = result.getJSONObject(RESULT);

        //热点排行
        List<Integer> typeid = Arrays.asList();
        JSONObject newsList = newsList(cityen, typeid, 1, 10, 1, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);

        if (Objects.equals(detail.get("flag") , "url")) {//若flag的值为url,将文章跳转到此url指向的地址
            return "redirect:" + detail.get("Url");
        }
        model.addAttribute("news", news);
        //将文章内容进行格式化
        String content = (String) detail.get("Content");
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute("detailContent", content.replace("crossorigin=\"anonymous\"", ""));
        }
        model.addAttribute("detail", detail);
        model.addAttribute("newsDetailClickAddress", apiurl);
        model.addAttribute("newsId", id);
        return "news_detail";
    }

    /**
     * @param model  异步滚动分页
     * @param cityen 城市编号
     * @param type   栏目类型编号
     * @param page   页码
     * @param flag 集团资讯专用标识 1 取第一个，2取二个 ， 3取第三个
     * @return
     */
    @ResponseBody
    @SuppressWarnings("all")
    @GetMapping(value = {"/m/{cityen}/list/c{type}p{page}/page"})
    public JSONObject index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "type", required = false) Integer type
            , @PathVariable(name = "page", required = false) Integer page
            , @RequestParam(value = "key", required = false) String key
            , @RequestParam(value = "pagesize", defaultValue = "15", required = false) Integer pagesize , @RequestParam(value = "flag", defaultValue = "1") Integer flag) {
        JSONObject obj = new JSONObject();
        //文章列表
        List<Integer> typeid = new ArrayList<>(Arrays.asList(type));

        //栏目编号获取文章列表
        List<NewsType> jtyyTypes = typeList("jtyy", null);
        List<NewsType> childTypes = new ArrayList<>();
        if (!ObjectUtils.isEmpty(jtyyTypes)) {
            for (NewsType t : jtyyTypes) {
                childTypes.addAll(t.getChildList());
            }
        }

        //当前栏目ID是否集团资讯下的栏目
        Boolean isJtyy = false;
        if(type.equals(41)){//说明是集团资讯
            isJtyy = true;
        }

        if (isJtyy) {//说明是集团资讯
            //判断集团资讯是否有效
            if (!CollectionUtils.isEmpty(childTypes)) {
                switch (flag){
                    case 1:
                        //获取第一个id
                        typeid = Arrays.asList(childTypes.get(0).getId());
                        break;
                    case 2:
                        //获取第二个id
                        typeid = Arrays.asList(childTypes.get(1).getId());
                        break;
                    case 3:
                        //获取第三个id
                        typeid = Arrays.asList(childTypes.get(2).getId());
                        break;
                    default:
                        //默认取第一个id
                        typeid = Arrays.asList(childTypes.get(0).getId());
                        break;
                }


            }
        }

        //装载内容
        List<Map> news = null;
        //装载总共有多少条数据
        Integer pageTotal = 0;

        if (isJtyy) {//说明是集团资讯
            //获取集团资讯栏目下的文章
            JSONObject jtResult = newsList("jtyy", typeid, page, pagesize, null, null);
            news = JSON.parseArray(JSON.toJSONString(jtResult.get(NEWS_LIST)), Map.class);
            pageTotal = jtResult.getInteger(PAGE_TOTAL);
            if (!ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                List<Map> jtNews = JSON.parseArray(JSON.toJSONString(jtResult.get(NEWS_LIST)), Map.class);
                news.addAll(jtNews);
            }

            //判断pageTotal是否和当前页相等
            if(page >= pageTotal){
                //判断typeid是否等于childTypes
                if(childTypes.get(0).getId().equals(typeid.get(0))){
                    JSONObject tempResult = newsList("jtyy", Arrays.asList(childTypes.get(0).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put("flag", 1);
                }else if(childTypes.get(1).getId().equals(typeid.get(0))){
                    JSONObject tempResult = newsList("jtyy", Arrays.asList(childTypes.get(1).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put("flag", 2);
                }else if(childTypes.get(2).getId().equals(typeid.get(0))){
                    JSONObject tempResult = newsList("jtyy", Arrays.asList(childTypes.get(2).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put("flag", 3);
                }
            }else {
                obj.put("flag", 1);
            }

        }

        if(!isJtyy) {
            JSONObject result = newsList(cityen, typeid, page, pagesize, null, key);
            news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            pageTotal = result.getInteger(PAGE_TOTAL);
        }
        obj.put(RESULT, news);
        obj.put("TotalPage", pageTotal);
        obj.put("ResultNo", 0);
        obj.put("CurrentPage", page);
        return obj;
    }

    /**
     * @param: type 文章类型
     * @description: 百科
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    @SuppressWarnings("all")
    @GetMapping(value = "/m/{cityen}/baike")
    public String baike(Model model, @PathVariable("cityen") String cityen,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize,
                        @RequestParam(value = "channel" , required = false) Integer channel) {
        page = ObjectUtils.isEmpty(page) ? 1 : page;
        //栏目类型
        List<NewsType> types = typeList(cityen, BAIKE);
        List<NewsType> baikeTypes = new ArrayList<>();
        if (null != types && !types.isEmpty()) {
            if (!types.get(0).getChildList().isEmpty()) {
                baikeTypes = types.get(0).getChildList().get(0).getChildList();
                //第三层 841
                channel = ObjectUtils.isEmpty(channel) ? null : channel;
            }
        }

        //文章列表
        List<Map> news = new ArrayList<>();
        //获取文章列表的结果集
        JSONObject result;

        if(channel != null) {
                result = newsListByBaike(cityen, channel,BAIKE, page, pagesize, null, null);
                if (result.get(NEWS_LIST) != null) {
                    news.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                }
        }else {
            result = newsListByBaike(cityen, null , BAIKE, page, pagesize, null, null);
            if (result.get(NEWS_LIST) != null) {
                news.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
            }
        }
        setCommon(model, cityen);
        if(ObjectUtils.isEmpty(channel)){
           channel = types.get(0).getChildList().get(0).getChildList().get(0).getId();
        }
        model.addAttribute("types", baikeTypes);
        model.addAttribute("tabtype", channel);
        model.addAttribute("news", news);
        Integer pageCount = result.getInteger(PAGE_TOTAL);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        return BAIKE;
    }


}
