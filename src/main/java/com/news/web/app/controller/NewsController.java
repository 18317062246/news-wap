package com.news.web.app.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.news.web.app.model.NewsRelated;
import com.news.web.app.model.NewsType;
import com.news.web.app.model.common.CommonHouseResult;
import com.news.web.app.service.NewsService;
import com.news.web.util.AttributeKeyHelper;
import com.news.web.util.PageUtil;
import com.news.web.util.StringResource;
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

import javax.servlet.http.HttpServletRequest;
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


    @Autowired
    private NewsService newsService;

    @Value("${api.domain}")
    public String apiurl;
    @Value("${static.url}")
    public String staticurl;
    @Value("${city.dss}")
    public String dss;

    /**
     * 热门专题
     */
    private static final String HOT_SUB = "热门专题";
    private static final String WH_HOT_SUB = "武汉热门专题";

    /**
     * 武汉城市
     */
    private static final String WH_CITY_EN = "wh";

    private static final String NEWS_LIST = "NewsList";
    private static final String RESULT = "Result";
    /**
     * 是否存在房源信息
     */
    private static final String NEWS_RELATED = "NewsRelated";
    private static final String DSS_COLNAME = "东三省共用频道";
    private static final String CITYEN = "cityen";
    private static final String PAGE_TOTAL = "PageTotal";
    private static final String BAIKE = "baike";
    private static final String SZWORLD_CITYEN = "szworld";

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
                        @RequestParam(value = "key", required = false) String key ,
                        @RequestParam(value = "hidetab" , defaultValue = "close") String hidetab) {
        setCommon(model, cityen);
        //当hidetab为open的时候，赋值hidetab为true，前台要隐藏tab
        if(org.apache.commons.lang3.StringUtils.isNoneBlank(hidetab) && Objects.equals(AttributeKeyHelper.OPEN , hidetab)){
            model.addAttribute(AttributeKeyHelper.HIDE_TAB, true);
        }else {
            //否则不隐藏tab，赋值hidetab为false
            model.addAttribute(AttributeKeyHelper.HIDE_TAB , false);
        }
        //获取栏目类型
        List<NewsType> types = newsService.typeList(cityen, null);
        //栏目编号获取文章列表
        List<NewsType> jtyyTypes = newsService.typeList(AttributeKeyHelper.CENTANET, null);
        List<NewsType> childTypes = new ArrayList<>();
        if (!ObjectUtils.isEmpty(jtyyTypes)) {
            for (NewsType t : jtyyTypes) {
                childTypes.addAll(t.getChildList());
            }
        }
        types.addAll(jtyyTypes);
        List<NewsType> dssType = new ArrayList<>();

        if (types.isEmpty()) {
            log.error("栏目类型为空=>{}", cityen);
            return AttributeKeyHelper.INDEX_PAGE;
        } else if (dss.contains(cityen)) {
            //东三省sy,cc,dl,hrb结构不同
            for (NewsType s : types) {
                if (DSS_COLNAME.equals(s.getColumnsName())) {
                    dssType.addAll(s.getChildList());
                } else {
                    dssType.add(s);
                }
            }
        }

        //判断types是否为空，不为空就进行判断，栏目是否不存在新闻列表
        if(!CollectionUtils.isEmpty(types)) {
            //创建一个List对象，将没有文章的栏目进行存储
            List<NewsType> newsTypesRemove = new ArrayList<>();
            //创建一个List对象，深圳海外城市需要将中原资讯频道移除
            List<NewsType> jtNewsTypesRemove = new ArrayList<>();
            //循环types,将没有文章的栏目进行删除
            for (NewsType newsType : types) {
                //41为中原资讯，如果是41，则进行跳过，深圳海外城市，其他的城市保留
                if(Objects.equals(newsType.getId() , 41)){
                    //深圳海外城市，移除中原资讯
                    if(Objects.equals(SZWORLD_CITYEN , cityen)){
                        jtNewsTypesRemove.add(newsType);
                    }
                    continue;
                }
                //获取集团资讯栏目下的文章
                JSONObject jtResult = newsService.newsList(cityen, Arrays.asList(newsType.getId()), 1, 15, null, null);
                //若该栏目下的文章为空，将该文章对象添加到集合中
                if (ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                    newsTypesRemove.add(newsType);
                }
            }

            //若newsTypesRemove对象不为空，就删除栏目
            if(!CollectionUtils.isEmpty(newsTypesRemove)) {
                //删除所有栏目
                types.removeAll(newsTypesRemove);
            }

            //若jtNewsTypesRemove对象不为空，就删除栏目
            if(!CollectionUtils.isEmpty(jtNewsTypesRemove)) {
                //删除所有栏目
                types.removeAll(jtNewsTypesRemove);
            }

            //如果是北京，隐藏北京写字楼资讯栏目
            if(Objects.equals(cityen , AttributeKeyHelper.BJ_CITY_EN)){
                //筛选出北京写字楼栏目对象，栏目id为659
                List<NewsType> xzlDelList = types.stream().filter(l -> Objects.equals(659, l.getId())).collect(Collectors.toList());
                //如果北京写字楼资讯栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(xzlDelList)){
                    //隐藏写字楼相关的所有栏目
                    types.removeAll(xzlDelList);
                }
            }

            //如果是南京，隐藏南京楼市和政策法规栏目
            if(Objects.equals(cityen , AttributeKeyHelper.NJ_CITY_EN)){
                //筛选出南京楼市栏目对象，栏目id为65
                List<NewsType> njlsDelList = types.stream().filter(l -> Objects.equals(65, l.getId())).collect(Collectors.toList());
                //如果南京楼市栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(njlsDelList)){
                    //隐藏南京楼市相关的所有栏目
                    types.removeAll(njlsDelList);
                }

                //筛选出政策法规栏目对象，栏目id为67
                List<NewsType> zcfgDelList = types.stream().filter(l -> Objects.equals(67, l.getId())).collect(Collectors.toList());
                //如果政策法规栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(zcfgDelList)){
                    //隐藏政策法规相关的所有栏目
                    types.removeAll(zcfgDelList);
                }
            }

            //如果是东莞，隐藏东莞政策法规和东莞成交走势资讯栏目
            if(Objects.equals(cityen , AttributeKeyHelper.DG_CITY_EN)){
                //筛选出东莞成交走势栏目对象，栏目id为89
                List<NewsType> dgcjzsList = types.stream().filter(l -> Objects.equals(89, l.getId())).collect(Collectors.toList());
                //如果东莞成交走势资讯栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(dgcjzsList)){
                    //隐藏东莞成交走势相关的栏目
                    types.removeAll(dgcjzsList);
                }

                //筛选出东莞政策法规栏目对象，栏目id为87
                List<NewsType> dgzcfgList = types.stream().filter(l -> Objects.equals(87, l.getId())).collect(Collectors.toList());
                //如果东莞政策法规资讯栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(dgzcfgList)){
                    //隐藏政策法规相关的栏目
                    types.removeAll(dgzcfgList);
                }
            }

            //如果是惠州，隐藏Ben钟话市栏目
            if(Objects.equals(cityen , AttributeKeyHelper.HZ_CITY_EN)){
                //筛选出Ben钟话市栏目对象，栏目id为107
                List<NewsType> benDelList = types.stream().filter(l -> Objects.equals(107, l.getId())).collect(Collectors.toList());
                //隐藏Ben钟话市相关的栏目
                types.removeAll(benDelList);
            }

            //不是东三省城市
            if(!dss.contains(cityen)) {
                //默认取第一个tab_type
                type = ObjectUtils.isEmpty(type) ? types.get(0).getId() : type;
            }
        }



        //判断dssType是否为空，不为空就进行判断，栏目是否不存在新闻列表
        if(!CollectionUtils.isEmpty(dssType)) {
            //创建一个List对象，将没有文章的栏目进行存储(东三省)
            List<NewsType> dssNewsTypesRemove = new ArrayList<>();
            //创建一个List对象，东三省城市需要将中原资讯频道移除
            List<NewsType> jtNewsTypesRemove = new ArrayList<>();
            //循环东三省types,将没有文章的栏目进行删除
            for (NewsType newsType : dssType) {
                //41为中原资讯，移除当前栏目
                if(Objects.equals(newsType.getId() , 41)){
                    jtNewsTypesRemove.add(newsType);
                }
                //获取集团资讯栏目下的文章
                JSONObject jtResult = newsService.newsList(cityen, Arrays.asList(newsType.getId()), 1, 15, null, null);
                //若该栏目下的文章为空，将该文章对象添加到集合中
                if (ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                    dssNewsTypesRemove.add(newsType);
                }
            }

            //若dssNewsTypesRemove对象不为空，就删除栏目
            if(!CollectionUtils.isEmpty(dssNewsTypesRemove)) {
                //删除所有栏目(东三省)
                dssType.removeAll(dssNewsTypesRemove);
            }

            //若jtNewsTypesRemove对象不为空，就删除栏目
            if(!CollectionUtils.isEmpty(jtNewsTypesRemove)) {
                //删除中原资讯栏目(东三省)
                dssType.removeAll(jtNewsTypesRemove);
            }
            //是东三省城市
            if(dss.contains(cityen)) {
                //东三省城市判断type是否存在，存在就正常赋值，不存在将第一个栏目id赋值给type
                type = ObjectUtils.isEmpty(type) ? dssType.get(0).getId() : type;
            }
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
                JSONObject jtResult = newsService.newsList(AttributeKeyHelper.CENTANET, typeid, 1, 15, null, null);
                if (!ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                    List<Map> jtNews = JSON.parseArray(JSON.toJSONString(jtResult.get(NEWS_LIST)), Map.class);
                    news.addAll(jtNews);
                }
                model.addAttribute(AttributeKeyHelper.FLAG, 1);
            }

        if (!isJtyy) {
            //栏目非集团栏目编号获取文章列表

            JSONObject result = newsService.newsList(cityen, typeid, 1, 15, null, key);
            news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);

            model.addAttribute(AttributeKeyHelper.FLAG, 0);
        }
        model.addAttribute(AttributeKeyHelper.TYPES, dss.contains(cityen) ? dssType : types);
        model.addAttribute(AttributeKeyHelper.TAB_TYPE, type);
        model.addAttribute(AttributeKeyHelper.NEWS, news);
        model.addAttribute(AttributeKeyHelper.SEARCH_KEY, key);
        for (NewsType t : types) {
            if (type.equals(t.getId())) {
                String colName = t.getColumnsName();
                //不是武汉的城市，是否为热门专题栏目
                if (!Objects.equals(cityen , WH_CITY_EN) && HOT_SUB.equals(colName)) {
                    return AttributeKeyHelper.HOT_LIST_PAGE;
                }
                //武汉城市，是否为武汉热门专题栏目
                if (Objects.equals(cityen , WH_CITY_EN) && WH_HOT_SUB.equals(colName)) {
                    return AttributeKeyHelper.HOT_LIST_PAGE;
                }
            }
        }
        return AttributeKeyHelper.INDEX_PAGE;
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
        model.addAttribute(AttributeKeyHelper.STATIC_URL, staticurl);
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
            , @PathVariable(name = "id") String id
            ,HttpServletRequest request) {

        log.info("detail id=>{}", id);
        setCommon(model, cityen);
        //获取引用
        String referer = request.getHeader(AttributeKeyHelper.REFERER);
        //详情
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        //判断是否存在房源
        if(result.get(RESULT) != null){
            JSONObject detailByProp = result.getJSONObject(RESULT);

            //获取是否上架的标识
            Integer upper = (Integer)detailByProp.get(AttributeKeyHelper.UPPER);
            //如果upper为0代表是下架,返回到资讯下架提示页面
            if(Objects.equals(0 , upper)){
                return AttributeKeyHelper.OFF_SHELF_NEWS;
            }

            if(detailByProp != null) {
                //将房源对象进行转换
                String newsRelatedData = JSON.toJSONString(detailByProp.get(NEWS_RELATED));
                List<NewsRelated> types = JSON.parseArray(newsRelatedData, NewsRelated.class);
                //将新房和二手房进行过滤
                List<NewsRelated> xinfangTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.XINFANG_KEY)).collect(Collectors.toList());
                List<NewsRelated> esfTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.ERSHOUFANG_KEY)).collect(Collectors.toList());

                List<NewsRelated> xiaoquTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.XIAOQU_KEY)).collect(Collectors.toList());
                //创建一个公共的对象，用于返回房源数据
                List<CommonHouseResult> commonHouseResult = new ArrayList<>();
                //判断新房是否有数据
                if (!CollectionUtils.isEmpty(xinfangTypes)) {
                    //获取新房信息
                    List<CommonHouseResult> xinFangInfo = newsService.getXinFangInfo(xinfangTypes, cityen);
                    //如果新房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xinFangInfo)) {
                        commonHouseResult.addAll(xinFangInfo);
                    }
                }

                //判断二手房是否有数据
                if (!CollectionUtils.isEmpty(esfTypes)) {
                    //获取二手房信息
                    List<CommonHouseResult> esfInfo = newsService.getErshouFangInfo(esfTypes, cityen);
                    //如果二手房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(esfInfo)) {
                        commonHouseResult.addAll(esfInfo);
                    }
                }

                //判断小区是否有数据
                if (!CollectionUtils.isEmpty(xiaoquTypes)) {
                    //获取小区信息
                    List<CommonHouseResult> xiaoquInfos = newsService.getXiaoQuInfo(xiaoquTypes, cityen);
                    //如果小区集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xiaoquInfos)) {
                        commonHouseResult.addAll(xiaoquInfos);
                    }
                }

                //判断总的房源是否为空，如果不为空就返回到页面
                if(!CollectionUtils.isEmpty(commonHouseResult)){

                    model.addAttribute(AttributeKeyHelper.COMMON_HOUSE_RESULT , commonHouseResult);
                }
            }
        }

        JSONObject detail = result.getJSONObject(RESULT);

        //热点排行
        List<Integer> typeid = Arrays.asList();
        JSONObject newsList = newsService.newsList(cityen, 1, 10, 0);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);

        if (Objects.equals(detail.get(AttributeKeyHelper.FLAG) , AttributeKeyHelper.URL)) {//若flag的值为url,将文章跳转到此url指向的地址
            return String.format(AttributeKeyHelper.REDIRECT_LINK , detail.get(AttributeKeyHelper.DETAIL_BY_URL_ATTR));
        }
        //获取所有参数
        String queryString = request.getQueryString();
        //如果queryString不为空，就将经纪人的信息参数存储起来
        if(org.apache.commons.lang3.StringUtils.isNoneBlank(queryString)){
            //如果不为空，就转换成小写
            queryString = queryString.toLowerCase();
            model.addAttribute(StringResource.JINGJIREN_SHARE_KEY , String.format(StringResource.JINGJIREN_SHARE_VALUE , queryString));
        }

        model.addAttribute(AttributeKeyHelper.NEWS, news);
        //将文章内容进行格式化
        String content = (String) detail.get(AttributeKeyHelper.CONTENT);
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute(AttributeKeyHelper.DETAIL_CONTENT, content.replace("crossorigin=\"anonymous\"", ""));
        }
        model.addAttribute(AttributeKeyHelper.DETAIL, detail);
        model.addAttribute(AttributeKeyHelper.NEWS_DETAIL_CLICK_ADDRESS, apiurl);
        model.addAttribute(AttributeKeyHelper.NEWS_ID, id);
        model.addAttribute(AttributeKeyHelper.REFERER, referer);
        return AttributeKeyHelper.NEWS_DETAIL_PAGE;
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
        List<NewsType> jtyyTypes = newsService.typeList(AttributeKeyHelper.CENTANET, null);
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
            JSONObject jtResult = newsService.newsList("jtyy", typeid, page, pagesize, null, null);
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
                    JSONObject tempResult = newsService.newsList(AttributeKeyHelper.CENTANET, Arrays.asList(childTypes.get(0).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put(AttributeKeyHelper.FLAG, 1);
                }else if(childTypes.get(1).getId().equals(typeid.get(0))){
                    JSONObject tempResult = newsService.newsList(AttributeKeyHelper.CENTANET, Arrays.asList(childTypes.get(1).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put(AttributeKeyHelper.FLAG, 2);
                }else if(childTypes.get(2).getId().equals(typeid.get(0))){
                    JSONObject tempResult = newsService.newsList(AttributeKeyHelper.CENTANET, Arrays.asList(childTypes.get(2).getId()), page, pagesize, null, null);
                    pageTotal = jtResult.getInteger(PAGE_TOTAL);
                    obj.put(AttributeKeyHelper.FLAG, 3);
                }
            }else {
                obj.put(AttributeKeyHelper.FLAG, 1);
            }

        }

        if(!isJtyy) {
            JSONObject result = newsService.newsList(cityen, typeid, page, pagesize, null, key);
            news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            pageTotal = result.getInteger(PAGE_TOTAL);
        }
        obj.put(RESULT, news);
        obj.put(AttributeKeyHelper.TOTAL_PAGE, pageTotal);
        obj.put(AttributeKeyHelper.RESULT_NO, 0);
        obj.put(AttributeKeyHelper.CURRENT_PAGE, page);
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
        List<NewsType> types = newsService.typeList(cityen, BAIKE);
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
                result = newsService.newsListByBaike(cityen, channel,BAIKE, page, pagesize, null, null);
                if (result.get(NEWS_LIST) != null) {
                    news.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                }
        }else {
            result = newsService.newsListByBaike(cityen, null , BAIKE, page, pagesize, null, null);
            if (result.get(NEWS_LIST) != null) {
                news.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
            }
        }
        setCommon(model, cityen);
        if(ObjectUtils.isEmpty(channel)){
           channel = types.get(0).getChildList().get(0).getChildList().get(0).getId();
        }
        model.addAttribute(AttributeKeyHelper.TYPES, baikeTypes);
        model.addAttribute(AttributeKeyHelper.TAB_TYPE, channel);
        model.addAttribute(AttributeKeyHelper.NEWS, news);
        Integer pageCount = result.getInteger(PAGE_TOTAL);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute(AttributeKeyHelper.PAGE_UTIL_BY_P, p);
        return BAIKE;
    }

    /**
     * @description: 写字楼列表
     * @author: Steven.yu
     * @date: 2020-07-14
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/m/{cityen}/xzl/list"})
    public String xzlIndex(Model model, @PathVariable(name = "cityen") String cityen,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "15") Integer pagesize) {
        setCommon(model, cityen);

        //装载数据
        List<Map> news = new ArrayList<>();



        List<Integer> typeid = null;
        //如果是北京，那么typeid设置为659
        if(Objects.equals(cityen , AttributeKeyHelper.BJ_CITY_EN)){
            typeid = Arrays.asList(659);
        }
        //若typeid不为空，那么查询对应城市写字楼的数据
        if(!CollectionUtils.isEmpty(typeid)) {
            //获取写字楼栏目下的文章
            JSONObject xzlResult = newsService.newsList(cityen, typeid, 1, 15, null, null);
            if (!ObjectUtils.isEmpty(xzlResult.get(NEWS_LIST))) {
                List<Map> xzlNews = JSON.parseArray(JSON.toJSONString(xzlResult.get(NEWS_LIST)), Map.class);
                news.addAll(xzlNews);
            }
        }



        //若news不为空，那么将数据传递到前台页面
        if(!CollectionUtils.isEmpty(news)) {
            model.addAttribute(AttributeKeyHelper.NEWS, news);
        }
        return AttributeKeyHelper.BUSINESS_HEADLINE_LIST_PAGE;
    }

    /**
     * @description: 写字楼详情
     * @author: Steven.yu
     * @date: 2020-07-14
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/m/{cityen}/xzl/detail/{id}.html"})
    public String xzlDetail(Model model, @PathVariable(name = "cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "id" , required = true) Integer id) {
        setCommon(model, cityen);

        //获取详情
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        //将数据格式化成JSONObject对象
        JSONObject detail = result.getJSONObject(RESULT);

        //热点排行
        List<Integer> typeid = Arrays.asList();
        JSONObject newsList = newsService.newsList(cityen, 1, 5, 0);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);

        if (Objects.equals(detail.get(AttributeKeyHelper.FLAG) , AttributeKeyHelper.URL)) {//若flag的值为url,将文章跳转到此url指向的地址
            return String.format(AttributeKeyHelper.REDIRECT_LINK , detail.get(AttributeKeyHelper.DETAIL_BY_URL_ATTR));
        }

        model.addAttribute(AttributeKeyHelper.NEWS, news);
        //将文章内容进行格式化
        String content = (String) detail.get(AttributeKeyHelper.CONTENT);
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute(AttributeKeyHelper.DETAIL_CONTENT, content.replace("crossorigin=\"anonymous\"", ""));
        }


        model.addAttribute(AttributeKeyHelper.NEWS, news);
        model.addAttribute(AttributeKeyHelper.DETAIL, detail);
        model.addAttribute(AttributeKeyHelper.NEWS_ID, id);
        return AttributeKeyHelper.BUSINESS_HEADLINE_DETAIL_PAGE;
    }


}
