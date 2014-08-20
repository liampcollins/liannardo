
function rePost(){
  console.log("respost")
  $this = $(this)
  $post = $this.parent().parent()

  id = parseInt($post.children('.id').html())
  request("POST", "/posts", {post:{repost_id: id}}).success(console.log("success"))
// get post id,save along with new post id in posts db
// append to the top of the list of your tweets on your profile page
// If your followers don't follow publisher post to their timelines too
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