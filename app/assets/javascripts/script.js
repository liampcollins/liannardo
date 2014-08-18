function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

// function listPosts(data) {
  
// }




function toggleLike(){
  console.log("like")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: true, post_id: id}}).success(console.log("success")).success(function(){
    $this.toggleClass("liked_status")
  })
}


function toggleHate(){
  console.log("hate")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: false, post_id: id}}).success(console.log("success")).success(function(){
    $this.toggleClass("hated_status")
  })
}
  
$(function(){
  $('.like').on('click', toggleLike);
  $(".hate").on('click', toggleHate);
})






