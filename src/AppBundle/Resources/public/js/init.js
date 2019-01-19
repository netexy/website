(function($){
  $(function(){

    // Plugin initialization
    $(".dropdown-trigger").dropdown();
    $('.tabs').tabs();
    $('select').formSelect();
    $('input#input_text, textarea#textarea2').characterCounter();
    $('.modal').modal();

    // Swipeable Tabs Demo Init
    if ($('#tabs-swipe-demo').length) {
      $('#tabs-swipe-demo').tabs({ 'swipeable': true });
    }    
    
  }); // end of document ready
})(jQuery); // end of jQuery name space
