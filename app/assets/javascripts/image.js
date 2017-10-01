$(document).ready(function(){
  $("#modal").on('show.bs.modal', function (event) {
    var img = $(event.relatedTarget) //image that trigger modal
    var imgDes = $("#modalImg")
    imgDes.attr("src", img.attr("src"))
    takeImageInfo(img.data("id"))
  })
})


function takeImageInfo(id){
  $.get("/images/" + id).done(function(result){
    $("#modalContent").html(
    gravatar(result.user, 60) + 
    '<h5><a href="/users/'+ result.user.id +'">'
    + result.user.name + '</a></h5> '+
    '<div>Views: '+ result.image.views +'</div>')
    $("#modalViews").text() 
  })
}

function gravatar(user, size){
  gravatar_id = $.md5(user.email.toLowerCase());
  gravatar_link = "http://www.gravatar.com/avatar/" + gravatar_id + "?s=" + size;
  return '<img src="' + gravatar_link + '" class="gravatar"/>';
}