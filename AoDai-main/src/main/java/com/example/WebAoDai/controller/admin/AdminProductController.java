package com.example.WebAoDai.controller.admin;

import com.example.WebAoDai.entity.Category;
import com.example.WebAoDai.entity.Product;
import com.example.WebAoDai.entity.ProductDto;
import com.example.WebAoDai.repository.CategoryRepository;
import com.example.WebAoDai.repository.ProductRepository;
import com.example.WebAoDai.repository.UserRepository;
import com.example.WebAoDai.service.CloudinaryService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CloudinaryService cloudinaryService;

    // Hiển thị danh sách sản phẩm
    @GetMapping("")
    public String productPage(Model model,
                              @RequestParam(value = "categoryId", required = false) Long categoryId,
                              @RequestParam(value = "status", required = false) Integer status,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "size", defaultValue = "5") int size) {

        List<Product> products = productRepository.findAll();

        if (categoryId != null) {
            products = products.stream()
                    .filter(p -> p.getCategory() != null && p.getCategory().getId() == categoryId)
                    .collect(Collectors.toList());
        }

        if (status != null) {
            products = products.stream()
                    .filter(p -> p.getIsActive() != null && p.getIsActive().equals(status))
                    .collect(Collectors.toList());
        }

        int totalItems = products.size();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        int start = page * size;
        int end = Math.min(start + size, totalItems);

        List<ProductDto> productDtos = products.subList(start, end).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());

        model.addAttribute("products", productDtos);
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("status", status);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "admin/product/list";
    }


    @GetMapping("/insert")
    public String insertProductPage(Model model) {
        model.addAttribute("product", new ProductDto());
        model.addAttribute("categories", categoryRepository.findAllByStatus(1));
        return "admin/product/insert";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("product") ProductDto dto,
                       @RequestParam("img") MultipartFile img) {
        Product product = convertToEntity(dto);

        product.setIsActive(1);
        product.setCreated_At(new java.sql.Date(System.currentTimeMillis()));

        if (dto.getCategoryId() != null) {
            categoryRepository.findById(dto.getCategoryId())
                    .ifPresent(product::setCategory);
        }

        if (img != null && !img.isEmpty()) {
            String imgUrl = cloudinaryService.uploadFile(img);
            product.setAvatar(imgUrl);
        }

        productRepository.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable("id") Integer id, Model model) {
        Optional<Product> optional = productRepository.findById(id);
        if (optional.isPresent()) {
            ProductDto dto = convertToDto(optional.get());
            model.addAttribute("product", dto);
            model.addAttribute("categories", categoryRepository.findAllByStatus(1));
            return "admin/product/update";
        } else {
            return "redirect:/admin/product";
        }
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("product") ProductDto dto,
                         @RequestParam(value = "img", required = false) MultipartFile img) {
        Product product = productRepository.findById(dto.getId())
                .orElseThrow(() -> new IllegalArgumentException("Sản phẩm không tồn tại"));

        product.setProduct_Name(dto.getProduct_Name());
        product.setDescription(dto.getDescription());
        product.setQuantity(dto.getQuantity());
        product.setPrice(dto.getPrice());
        product.setIsActive(dto.getIsActive());
        product.setSold(dto.getSold());

        if (dto.getCategoryId() != null) {
            categoryRepository.findById(dto.getCategoryId())
                    .ifPresent(product::setCategory);
        }

        System.out.println("Before update avatar: " + product.getAvatar());

        if (img != null && !img.isEmpty()) {
            String imgUrl = cloudinaryService.uploadFile(img);
            product.setAvatar(imgUrl);
        }

        System.out.println("After update avatar: " + product.getAvatar());

        productRepository.save(product);

        return "redirect:/admin/product/update/" + dto.getId();
    }




    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        productRepository.deleteById(id);
        return "redirect:/admin/product";
    }

    private ProductDto convertToDto(Product product) {
        ProductDto dto = new ProductDto();
        dto.setId(product.getId());
        dto.setProduct_Name(product.getProduct_Name());
        dto.setDescription(product.getDescription());
        dto.setQuantity(product.getQuantity());
        dto.setPrice(product.getPrice());
        dto.setAvatar(product.getAvatar());
        dto.setIsActive(product.getIsActive());
        dto.setCreated_At(product.getCreated_At());
        dto.setSold(product.getSold());

        if (product.getCategory() != null) {
            dto.setCategoryId(product.getCategory().getId());
            dto.setCategoryName(product.getCategory().getName());
        }

        return dto;
    }

    private Product convertToEntity(ProductDto dto) {
        Product product = new Product();
        product.setId(dto.getId());
        product.setProduct_Name(dto.getProduct_Name());
        product.setDescription(dto.getDescription());
        product.setQuantity(dto.getQuantity());
        product.setPrice(dto.getPrice());
        product.setIsActive(dto.getIsActive());
        product.setCreated_At(dto.getCreated_At());
        product.setSold(dto.getSold());

        if (dto.getCategoryId() != null) {
            categoryRepository.findById(dto.getCategoryId())
                    .ifPresent(product::setCategory);
        }

        return product;
    }

}
