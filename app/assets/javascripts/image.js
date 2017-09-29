$(document).on('show.bs.modal', function (event) {
    var img = $(event.relatedTarget) // Button that triggered the modal
    var imgDes = $("#modalImg")
    imgDes.attr("src", img.attr("src"))
    takeImageInfo(img.data("id"))
})

function takeImageInfo(id){
  $.get("/images/" + id).done(function(result){
    console.log(result)
    $("#modalUser").text(result.user.name)
    $("#modalViews").text("Views: "+ result.image.views) 
  })
}