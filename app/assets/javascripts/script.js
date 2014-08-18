function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

function updateLikes(which_like, which_post){
  console.log("which_like")
  if($(which_like).hasClass("liked_status")){
    which_post.children('.likes').html(parseInt(which_post.children('.likes').html()) +1)
  }else{
    which_post.children('.likes').html(parseInt(which_post.children('.likes').html()) -1)
  }
}

function toggleLike(){
  console.log("like")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: true, post_id: id}}).success(function(){
  $this.toggleClass("liked_status")
  }).success(function(){
    updateLikes($this, $post)
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






