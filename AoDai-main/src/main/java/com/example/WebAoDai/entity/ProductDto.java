package com.example.WebAoDai.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Data
public class ProductDto {
	private int id;
	private String product_Name;
	private String description;
	private int sold;
	private String avatar;
	private Integer isActive;
	private Date created_At;
	private int price;
	private Long quantity;
	private Integer categoryId;
	private String categoryName;

}
