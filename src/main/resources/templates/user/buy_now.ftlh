<#import "../frame.ftlh" as main>
<@main.page title="确认订单">
    <div class="am-g am-g-fixed book-g-fixed">
        <div class="am-u-md-12">
            <div class="am-panel am-panel-default" style="margin-top:20px">
                <table class="am-table am-table-hover table-main">
                    <thead>
                    <tr class="am-danger">
                        <th class="am-text-center">书名</th>
                        <th class="am-text-center">单价(元)</th>
                        <th class="am-text-center">数量</th>
                        <th class="am-text-center">优惠方式(元)</th>
                        <th class="am-text-center">小计(元)</th>
                    </tr>
                    </thead>
                    <tbody class="am-text-center">
                    <#if orderItem??>
                        <tr>
                            <td>${orderItem.bookName!}</td>
                            <td>${orderItem.bookPrice?string.currency}</td>
                            <td>${orderItem.number!}</td>
                            <td><#if isFreePostage??>免邮费<#else>运费：${orderItem.deliveryFee!?string.currency}</#if></td>
                            <td>${orderItem.totalMoney?string.currency}</td>
                        </tr>
                    </#if>
                    <tr class="am-primary">
                        <td colspan="5" class="am-text-right"><span>合计（含运费）：<strong
                                        style="font-size:30px;color:#ff4400">${orderItem.totalMoney?string.currency}</strong></span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <form class="" id="order_form">
                <input type="hidden" name="bookId" value="#{orderItem.bookId!}"/>
                <input type="hidden" name="bookName" value="${orderItem.bookName!}"/>
                <input type="hidden" name="bookPrice" value="${orderItem.bookPrice!}"/>
                <input type="hidden" name="number" value="${orderItem.number!}"/>
                <input type="hidden" name="totalMoney" value="${orderItem.totalMoney!}"/>
                <input type="hidden" name="isFreePostage" <#if isFreePostage??>value="true"
                       <#else>value="false"</#if> />
                <input type="hidden" name="deliveryFee" value="${orderItem.deliveryFee!}"/>
            </form>
            <div class="am-fr">
                <button class="am-btn am-btn-warning" onclick="submitOrder()">提交订单</button>
            </div>
        </div>
    </div>
</@main.page>
<script>
    function submitOrder() {
        var index = layer.load(2, {
            shade: [0.3, '#000']
        });
        $.post('submit_order', $('#order_form').serialize(), function (data) {
            layer.close(index);
            if (data.status == 'success') {
                layer.msg("确认成功！");
                window.location.href = "pay?oid=" + data.oid;
                //window.location.href="pay_success";
            } else if (data.error == 'not_pay_order') {
                layer.msg("对不起，您还有未完成的订单!");
            }
        });
    }
</script>
