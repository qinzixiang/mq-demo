package com.mark.demo.shiro.service;

import java.util.List;

import com.mark.demo.shiro.base.PaginateResult;
import com.mark.demo.shiro.base.Pagination;
import com.mark.demo.shiro.entity.Menu;
import com.mark.demo.shiro.entity.User;

/*
*hxp(hxpwangyi@126.com)
*2017年9月8日
*
*/
public interface UserService {
	List<Menu> getMenuTopLever();
	PaginateResult<User> findPage(Pagination page, User entity);

}
