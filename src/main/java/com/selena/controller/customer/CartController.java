package com.selena.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.selena.controller.BaseController;
import com.selena.dto.Cart;
import com.selena.dto.CartItem;
import com.selena.model.Product;
import com.selena.model.SaleOrder;
import com.selena.model.SaleOrderProducts;
import com.selena.service.ProductService;
import com.selena.service.SaleOrderService;

@Controller
public class CartController extends BaseController {
	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	public JavaMailSender emailSender;

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cart(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "customer/cart";
	}

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "customer/cart"; //
	}

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int total= (int) session.getAttribute("totalPrice");
		saleOrder.setTotal(BigDecimal.valueOf(total));
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);

		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		session.setAttribute("totalPrice", 0);

		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(saleOrder.getCustomerEmail());
		message.setSubject("Cảm Ơn");
		message.setText("Hello " + saleOrder.getCustomerName()
				+ ", Selena cảm ơn bạn đã mua hàng và mong rằng bạn sẽ luôn luôn ủng hộ các sản phẩm của chúng tôi.");

		// Send Message!
		this.emailSender.send(message);

		return "customer/checkout"; // -> đường dẫn tới View.

	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;

		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); // khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì
		// tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ
		// hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());
			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setProductAvatar(productInDb.getAvatar());
			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}
		session.setAttribute("totalPrice", getTotalPrice(request));

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));


		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/DeleteCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DeleteCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
	
		Iterator<CartItem> iterator = cartItems.iterator();
	    while (iterator.hasNext()) {
	    	CartItem item = iterator.next();
	        if (item.getProductId() == cartItem.getProductId()) {
	            iterator.remove();
	            break;
	        }
	    }
		
		session.setAttribute("cart", cart);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	/**
	 * hàm trả về số lượng sản phẩm có trong giỏ hàng
	 */
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	private int getTotalPrice(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity() * item.getPriceUnit().intValue();
		}

		return total;
	}

}
