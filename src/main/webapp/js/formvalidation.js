$(function() {
	//Parsley Form Validation
    //While the JS is not usually required in Parsley, we will be modifying
    //the default classes so it plays well with Bootstrap
    $('.myform').parsley({
        successClass: 'has-success',
        errorClass: 'has-error',
        errors: {
            classHandler: function(el) {
                return $(el).closest('.form-group,.am-form-group');
            },
            errorsWrapper: '<ul class=\"help-block list-unstyled\"></ul>',
            errorElem: '<li></li>'
        },
	    messages: {
            defaultMessage: "此栏填写似乎不合格式。",
            type: {
                email: "请填写正确的 Email 格式。",
                url: "请填写正确的 URL。",
                urlstrict: "请填写正确的 URL。",
                number: "请填写数字。",
                digits: "请填写数字。",
                dateIso: "请按年-月-日 (YYYY-MM-DD) 的格式填写。",
                alphanum: "请填写字母。",
                phone: "请填写正确的电话号码。"
            },
            notnull: "此栏不能留空。",
            notblank: "此栏不能留空。",
            required: "此栏不能留空。",
            regexp: "请填写正确的金额。",
            min: "此栏的值必须大于等于 %s。",
            max: "此栏的值必须小于等于 %s。",
            range: "此栏的值必须介于 %s 和 %s 之间。",
            minlength: "输入过少，必须输入 %s 个以上字符。",
            maxlength: "输入过多，必须输入 %s 个以下字符。",
            rangelength: "输入的长度不正确，必须介于 %s 与 %s 个字符之间。",
            mincheck: "必须至少选择 %s 项。",
            maxcheck: "最多选择 %s 项。",
            rangecheck: "必须选择 %s 至 %s 个选项。",
            equalto: "输入必须相同。"
        }
    });
});