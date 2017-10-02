$(document).on('turbolinks:load', function(){
  $("#modal").on('show.bs.modal', function (event) {
    var img = $(event.relatedTarget) //image that trigger modal
    takeImageInfo(img.data("id"))
  })
  $("#blog-cover").change(function(){
    readURL(this);
});
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

function readURL(input) {
  
      if (input.files && input.files[0]) {
          var reader = new FileReader();
  
          reader.onload = function (e) {
              $('#preview').attr('src', e.target.result);
          }
  
          reader.readAsDataURL(input.files[0]);
      }
  }
  
  
