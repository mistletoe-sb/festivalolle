package com.joyous.festivalolle.admin.model;

import lombok.Data;

@Data
public class EmailVO {
	private String subject;
	private String content;
	private String receiver;

}
