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

		// L???y th??ng tin kh??ch h??ng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");

		// t???o h??a ????n + v???i th??ng tin kh??ch h??ng l???y ???????c
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // m?? h??a ????n
		
		// l???y gi??? h??ng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int total= (int) session.getAttribute("totalPrice");
		saleOrder.setTotal(BigDecimal.valueOf(total));
		// l???y s???n ph???m trong gi??? h??ng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// s??? d???ng h??m ti???n ??ch add ho???c remove ?????i v???i c??c quan h??? onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// l??u v??o database
		saleOrderService.saveOrUpdate(saleOrder);

		// th???c hi???n reset l???i gi??? h??ng c???a Session hi???n t???i
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		session.setAttribute("totalPrice", 0);

		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(saleOrder.getCustomerEmail());
		message.setSubject("C???m ??n");
		message.setText("Hello " + saleOrder.getCustomerName()
				+ ", Selena c???m ??n b???n ???? mua h??ng v?? mong r???ng b???n s??? lu??n lu??n ???ng h??? c??c s???n ph???m c???a ch??ng t??i.");

		// Send Message!
		this.emailSender.send(message);

		return "customer/checkout"; // -> ???????ng d???n t???i View.

	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// ????? l???y session s??? d???ng th??ng qua request
		HttpSession session = request.getSession();

		// L???y th??ng tin gi??? h??ng. ?????u ti??n gi??? s??? gi??? h??ng l?? null(ch??a c?? gi??? h??ng)
		Cart cart = null;

		// ki???m tra xem session c?? t???n t???i ?????i t?????ng n??o t??n l?? "cart"
		if (session.getAttribute("cart") != null) { // t???n t???i 1 gi??? h??ng tr??n session
			cart = (Cart) session.getAttribute("cart");
		} else {// ch??a c?? gi??? h??ng n??o tr??n session
			cart = new Cart(); // kh???i t???o gi??? h??ng m???i
			session.setAttribute("cart", cart);
		}

		// L???y danh s??ch s???n ph???m ??ang c?? trong gi??? h??ng
		List<CartItem> cartItems = cart.getCartItems();

		// ki???m tra n???u s???n ph???m mu???n b??? s??ng v??o gi??? h??ng c?? trong gi??? h??ng n???u c?? th??
		// t??ng s??? l?????ng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// t??ng s??? l?????ng s???n ph???m l??n
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// n???u s???n ph???m ch??a c?? trong gi??? h??ng th?? th???c hi???n add s???n ph???m ???? v??o gi???
		// h??ng
		if (!isExists) {
			// tr?????c khi th??m m???i th?? l???y s???n ph???m trong db
			// v?? thi???t l???p t??n + ????n gi?? cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());
			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setProductAvatar(productInDb.getAvatar());
			cart.getCartItems().add(cartItem); // th??m m???i s???n ph???m v??o gi??? h??ng
		}
		session.setAttribute("totalPrice", getTotalPrice(request));

		// tr??? v??? k???t qu???
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

		// tr??? v??? k???t qu???
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	/**
	 * h??m tr??? v??? s??? l?????ng s???n ph???m c?? trong gi??? h??ng
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
