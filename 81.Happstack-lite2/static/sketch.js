$(function() {
  function postData() {
    let msg = $("#msg").val();
    console.log("posting: " + msg);
   
    $.post("./", {"msg": msg}, data => {
      console.log("response: " + data); 
      $("#result").text(data);
    });
  }

  $("#button").click(postData);
  $("#msg").keypress(e => {
    if (e.which == 13) {
      postData();
    }
  });
});