function updateReposts(button, post){
  console.log("button")
  if($(button).hasClass("reposted")){
    post.children('.reposts').html(parseInt(post.children('.reposts').html()) +1)
  }else{
    post.children('.reposts').html(parseInt(post.children('.reposts').html()) -1)
  }
}

function rePost(){
  console.log("respost")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/posts", {post:{repost_id: id}}).success(console.log("success")).success(function(){
    $this.toggleClass("not_reposted").toggleClass("reposted")
    }).success(function(){
      updateReposts($this, $post)
  })
}


function postForm(e){
  e.preventDefault()
  console.log("postForm")
  $this = $(this)
  $post = $this.parent()
  content = $post.children('input').val()
  request("POST", "/posts", {post:{content: content}}).success(console.log("success")).success(function(){
    appendNewPost($post)
  })

}

$(document).ready(function() {
    $('#myModal .btn-primary').on("click", postForm);
    $(".repost").on('click', rePost);

});