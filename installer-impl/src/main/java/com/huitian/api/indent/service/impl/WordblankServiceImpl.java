package com.huitian.api.indent.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.WordblankService;
import com.huitian.dto.Order;
import com.huitian.po.indent.Wordblank;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.WordblankDao;

@Service(WordblankService.BEAN_NAME)
public class WordblankServiceImpl extends StringIdBaseServiceImpl<Wordblank>implements WordblankService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(WordblankDao dao) {
		super.setBaseDao(dao);
	}
	   @Override
	    public int count(ManagerSf sf) {
	        QueryInfo queryInfo = prepareQuery(sf).build();
	        return sqlDao.count(queryInfo.getCountSql(), queryInfo.getParArr());
	    }

	    private QueryInfoBuilder prepareQuery(ManagerSf sf) {
	        if (sf == null) {
	            sf = new ManagerSf();
	        }
	        if (sf.getAccount() == null) {
	            sf.setAccount(new Account());
	        }
	        StringBuilder sql = new StringBuilder("select manager.CREATE_DATE,manager.SERVE_CITY,manager.LEVEL_NAME,manager.APARTY_ID, manager.CODE1, account.MOBILE,manager.ACCOUNT_ID,manager.STATUS,manager.ROLE_STATUS,manager.VERIFIER,manager.ID, manager.STARS,manager.REMARKS,manager.VERIFIER_DATE, manager.TOTAL_INDENT,manager.SCORE from ZL_MANAGER manager, ZL_ACCOUNT account where manager.ID = account.MANAGER_ID  ");//
	        		//sql.append(" account.NAME1 LIKE '%" + StringUtil.defaultString(sf.getAccount().getName1(), "") + "%' and ");//
	        		//sql.append(" account.MOBILE LIKE '%" + StringUtil.defaultString(sf.getAccount().getMobile(), "") + "%'");//
	        		sql.toString();//
	        List<Object> sqlPars = New.list();	        
	        if (StringUtil.isNotBlank(sf.getAccount().getName1())) {
	            sql.append(" and account.NAME1 LIKE ? ");
	            sqlPars.add("%"+sf.getAccount().getName1()+"%" );
	        }
	
	        QueryInfoBuilder builder = QueryInfoBuilder.ins(sql.toString()).sqlPars(sqlPars) //
	              // .andContains("manager.SERVE_CITY", sf.getServeCity())// 经理人服务地区
	                .andContains("manager.CODE1", sf.getCode1()) // 经理人工号
	                .andEq("manager.STATUS", sf.getStatus()) // 审核状态
	                .andEq("manager.ROLE_STATUS", sf.getRoleStatus()) // 角色状态
	                .andEq("manager.IS_HELPER", sf.getIsHelper())
	                ;
	        return builder;
	    }

	@Override
	public Object list(Wordblank searchForm, int start, int limit, List<Order> orders) {
	
		 QueryInfo queryInfo = prepareQuery(sf).order(orders).build();//进入查询
	        _list = sqlDao.list(queryInfo.getSql(), start, limit, Manager.class, queryInfo.getParArr());//查出集合

	}
	
}