//posts#show
$(function() {
  document.addEventListener("turbolinks:load", function(){
    $('#answer-btn').click(function() {
      $('#answer').slideToggle();
    });

    $('.f__show__c').click(function() {
      var index = $('.f__show__c').index(this);
      $('.f__show__c__main').eq(index).slideToggle('fast');
    });
  });
});


