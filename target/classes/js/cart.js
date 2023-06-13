

$('.btn-cong, .btn-tru').on('click', function() {
	//$ thisđối tương html đang tác động
	//parent() selector ra doi tuong html cha gan nhat
	//find(selector) tim doi tuong html
	let type = $(this).attr('data-type');
	console.log(type);
	let parent = $(this).parent();
	let input_slg = parent.find('.input_slg');
	//get value input trong jquery
	let slg = input_slg.val();
	if (type == "cong") {
		slg = parseInt(slg) + 1;
	} else {
		if (slg > 1) {
			slg = parseInt(slg) - 1;
		}
	}

	//set lai gia tri cho input
	input_slg.val(slg);

	let price = input_slg.attr('data-price');
	let total_sp = slg * price;

	//selector ra doi tuonwg cha bat ki
	let parents = $(this).parents('.action');
	parents.find('.total').text(formatPrice(total_sp));
	let total = totalPrice();
	$('#total-price').text(formatPrice(total) + "VNĐ")
});


$('.btn-xoa').on('click', function() {
	$(this).parents('.row').remove();
	let total = totalPrice();
	$('#total-price').text(formatPrice(total) + 'VND')
})


function formatPrice(total) {
	return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
}

function totalPrice() {
	let total = 0;
	//duyet doi tuong html dang duoc select
	$('.slg_sp').each(function() {
		let slg = $(this).find('.input_slg').val();
		let price = $(this).find('.input_slg').attr('data-price');
		let total_sp_1 = slg * price;
		total = total + parseInt(total_sp_1);
	})
	return total;
}
