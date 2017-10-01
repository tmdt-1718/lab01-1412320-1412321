$(document).ready(function(){
  $("#modal").on('show.bs.modal', function (event) {
    var img = $(event.relatedTarget) //image that trigger modal
    takeImageInfo(img.data("id"))
  })
})


function takeImageInfo(id){
  $.get("/images/" + id).done(function(result){
    var imgDes = $("#modalImg")
    imgDes.attr("src", result.image.url.url);
    $("#modalContent").html(
    gravatar(result.user, 60) + 
    '<h5><a href="/users/'+ result.user.id +'">'
    + result.user.name + '</a></h5> '+
    '<div>Views: '+ result.image.views +'</div>' +
    '<form method="post" id="album-cover" action="/users/' + result.user.id +
    '/albums/' + result.image.album_id + '/cover">' +
    '<input type="hidden" name="image_id" value="' + result.image.id +'">' +
    '</form>' + '<a href="#" id="changeCover">Set album cover</a>' )
    $("#changeCover").click(function(){
      $("#album-cover").submit();
    })
  })
}

function gravatar(user, size){
  gravatar_id = $.md5(user.email.toLowerCase());
  gravatar_link = "http://www.gravatar.com/avatar/" + gravatar_id + "?s=" + size;
  return '<img src="' + gravatar_link + '" class="gravatar"/>';
}
