(function($){
    $(document).on("dataColumnsLoaded",function(){
        $(".column-nav-item").each(function(){
            var t=$(this),
                 a=t.find(".attribution").text(),
                 d=t.children("a"),
                 i = $(".compose-account[title='"+a+"'] img").eq(0).clone().toggleClass("compose-account-img size48").prependTo(d);
            if(i.length) t.addClass("hasAvatar")
        })
    })
})(jQuery)
