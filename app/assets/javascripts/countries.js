$(function() {
  $(".checkbox").click(function() {
    $(this).closest("form").submit();
  });
});
