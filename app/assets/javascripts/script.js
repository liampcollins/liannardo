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



function UpdateScoreForHate(button, post, table){
  console.log("button")
  if($(button).hasClass("hated_status")){
    table.children().each(function(){
      $row = $(this)
      if($($row.children('td')[1]).children('a').text()== $(post.children('td')[1]).children('a').text()){
        $row.children('.user_score').html(parseInt($row.children('.user_score').html()) -1)
      }
    })
  }else{table.children().each(function(){
      $row = $(this)
      if($($row.children('td')[1]).children('a').text()== $(post.children('td')[1]).children('a').text()){
        $row.children('.user_score').html(parseInt($row.children('.user_score').html()) +1)
      }
    })
  }
}


function UpdateScoreForLike(button, post, table){
  console.log("button")
  if($(button).hasClass("liked_status")){
    table.children().each(function(){
      $row = $(this)
      if($($row.children('td')[1]).children('a').text()== $(post.children('td')[1]).children('a').text()){
        $row.children('.user_score').html(parseInt($row.children('.user_score').html()) +1)
      }
    })
  }else{table.children().each(function(){
      $row = $(this)
      if($($row.children('td')[1]).children('a').text()== $(post.children('td')[1]).children('a').text()){
        $row.children('.user_score').html(parseInt($row.children('.user_score').html()) -1)
      }
    })
  }
}



function toggleLike(){
  console.log("like")
  $this = $(this)
  $post = $this.parent().parent()
  $table = $post.parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: true, post_id: id}
  }).success(function(){
  $this.toggleClass("liked_status").toggleClass("unchecked_status")
  }).success(function(){
    updateLikes($this, $post)
  }).success(function(){
    UpdateScoreForLike($this, $post, $table)
  })
}




function toggleHate(){
  $this = $(this)
  $post = $this.parent().parent()
  $table = $post.parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: false, post_id: id}
  }).success(function(){
    console.log("success")
    $this.toggleClass("hated_status").toggleClass("unchecked_status")
  }).success(function(){
    updateHates($this, $post)
  }).success(function(){
    UpdateScoreForHate($this, $post, $table)
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
  
$(function(){
  $('.like').on('click', toggleLike);
  $(".hate").on('click', toggleHate);
  //$(".repost").on('click', rePost);
  $(".not_following").on('click', toggleFollow);
  $(".following").on('click', toggleFollow);
  $('#myModal .btn-primary').on("click", postForm);
  $(".repost").on('click', rePost);
  //$('button').tooltip();
})






