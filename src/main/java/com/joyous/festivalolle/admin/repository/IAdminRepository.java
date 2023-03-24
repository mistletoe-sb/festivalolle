package com.joyous.festivalolle.admin.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.admin.model.AdminVO;


public interface IAdminRepository {
	AdminVO adminLogin(@Param("id") String id, @Param("password") String password);

}
