package com.ihelin.book.controller.user;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Book;
import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.filed.OrderStatus;
import com.ihelin.book.service.BookManager;
import com.ihelin.book.service.OrderManager;
import com.ihelin.book.utils.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("user")
public class OrderController extends BaseController {
    @Resource
    private BookManager bookManager;
    @Resource
    private OrderManager orderManager;

    public BigDecimal deliveryFee = new BigDecimal(10.00);

    @Resource
    private TransactionTemplate transactionTemplate;

    @Transactional
    public String wechatWood() {
        transactionTemplate.execute(new TransactionCallbackWithoutResult() {
            @Override
            protected void doInTransactionWithoutResult(TransactionStatus arg0) {
                Book book1 = bookManager.selectBookById(1);
                book1.setNumber(300);
                bookManager.updateBook(book1);
                //int a = 1 / 0;
                Book book2 = bookManager.selectBookById(1);
                book2.setNumber(300);
                bookManager.updateBook(book2);

            }
        });
        return "pc/wechat_wood";
    }

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
    public String pay(Integer oid, Model model) {
        model.addAttribute("oid", oid);
        return UserFtl("pay");
    }

    @RequestMapping("pay_success")
    public String paySuccess() {
        return UserFtl("pay_success");
    }

    @RequestMapping("delete_order")
    public void deleteOrder(Integer id, HttpServletResponse response) {
        if (id == null) {
            ResponseUtil.writeFailedJSON(response, "id_is_null");
            return;
        }
        orderManager.deleteOrderById(id);
        ResponseUtil.writeSuccessJSON(response);
    }

    @RequestMapping("payed")
    public void payed(Integer oid, HttpServletResponse response) {
        OrderPayGroup opg = orderManager.seleteOrderPayGroupById(oid);
        if (opg != null) {
            String oids = opg.getOrderIds();
            JSONArray oidList = JSONUtil.parseArray(oids);
            for (int i = 0; i < oidList.size(); i++) {
                OrderItem orderItem = orderManager.selectOrderItemById(oidList.getInt(i));
                Book book = bookManager.selectBookById(orderItem.getBookId());
                book.setNumber(book.getNumber() - orderItem.getNumber());
                bookManager.updateBook(book);
            }
            opg.setPayTime(new Date());
            opg.setStatus(OrderStatus.PAYED.getValue());
            orderManager.updateOrderPayGroup(opg);
            ResponseUtil.writeSuccessJSON(response);
        } else {
            ResponseUtil.writeFailedJSON(response, "opg_is_null");
        }
    }

    @RequestMapping("submit_order")
    public void submitOrder(Integer bookId, String bookName, BigDecimal bookPrice, Integer number,
                            BigDecimal totalMoney, BigDecimal deliveryFee, HttpServletResponse response, Boolean isFreePostage) {
        List<OrderPayGroup> oldOrders = orderManager.selectOpgByCondition(getAccount().getId(),
                OrderStatus.NOT_PAY.getValue(), 0, MAX_LENGTH);
        if (oldOrders.size() > 0) {
            ResponseUtil.writeFailedJSON(response, "not_pay_order");
            return;
        }
        OrderItem orderItem = new OrderItem();
        orderItem.setBookId(bookId);
        orderItem.setBookName(bookName);
        orderItem.setBookPrice(bookPrice);
        orderItem.setNumber(number);
        orderItem.setTotalMoney(totalMoney);
        if (isFreePostage)
            orderItem.setDeliveryFee(BigDecimal.ZERO);
        else
            orderItem.setDeliveryFee(deliveryFee);
        orderManager.insertOrderItem(orderItem);
        OrderPayGroup opg = new OrderPayGroup();
        opg.setCreateTime(new Date());
        opg.setCreatorId(getAccount().getId());
        List<String> oidList = new ArrayList<String>();
        oidList.add(orderItem.getId() + "");
        String[] oids = oidList.toArray(new String[oidList.size()]);
        opg.setOrderIds(JSONUtil.toJsonStr(oids));
        opg.setTotalMoney(orderItem.getTotalMoney());
        opg.setStatus(OrderStatus.NOT_PAY.getValue());
        orderManager.insertOrderPayGroup(opg);
        Map<String, Object> oMap = new HashMap<String, Object>();
        oMap.put("oid", opg.getId());
        ResponseUtil.writeSuccessJSON(response, oMap);
    }

}
