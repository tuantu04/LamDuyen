package com.example.WebAoDai.entity;

import java.sql.Date;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "product_Name", columnDefinition = "nvarchar(1111)")
	private String product_Name;

	@Column(name = "description", columnDefinition = "nvarchar(11111)")
	private String description;

	@Column(name = "sold")
	private int sold;
	private String avatar;

	@Column(name = "is_Active")
	private Integer isActive;

	@Column(name = "created_At")
	private Date created_At;

	@Column(name = "price")
	private int price;

	@Column(name = "quantity")
	private Long quantity;

	@ManyToOne
	@JoinColumn(name = "category_id")
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	@JsonBackReference
	private Category category;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	@JsonManagedReference // <- tránh load vòng lặp không cần thiết
	private List<Order_Item> order_items;


	public List<CategorySize> getAllSizes() {
		return category.getCategorySizes();
	}

	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", product_Name='" + product_Name + '\'' +
				", description='" + description + '\'' +
				", sold=" + sold +
				", avatar='" + avatar + '\'' +
				", isActive=" + isActive +
				", created_At=" + created_At +
				", price=" + price +
				", quantity=" + quantity +
				'}';
	}
}
