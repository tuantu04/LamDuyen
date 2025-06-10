package com.example.WebAoDai.repository;

import com.example.WebAoDai.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CartRepository extends JpaRepository<Cart,Integer>{

	List<Cart> findAllByUserId(Long user_id);
	
}
