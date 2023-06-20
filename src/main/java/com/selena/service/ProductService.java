package com.selena.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.selena.model.Categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.selena.dto.ProductSearch;
import com.selena.model.BaseEntity;
import com.selena.model.Product;
import com.selena.model.ProductImages;
import com.selena.repository.ProductRepository;


@Service
public class ProductService extends BaseService<Product> {
	@Autowired
	private ProductImagesService productImagesService;

	@Autowired
	ProductRepository productRepository;


	public Page<Product> findAll(Pageable pageable) {
		return (Page<Product>) productRepository.findAll(pageable);
	}

	public Page<Product> findByCate(Categories categories,Pageable pageable) {
		return productRepository.findByCategories(categories,pageable);
	}
	
	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * 
	 * @param images
	 * @return
	 */
	
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * 
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}

	@Transactional
	public Product saveProduct(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());

			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			product.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages productImages = new ProductImages();
				productImages.setPath("product/pictures/" + fileName);
				productImages.setTitle(fileName);

				product.addProductImages(productImages);
			}
		}

		

		// lưu vào database
		return super.saveOrUpdate(product);

	}
	
	@Transactional
	public Product updateProduct(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id đang có trong database
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar cũ trong folder
			new File("C:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("C:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu của image cho sản phẩm đang sửa trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				p.addProductImages(pi);
			}
		}

		
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	public PagerData<Product> searchProduct(ProductSearch productSearch) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1 ";
	
		if (productSearch != null) {
			
			// tìm kiếm theo category
			if(productSearch.getCategoryId() != null && productSearch.getCategoryId() > 0) {
				sql += " and category_id = " + productSearch.getCategoryId();
			}
		
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(productSearch.getKeyword())) {
				sql += " and (p.title like '%" + productSearch.getKeyword() + "%'" + 
						     " or p.detail_description like '%" + productSearch.getKeyword() + "%'" + 
						     " or p.short_description like '%" + productSearch.getKeyword() + "%')";
			}
		}

		return super.getEntitiesByNativeSQL(sql+" ORDER BY p.id DESC", productSearch.getCurrentPage());
	}


	public List<Product> searchProductByName(String name) {
		return productRepository.searchProduct(name);
	}


	@Transactional
	public void deleteProduct(int id) {
		Product product = productRepository.findById(id).get();
		productRepository.delete(product);
	}
}
