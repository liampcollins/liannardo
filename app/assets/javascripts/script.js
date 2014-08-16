function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}



function addLike(){
  console.log("like")
}


function addHate(){
  console.log("hate")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: false post_id: id user_id: current_user.id}}).success(console.log("success"))
  
}


$(function(){
  $('.like').on('click', addLike);
  $(".hate").on('click', addHate);
})