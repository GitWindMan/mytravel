(function ($) {
    $.learuntab = {
        requestFullScreen: function () {
            var de = document.documentElement;
            if (de.requestFullscreen) {
                de.requestFullscreen();
            } else if (de.mozRequestFullScreen) {
                de.mozRequestFullScreen();
            } else if (de.webkitRequestFullScreen) {
                de.webkitRequestFullScreen();
            }
        },
        exitFullscreen: function () {
            var de = document;
            if (de.exitFullscreen) {
                de.exitFullscreen();
            } else if (de.mozCancelFullScreen) {
                de.mozCancelFullScreen();
            } else if (de.webkitCancelFullScreen) {
                de.webkitCancelFullScreen();
            }
        },
        refreshTab: function () {
            var currentId = $('.page-tabs-content').find('.active').attr('data-id');
            var target = $('.LRADMS_iframe[data-id="' + currentId + '"]');
            var url = target.attr('src');
            //$.loading(true);
            target.attr('src', url).load(function () {
                //$.loading(false);
            });
        },
        activeTab: function () {
            var currentId = $(this).data('id');
            if (!$(this).hasClass('active')) {
                $('.mainContent .LRADMS_iframe').each(function () {
                    if ($(this).data('id') == currentId) {
                        $(this).show().siblings('.LRADMS_iframe').hide();
                        return false;
                    }
                });
                $(this).addClass('active').siblings('.menuTab').removeClass('active');
                $.learuntab.scrollToTab(this);
            }
        },
        closeOtherTabs: function () {
            $('.page-tabs-content').children("[data-id]").find('.fa-remove').parents('a').not(".active").each(function () {
                $('.LRADMS_iframe[data-id="' + $(this).data('id') + '"]').remove();
                $(this).remove();
            });
            $('.page-tabs-content').css("margin-left", "0");
        },
        closeTab: function () {
            var closeTabId = $(this).parents('.menuTab').data('id');
            var currentWidth = $(this).parents('.menuTab').width();
            if ($(this).parents('.menuTab').hasClass('active')) {
                if ($(this).parents('.menuTab').next('.menuTab').size()) {
                    var activeId = $(this).parents('.menuTab').next('.menuTab:eq(0)').data('id');
                    $(this).parents('.menuTab').next('.menuTab:eq(0)').addClass('active');

                    $('.mainContent .LRADMS_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.LRADMS_iframe').hide();
                            return false;
                        }
                    });
                    var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                    if (marginLeftVal < 0) {
                        $('.page-tabs-content').animate({
                            marginLeft: (marginLeftVal + currentWidth) + 'px'
                        }, "fast");
                    }
                    $(this).parents('.menuTab').remove();
                    $('.mainContent .LRADMS_iframe').each(function () {
                        if ($(this).data('id') == closeTabId) {
                            $(this).remove();
                            return false;
                        }
                    });
                }
                if ($(this).parents('.menuTab').prev('.menuTab').size()) {
                    var activeId = $(this).parents('.menuTab').prev('.menuTab:last').data('id');
                    $(this).parents('.menuTab').prev('.menuTab:last').addClass('active');
                    $('.mainContent .LRADMS_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.LRADMS_iframe').hide();
                            return false;
                        }
                    });
                    $(this).parents('.menuTab').remove();
                    $('.mainContent .LRADMS_iframe').each(function () {
                        if ($(this).data('id') == closeTabId) {
                            $(this).remove();
                            return false;
                        }
                    });
                }
            }
            else {
                $(this).parents('.menuTab').remove();
                $('.mainContent .LRADMS_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
                $.learuntab.scrollToTab($('.menuTab.active'));
            }
            return false;
        },
        addTab: function () {
            $(".navbar-custom-menu>ul>li.open").removeClass("open");
            var dataId = $(this).attr('data-id');
            if (dataId != "") {
                //top.$.cookie('nfine_currentmoduleid', dataId, { path: "/" });
            }
            var dataUrl = $(this).attr('href');
            var menuName = $.trim($(this).text());
            var flag = true;
            if (dataUrl == undefined || $.trim(dataUrl).length == 0) {
                return false;
            }
            $('.menuTab').each(function () {
                if ($(this).data('id') == dataUrl) {
                    if (!$(this).hasClass('active')) {
                        $(this).addClass('active').siblings('.menuTab').removeClass('active');
                        $.learuntab.scrollToTab(this);
                        $('.mainContent .LRADMS_iframe').each(function () {
                            if ($(this).data('id') == dataUrl) {
                                $(this).show().siblings('.LRADMS_iframe').hide();
                                return false;
                            }
                        });
                    }
                    flag = false;
                    return false;
                }
            });
            if (flag) {
                var str = '<a href="javascript:;" class="active menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-remove"></i></a>';
                $('.menuTab').removeClass('active');
                var str1 = '<iframe class="LRADMS_iframe" id="iframe' + dataId + '" name="iframe' + dataId + '"  width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
                $('.mainContent').find('iframe.LRADMS_iframe').hide();
                $('.mainContent').append(str1);
                //$.loading(true);
                $('.mainContent iframe:visible').load(function () {
                    //$.loading(false);
                });
                $('.menuTabs .page-tabs-content').append(str);
                $.learuntab.scrollToTab($('.menuTab.active'));
            }
            return false;
        },
        scrollTabRight: function () {
            var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
            var tabOuterWidth = $.learuntab.calSumWidth($(".content-tabs").children().not(".menuTabs"));
            var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
            var scrollVal = 0;
            if ($(".page-tabs-content").width() < visibleWidth) {
                return false;
            } else {
                var tabElement = $(".menuTab:first");
                var offsetVal = 0;
                while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).next();
                }
                offsetVal = 0;
                while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).next();
                }
                scrollVal = $.learuntab.calSumWidth($(tabElement).prevAll());
                if (scrollVal > 0) {
                    $('.page-tabs-content').animate({
                        marginLeft: 0 - scrollVal + 'px'
                    }, "fast");
                }
            }
        },
        scrollTabLeft: function () {
            var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
            var tabOuterWidth = $.learuntab.calSumWidth($(".content-tabs").children().not(".menuTabs"));
            var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
            var scrollVal = 0;
            if ($(".page-tabs-content").width() < visibleWidth) {
                return false;
            } else {
                var tabElement = $(".menuTab:first");
                var offsetVal = 0;
                while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).next();
                }
                offsetVal = 0;
                if ($.learuntab.calSumWidth($(tabElement).prevAll()) > visibleWidth) {
                    while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                        offsetVal += $(tabElement).outerWidth(true);
                        tabElement = $(tabElement).prev();
                    }
                    scrollVal = $.learuntab.calSumWidth($(tabElement).prevAll());
                }
            }
            $('.page-tabs-content').animate({
                marginLeft: 0 - scrollVal + 'px'
            }, "fast");
        },
        scrollToTab: function (element) {
            var marginLeftVal = $.learuntab.calSumWidth($(element).prevAll()), marginRightVal = $.learuntab.calSumWidth($(element).nextAll());
            var tabOuterWidth = $.learuntab.calSumWidth($(".content-tabs").children().not(".menuTabs"));
            var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
            var scrollVal = 0;
            if ($(".page-tabs-content").outerWidth() < visibleWidth) {
                scrollVal = 0;
            } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
                if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                    scrollVal = marginLeftVal;
                    var tabElement = element;
                    while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                        scrollVal -= $(tabElement).prev().outerWidth();
                        tabElement = $(tabElement).prev();
                    }
                }
            } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
                scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
            }
            $('.page-tabs-content').animate({
                marginLeft: 0 - scrollVal + 'px'
            }, "fast");
        },
        calSumWidth: function (element) {
            var width = 0;
            $(element).each(function () {
                width += $(this).outerWidth(true);
            });
            return width;
        },
        init: function () {
            $('.menuItem').on('click', $.learuntab.addTab);
            $('.menuTabs').on('click', '.menuTab i', $.learuntab.closeTab);
            $('.menuTabs').on('click', '.menuTab', $.learuntab.activeTab);
            $('.tabLeft').on('click', $.learuntab.scrollTabLeft);
            $('.tabRight').on('click', $.learuntab.scrollTabRight);
            $('.tabReload').on('click', $.learuntab.refreshTab);
            $('.tabCloseCurrent').on('click', function () {
                $('.page-tabs-content').find('.active i').trigger("click");
            });
            $('.tabCloseAll').on('click', function () {
                $('.page-tabs-content').children("[data-id]").find('.fa-remove').each(function () {
                    $('.LRADMS_iframe[data-id="' + $(this).data('id') + '"]').remove();
                    $(this).parents('a').remove();
                });
                $('.page-tabs-content').children("[data-id]:first").each(function () {
                    $('.LRADMS_iframe[data-id="' + $(this).data('id') + '"]').show();
                    $(this).addClass("active");
                });
                $('.page-tabs-content').css("margin-left", "0");
            });
            $('.tabCloseOther').on('click', $.learuntab.closeOtherTabs);
            $('.fullscreen').on('click', function () {
                if (!$(this).attr('fullscreen')) {
                    $(this).attr('fullscreen', 'true');
                    $.learuntab.requestFullScreen();
                } else {
                    $(this).removeAttr('fullscreen')
                    $.learuntab.exitFullscreen();
                }
            });
        }
    };
    $.learunindex = {
        load: function () {
            $("body").removeClass("hold-transition")
            $("#content-wrapper").find('.mainContent').height($(window).height() - 100);
            $(window).resize(function (e) {
                $("#content-wrapper").find('.mainContent').height($(window).height() - 100);
            });
            $(".sidebar-toggle").click(function () {
                if (!$("body").hasClass("sidebar-collapse")) {
                    $("body").addClass("sidebar-collapse");
                } else {
                    $("body").removeClass("sidebar-collapse");
                }
            })
            $(window).load(function () {
                window.setTimeout(function () {
                    $('#ajax-loader').fadeOut();
                }, 300);
            });
        },
        jsonWhere: function (data, action) {
            if (action == null) return;
            var reval = new Array();
            $(data).each(function (i, v) {
                if (action(v)) {
                    reval.push(v);
                }
            })
            return reval;
        },
        loadMenu: function () {
        	var data = [
    					{
    						"F_ModuleId" : "1",
    						"F_ParentId" : "0",
    						"F_EnCode" : "SysManage",
    						"F_FullName" : "用户组管理",
    						"F_Icon" : "fa fa-desktop",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 1,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2015-11-17 11:22:46",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "7ae94059-9aa5-48eb-8330-4e2a6565b193",
    						"F_ParentId" : "1",
    						"F_EnCode" : "AreaManage",
    						"F_FullName" : "用户管理",
    						"F_Icon" : "fa fa-leaf",
    						"F_UrlAddress" : "user!list.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 1,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "行政区域管理",
    						"F_CreateDate" : "2015-11-12 14:38:20",
    						"F_CreateUserId" : "System",
    						"F_CreateUserName" : "超级管理员",
    						"F_ModifyDate" : "2016-04-29 14:05:33",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "66f6301c-1789-4525-a7d2-2b83272aafa6",
    						"F_ParentId" : "ad147f6d-613f-4d2d-8c84-b749d0754f3b",
    						"F_EnCode" : "ClientChance",
    						"F_FullName" : "用户留言",
    						"F_Icon" : "fa fa-binoculars",
    						"F_UrlAddress" : "gbook!userList.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 2,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "商机管理",
    						"F_CreateDate" : "2016-03-11 11:55:16",
    						"F_CreateUserId" : "0f36148c-719f-41e0-8c8c-16ffbc40d0e0",
    						"F_CreateUserName" : "佘赐雄",
    						"F_ModifyDate" : "2016-04-29 14:19:13",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "2",
    						"F_ParentId" : "0",
    						"F_EnCode" : "BaseManage",
    						"F_FullName" : "商家信息管理",
    						"F_Icon" : "fa fa-coffee",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 2,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-03-11 11:02:06",
    						"F_ModifyUserId" : "0f36148c-719f-41e0-8c8c-16ffbc40d0e0",
    						"F_ModifyUserName" : "佘赐雄"
    					},
    					{
    						"F_ModuleId" : "4efd37bf-e3ef-4ced-8248-58eba046d78b",
    						"F_ParentId" : "1",
    						"F_EnCode" : "DataItemManage",
    						"F_FullName" : "添加用户",
    						"F_Icon" : "fa fa-book",
    						"F_UrlAddress" : "pages/user-add.jsp",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 2,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "通用数据字典",
    						"F_CreateDate" : "2015-11-12 14:37:04",
    						"F_CreateUserId" : "System",
    						"F_CreateUserName" : "超级管理员",
    						"F_ModifyDate" : "2016-04-29 14:06:26",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "5",
    						"F_ParentId" : "0",
    						"F_EnCode" : "FlowManage",
    						"F_FullName" : "景点信息管理",
    						"F_Icon" : "fa fa-share-alt",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 3,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-04-11 10:21:44",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "11",
    						"F_ParentId" : "2",
    						"F_EnCode" : "RoleManage",
    						"F_FullName" : "商家信息",
    						"F_Icon" : "fa fa-paw",
    						"F_UrlAddress" : "trader!list.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 3,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-05-23 18:12:29",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "021a59b0-2589-4f9e-8140-6052177a967c",
    						"F_ParentId" : "5",
    						"F_EnCode" : "景点管理",
    						"F_FullName" : "景点管理",
    						"F_Icon" : "fa fa-file-word-o",
    						"F_UrlAddress" : "place!list.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 3,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : "2016-03-19 13:32:54",
    						"F_CreateUserId" : "24a055d6-5924-44c5-be52-3715cdd68011",
    						"F_CreateUserName" : "陈彬彬",
    						"F_ModifyDate" : "2016-03-22 20:02:21",
    						"F_ModifyUserId" : "24a055d6-5924-44c5-be52-3715cdd68011",
    						"F_ModifyUserName" : "陈彬彬"
    					},
    					{
    						"F_ModuleId" : "0d296398-bc0e-4f38-996a-6e24bc88cc53",
    						"F_ParentId" : "5",
    						"F_EnCode" : "添加景点",
    						"F_FullName" : "添加景点",
    						"F_Icon" : "fa fa-hourglass-half",
    						"F_UrlAddress" : "pages/place-add.jsp",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 4,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : "2015-11-23 22:13:39",
    						"F_CreateUserId" : "System",
    						"F_CreateUserName" : "超级管理员",
    						"F_ModifyDate" : "2016-03-23 18:07:42",
    						"F_ModifyUserId" : "24a055d6-5924-44c5-be52-3715cdd68011",
    						"F_ModifyUserName" : "陈彬彬"
    					},
    					{
    						"F_ModuleId" : "6",
    						"F_ParentId" : "0",
    						"F_EnCode" : "ReportManage",
    						"F_FullName" : "优惠信息管理",
    						"F_Icon" : "fa fa-area-chart",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 4,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-04-11 10:21:54",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "4",
    						"F_ParentId" : "0",
    						"F_EnCode" : "CommonInfo",
    						"F_FullName" : "游记信息管理",
    						"F_Icon" : "fa fa-globe",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 5,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-04-11 10:21:59",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "13",
    						"F_ParentId" : "2",
    						"F_EnCode" : "PostManage",
    						"F_FullName" : "添加商家",
    						"F_Icon" : "fa fa-graduation-cap",
    						"F_UrlAddress" : "pages/trader-add.jsp",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 5,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : null,
    						"F_CreateDate" : null,
    						"F_CreateUserId" : null,
    						"F_CreateUserName" : null,
    						"F_ModifyDate" : "2016-04-29 11:59:17",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "9db71a92-2ecb-496c-839f-7a82bc22905d",
    						"F_ParentId" : "6",
    						"F_EnCode" : "MoneyReport",
    						"F_FullName" : "优惠管理",
    						"F_Icon" : "fa fa-pie-chart",
    						"F_UrlAddress" : "news!list.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 5,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "现金银行报表",
    						"F_CreateDate" : "2016-01-04 16:31:03",
    						"F_CreateUserId" : "0f36148c-719f-41e0-8c8c-16ffbc40d0e0",
    						"F_CreateUserName" : "佘赐雄",
    						"F_ModifyDate" : "2016-04-29 14:16:09",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "c6b80ed5-b0cb-4844-ba1a-725d2cb4f935",
    						"F_ParentId" : "4",
    						"F_EnCode" : "游记管理",
    						"F_FullName" : "游记管理",
    						"F_Icon" : "fa fa-send",
    						"F_UrlAddress" : "note!list.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 6,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "邮件管理",
    						"F_CreateDate" : "2015-11-27 09:48:38",
    						"F_CreateUserId" : "System",
    						"F_CreateUserName" : "超级管理员",
    						"F_ModifyDate" : "2016-04-21 15:06:31",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "ad147f6d-613f-4d2d-8c84-b749d0754f3b",
    						"F_ParentId" : "0",
    						"F_EnCode" : "CustomerManage",
    						"F_FullName" : "留言信息管理",
    						"F_Icon" : "fa fa-briefcase",
    						"F_UrlAddress" : null,
    						"F_Target" : "expand",
    						"F_IsMenu" : 0,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 6,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "客户关系管理",
    						"F_CreateDate" : "2016-03-11 10:53:05",
    						"F_CreateUserId" : "0f36148c-719f-41e0-8c8c-16ffbc40d0e0",
    						"F_CreateUserName" : "佘赐雄",
    						"F_ModifyDate" : "2016-04-21 16:00:07",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					},
    					{
    						"F_ModuleId" : "dec79ca7-3b54-432a-be1e-c96e7a2c7150",
    						"F_ParentId" : "ad147f6d-613f-4d2d-8c84-b749d0754f3b",
    						"F_EnCode" : "ClienCashBalanceReport",
    						"F_FullName" : "商家留言",
    						"F_Icon" : "fa fa-bar-chart",
    						"F_UrlAddress" : "gbook!traderList.action",
    						"F_Target" : "iframe",
    						"F_IsMenu" : 1,
    						"F_AllowExpand" : 1,
    						"F_IsPublic" : 0,
    						"F_AllowEdit" : null,
    						"F_AllowDelete" : null,
    						"F_SortCode" : 9,
    						"F_DeleteMark" : 0,
    						"F_EnabledMark" : 1,
    						"F_Description" : "收支报表",
    						"F_CreateDate" : "2016-04-28 15:12:16",
    						"F_CreateUserId" : "System",
    						"F_CreateUserName" : "超级管理员",
    						"F_ModifyDate" : "2016-05-27 16:29:15",
    						"F_ModifyUserId" : "System",
    						"F_ModifyUserName" : "超级管理员"
    					}, ];
			var _html = "";
            $.each(data, function (i) {
                var row = data[i];
                if (row.F_ParentId == "0") {
                    if (i == 0) {
                        _html += '<li class="treeview active">';
                    } else {
                        _html += '<li class="treeview">';
                    }
                    _html += '<a href="javascript:;">'
                    _html += '<i class="' + row.F_Icon + '"></i><span>' + row.F_FullName + '</span><i class="fa fa-angle-left pull-right"></i>'
                    _html += '</a>'
                    var childNodes = $.learunindex.jsonWhere(data, function (v) { return v.F_ParentId == row.F_ModuleId });
                    if (childNodes.length > 0) {
                        _html += '<ul class="treeview-menu">';
                        $.each(childNodes, function (i) {
                            var subrow = childNodes[i];
                            var subchildNodes = $.learunindex.jsonWhere(data, function (v) { return v.F_ParentId == subrow.F_ModuleId });
                            _html += '<li>';
                            if (subchildNodes.length > 0) {
                                _html += '<a href="#"><i class="' + subrow.F_Icon + '"></i>' + subrow.F_FullName + '';
                                _html += '<i class="fa fa-angle-left pull-right"></i></a>';
                                _html += '<ul class="treeview-menu">';
                                $.each(subchildNodes, function (i) {
                                    var subchildNodesrow = subchildNodes[i];
                                    _html += '<li><a class="menuItem" data-id="' + subrow.F_ModuleId + '" href="' + subrow.F_UrlAddress + '"><i class="' + subchildNodesrow.F_Icon + '"></i>' + subchildNodesrow.F_FullName + '</a></li>';
                                });
                                _html += '</ul>';

                            } else {
                                _html += '<a class="menuItem" data-id="' + subrow.F_ModuleId + '" href="' + subrow.F_UrlAddress + '"><i class="' + subrow.F_Icon + '"></i>' + subrow.F_FullName + '</a>';
                            }
                            _html += '</li>';
                        });
                        _html += '</ul>';
                    }
                    _html += '</li>'
                }
            });
            $("#sidebar-menu").append(_html);
            $("#sidebar-menu li a").click(function () {
                var d = $(this), e = d.next();
                if (e.is(".treeview-menu") && e.is(":visible")) {
                    e.slideUp(500, function () {
                        e.removeClass("menu-open")
                    }),
                    e.parent("li").removeClass("active")
                } else if (e.is(".treeview-menu") && !e.is(":visible")) {
                    var f = d.parents("ul").first(),
                    g = f.find("ul:visible").slideUp(500);
                    g.removeClass("menu-open");
                    var h = d.parent("li");
                    e.slideDown(500, function () {
                        e.addClass("menu-open"),
                        f.find("li.active").removeClass("active"),
                        h.addClass("active");

                        var _height1 = $(window).height() - $("#sidebar-menu >li.active").position().top - 41;
                        var _height2 = $("#sidebar-menu li > ul.menu-open").height() + 10
                        if (_height2 > _height1) {
                            $("#sidebar-menu >li > ul.menu-open").css({
                                overflow: "auto",
                                height: _height1
                            })
                        }
                    })
                }
                e.is(".treeview-menu");
            });
        }
    };
    $(function () {
        $.learunindex.load();
        $.learunindex.loadMenu();
        $.learuntab.init();
    });
})(jQuery);