package com.example.ground.dto;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SocialDTO {
	private int section;
	private int idx;
	private String groundname;
	private String age;
	private String gender;
	private int count;
	private String way;
	private Date matchdate;
	private String filename;
	private int price;
	private String address;
	private int sex;
}
