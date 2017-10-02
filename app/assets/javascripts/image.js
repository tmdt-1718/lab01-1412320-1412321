$(document).on('turbolinks:load', function(){
  $("#modal").on('show.bs.modal', function (event) {
    var img = $(event.relatedTarget) //image that trigger modal
    takeImageInfo(img.data("id"))
  })
})


function takeImageInfo(id){
  $.get("/images/" + id).done(function(result){
    var imgDes = $("#modalImg")
    imgDes.attr("src", result.image.url.url);
    $("#modalContent").html(result.html)
    $("#changeCover").click(function(){
      $("#album-cover").submit();
    })
    $("#triggerDelete").click(function(){
      return confirm("Are really want to delete this photo?");
    })
  })
}


function gravatar(user, size){
  gravatar_id = $.md5(user.email.toLowerCase());
  gravatar_link = "http://www.gravatar.com/avatar/" + gravatar_id + "?s=" + size;
  return '<img src="' + gravatar_link + '" class="gravatar"/>';
}
