package com.huitian.web.wordblank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.huitian.api.indent.service.WordblankService;
import com.huitian.context.ThreadContext;
import com.huitian.dto.Order;
import com.huitian.dto.Pager;
import com.huitian.po.indent.Wordblank;
import com.huitian.util.Dto;
import com.huitian.util.StringUtil;
import com.huitian.util.json.JacksonHelper;
import com.huitian.web.image.controller.ImageController;
/**
 * 毛坯列表的controller
 * @author Administrator
 *
 */
@Controller("wordBlankController")
@RequestMapping("wordBlank")
public class WordBlankController {
    protected static final String PAGE_PARAM = "page";
    protected static final String ROWS_PARAM = "rows";
    protected static final String COUNT_PARAM = "countall";
	@Autowired
	private WordblankService wordblankService;
	@RequestMapping("addWordBlank")
	public String addWordBlank() {
		return "wordblank/wordblankadd";
	}
	/**
	 * 保存毛坯的controller
	 * @param data
	 * @param request
	 * @return
	 */
	@RequestMapping("saveWordBlank")
	@ResponseBody
	public HashMap<String,Object> saveWordBlank(@RequestParam("data")String data,HttpServletRequest request,
			@RequestParam(value = "imgFiles", required = false) MultipartFile imgFiles) {
		Wordblank wordblank = JacksonHelper.toObject(data, Wordblank.class);	
HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			   String url=ImageController.saveFile(imgFiles);
			   wordblank.setMaopiUrl(url);
			wordblankService.save(wordblank);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success", false);
		}	
		return map;
	}
    protected int calculateStart(int page, int limit) {
        if (page <= 1)
            return 1;

        return (page - 1) * limit + 1;
    }
	// 经理列表（甲方代表下的经理人）
		@RequestMapping(value = "/dolist")
		@ResponseBody
		public Dto dolist(HttpServletRequest request, //
				@RequestBody Wordblank searchForm,
				@RequestParam(required = false, defaultValue = "1", value = PAGE_PARAM) int page, // 记录页数
				@RequestParam(required = false, defaultValue = "20", value = ROWS_PARAM) int limit, // 记录条数
				@RequestParam(required = false, value = "order") List<Order> orders, //
				@RequestParam(required = false, defaultValue = "true", value = COUNT_PARAM) boolean countall)
				throws Exception {

			int start = this.calculateStart(page, limit);

			Dto ret = new Dto();
	     ret.put("", doList(searchForm, start, limit, orders));

			if (countall) {
				Integer total = doCount(searchForm);
				ret.put("page", new Pager(total, limit).setPage(page));
			}
			ret.put("success", true);
			return ret;
		}

	private Integer doCount(Wordblank searchForm) {
			// TODO Auto-generated method stub
			return null;
		}
	private Object doList(Wordblank searchForm, int start, int limit, List<Order> orders) {
		// TODO Auto-generated method stub
		return wordblankService.list(searchForm, start, limit, orders);
	}
	@RequestMapping(value = "/wordblankList")
	protected String managerList(HttpServletRequest request,
			@RequestParam(value = "pageNo", required = false) String pageNo, ModelMap model) {
		// 如果pageNo不为空（也就是不是从主页面点击工匠列表进来的）那么就取查询条件的session
		if (!StringUtil.isEmpty(pageNo)) {
		} else {// 如果Pageno为空，默认为第一页
			pageNo = "1";
		}
		model.addAttribute("pageNo", pageNo);// 将页码传回到前端

		return "wordblank/wordblanklist";
	}
}
