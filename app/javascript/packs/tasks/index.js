$(document).on("turbolinks:load", function () {
  $("#check").on("click", function () {
    if ($(this).prop("checked") == true) {
      $("#unfinished_form").submit();
    }
  });
});
