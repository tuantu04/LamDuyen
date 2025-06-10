package com.example.WebAoDai.controller;

import com.example.WebAoDai.entity.Product;
import com.example.WebAoDai.entity.ProductDto;
import com.example.WebAoDai.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }


    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestParam("name") String name,
                                                 @RequestParam("file") MultipartFile file) {
        try {
            Product product = productService.createProduct(name, file);
            return ResponseEntity.ok(product);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    @GetMapping
    public ResponseEntity<List<ProductDto>> getProducts() {
        try {
            List<Product> products = productService.getProducts();

            List<ProductDto> productDtos = products.stream()
                    .map(this::convertToDto)
                    .toList();

            return ResponseEntity.ok(productDtos);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }


    @PostMapping("/try-on")
    public ResponseEntity<String> tryOnClothes(@RequestParam("productId") Integer productId,
                                               @RequestParam("selfie") MultipartFile selfie) {
        try {
            String resultUrl = productService.tryOnClothes(productId, selfie);
            return ResponseEntity.ok(resultUrl);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error processing the try-on request");
        }
    }
    public ProductDto convertToDto(Product product) {
        ProductDto dto = new ProductDto();
        dto.setId(product.getId());
        dto.setProduct_Name(product.getProduct_Name());
        dto.setDescription(product.getDescription());
        dto.setSold(product.getSold());
        dto.setAvatar(product.getAvatar());
        dto.setIsActive(product.getIsActive());
        dto.setCreated_At(product.getCreated_At());
        dto.setPrice(product.getPrice());
        dto.setQuantity(product.getQuantity());
        return dto;
    }

}
