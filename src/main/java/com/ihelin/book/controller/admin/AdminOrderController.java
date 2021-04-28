package com.ihelin.book.controller.admin;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.utils.ResponseUtil;
import com.ihelin.book.view.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminOrderController extends BaseController {

    @RequestMapping("order_manage")
    public String orderManage(Model model, Integer pageNum) {
        if (pageNum == null)
            pageNum = 1;
        List<OrderPayGroup> orderGroups = orderManager.selectOpgByCondition(null, null, 0, PAGE_LENGTH);
        List<OrderItem> subOrders = new ArrayList<OrderItem>();
        for (OrderPayGroup orderPayGroup : orderGroups) {
            String oids = orderPayGroup.getOrderIds();
            JSONArray oidList = JSONUtil.parseArray(oids);
            for (int i = 0; i < oidList.size(); i++) {
                subOrders.add(orderManager.selectOrderItemById(oidList.getInt(i)));
            }
        }
        int totalCount = orderManager.listOpgCount(null, null);
        model.addAttribute("orderGroups", orderGroups);
        model.addAttribute("subOrders", subOrders);
        model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
        return AdminFtl("order");
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

}
