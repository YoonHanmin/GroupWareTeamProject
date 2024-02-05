package com.green.teamproject_groupware.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatterUtil {
	public static String formattedDate(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
	}
}
