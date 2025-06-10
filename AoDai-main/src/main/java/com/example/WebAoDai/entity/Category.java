package com.example.WebAoDai.entity;

import java.util.Collection;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import lombok.*;


@Entity // Đánh dấu đây là table trong db
@Data // lombok giúp generate các hàm constructor, get, set v.v.
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "category_Name", columnDefinition = "nvarchar(1111)")
	private String name;

	private Integer status;

	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
	@JsonManagedReference
	@ToString.Exclude
	private List<Product> product;

	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	private List<CategorySize> categorySizes;
}