

function appendNewPost($post){

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
});