function AddProductToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, 	// Id sản phẩm
		quanlity: quanlity, 	// Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}