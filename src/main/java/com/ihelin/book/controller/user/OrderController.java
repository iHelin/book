package com.ihelin.book.controller.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Book;
import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.manager.OrderManager;
import com.ihelin.book.utils.JSON;
import com.ihelin.book.utils.ResponseUtil;

@Controller
@RequestMapping("user")
public class OrderController extends BaseController {
	@Resource
	private BookManager bookManager;
	@Resource
	private OrderManager orderManager;

	public BigDecimal deliveryFee = new BigDecimal(10.00);

	@RequestMapping("buy_now")
	public String makeSureOrder(Integer id, Integer number, Model model) {
		Book book = bookManager.selectBookById(id);
		OrderItem orderItem = new OrderItem();
		orderItem.setBookId(book.getId());
		orderItem.setBookName(book.getBookName());
		orderItem.setBookPrice(book.getPromotionPrice());
		orderItem.setDeliveryFee(deliveryFee);
		orderItem.setNumber(number);
		BigDecimal totalMoney = book.getPromotionPrice().multiply(new BigDecimal(number)).add(deliveryFee);
		if (book.getIsFreePostage()) {
			model.addAttribute("isFreePostage", true);
			totalMoney = totalMoney.subtract(deliveryFee);
		}
		orderItem.setTotalMoney(totalMoney);
		model.addAttribute("orderItem", orderItem);
		return UserFtl("buy_now");
	}
	
	@RequestMapping("pay")
	public String pay(){
		return UserFtl("pay");
	}
	
	@RequestMapping("pay_success")
	public String paySuccess(){
		return UserFtl("pay_success");
	}

	@RequestMapping("submit_order")
	public void submitOrder(Integer bookId, String bookName, BigDecimal bookPrice, Integer number,
			BigDecimal totalMoney, BigDecimal deliveryFee,HttpServletResponse response) {
		OrderItem orderItem = new OrderItem();
		orderItem.setBookId(bookId);
		orderItem.setBookName(bookName);
		orderItem.setBookPrice(bookPrice);
		orderItem.setNumber(number);
		orderItem.setTotalMoney(totalMoney);
		orderItem.setDeliveryFee(deliveryFee);
		orderManager.insertOrderItem(orderItem);
		OrderPayGroup opg = new OrderPayGroup();
		opg.setCreateTime(new Date());
		opg.setCreatorId(getAccount().getId());
		List<String> oidList = new ArrayList<String>();
		oidList.add(orderItem.getId() + "");
		String[] oids = oidList.toArray(new String[oidList.size()]);
		opg.setOrderIds(JSON.toJson(oids));
		opg.setTotalMoney(orderItem.getTotalMoney());
		orderManager.insertOrderPayGroup(opg);
		Map<String,Object> oMap = new HashMap<String, Object>();
		oMap.put("oid", opg.getId());
		ResponseUtil.writeSuccessJSON(response,oMap);
	}

}
