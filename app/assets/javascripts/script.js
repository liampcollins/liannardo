function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data
  })
}

function updateLikes(button, post){
  console.log("button")
  if($(button).hasClass("liked_status")){
    post.children('.likes').html(parseInt(post.children('.likes').html()) +1)
  }else{
    post.children('.likes').html(parseInt(post.children('.likes').html()) -1)
  }
}

function updateHates(button, post){
  console.log("button")
  if($(button).hasClass("hated_status")){
    post.children('.hates').html(parseInt(post.children('.hates').html()) +1)
  }else{
    post.children('.hates').html(parseInt(post.children('.hates').html()) -1)
  }
}

function toggleLike(){
  console.log("like")
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: true, post_id: id}}).success(function(){
  $this.toggleClass("liked_status").toggleClass("unchecked_status")
  }).success(function(){
    updateLikes($this, $post)
  })
}




function toggleHate(){
  $this = $(this)
  $post = $this.parent().parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: false, post_id: id}}).success(function(){
    console.log("success")
    $this.toggleClass("hated_status").toggleClass("unchecked_status")
  }).success(function(){
    updateHates($this, $post)
  })
}



function updateFollowcount(button, post){
  console.log("button")
  if($(button).hasClass("following")){
    $('.follower_count').html(parseInt($('.follower_count').text()) +1)
  }else{
    $('.follower_count').html(parseInt($('.follower_count').text())-1)
  }
}

function updateFollow(){
  console.log("hello world")

  $('.follow').toggleClass('following')
    if ($('.follow').text() == "Follow") {
      $('.follow').text("Following")
    }else{
      $('.follow').text("Follow")
    }
}



function toggleFollow(){
  $this = $(this)
  $user_id = parseInt($(this).next().text())
  if ($(this).text() == 'Follow') {
    var data={user:{user_id: $user_id, follow: false}}
  } else {
    var data={user:{user_id: $user_id, follow: true}}
  }
  request("PUT", "/members/"+$user_id, data).success(updateFollow($this)).success(
    updateFollowcount($this)
  )
}




// function rePost(){
//   console.log("respost")
//   $this = $(this)
//   $post = $this.parent().parent()

// get post details (publisher, content, likes, hates)
// append to the top of the list of your tweets on your profile page
//If your followers don't follow publisher post to their timelines too
// }
  
$(function(){
  $('.like').on('click', toggleLike);
  $(".hate").on('click', toggleHate);
  //$(".repost").on('click', rePost);
  $(".not_following").on('click', toggleFollow);
  $(".following").on('click', toggleFollow);
  //$('button').tooltip();
})






