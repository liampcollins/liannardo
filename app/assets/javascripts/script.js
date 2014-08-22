var postId;
var count = 0;

function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data
  })
}

function findNewPosts(){
  request("GET", "/posts").success(console.log("success")).success(function(data){
    console.log("here")
    console.log(data, count,'second')
    if(data != 0){
    $('.new_post_count').text('You have new posts')
    }
  })
}

function checkForNewPosts(){
    setInterval(findNewPosts, 6000);
}

checkForNewPosts()

function updateLikes(button, post){
  console.log("button")
  if($(button).hasClass("liked_status")){
    post.children('.post_second_col').children('.likes').html(parseInt(post.children('.post_second_col').children('.likes').html()) +1)
  }else{
    post.children('.post_second_col').children('.likes').html(parseInt(post.children('.post_second_col').children('.likes').html()) -1)
  }
}

// GERRYS CODE, WORKS BUT HAVE TO REFACTOR OTHER STUFF TO COPE
// function updateLikes(button, post){
//   console.log("button")
//   if($(button).hasClass("liked_status")){
//     post.prev().children(".likes").html(parseInt(post.prev().children(".likes").html()) +1)
//   }else{
//     post.prev().children(".likes").html(parseInt(post.prev().children(".likes").html()) -1)
//   }
// }

function updateHates(button, post){
  console.log("button", button)
  if($(button).hasClass("hated_status")){
      post.children('.post_second_col').children('.hates').html(parseInt(post.children('.post_second_col').children('.hates').html()) +1)
    }else{
      post.children('.post_second_col').children('.hates').html(parseInt(post.children('.post_second_col').children('.hates').html()) -1)
    }
}

function UpdateScoreIcon($row){
  if($row.children('.post_first_col').children('.user_score').html() > 0){
    $($row.children('.post_first_col').children('.score_icon').children('img')).attr('src', "https://blogs.glowscotland.org.uk/wl/stniniansps/files/2013/02/star_12.jpg")
  }else{
    $($row.children('.post_first_col').children('.score_icon').children('img')).attr('src', "http://www.clickforsign.com/cw4/images/product_expanded/Danger-Warning-Trs-052.jpg")
  }
}

function UpdateScoreForHate(button, post, feed){
  console.log("button")
  if($(button).hasClass("hated_status")){
    feed.children().each(function(){
      $row = $(this)
      if($($row.children('.post_first_col').children('.name_td')).children('a').text()== $(post.children('.post_first_col').children('.name_td')).children('a').text()){
        $row.children('.post_first_col').children('.user_score').html(parseInt($row.children('.post_first_col').children('.user_score').html()) -1)}
        UpdateScoreIcon($row)
    })
  }else{feed.children().each(function(){
      $row = $(this)
      if($($row.children('.post_first_col').children('.name_td')).children('a').text()== $(post.children('.post_first_col').children('.name_td')).children('a').text()){
        $row.children('.post_first_col').children('.user_score').html(parseInt($row.children('.post_first_col').children('.user_score').html()) +1)}
        UpdateScoreIcon($row)
    })
  }
}

function UpdateScoreForLike(button, post, feed){
  console.log("button")
  if($(button).hasClass("liked_status")){
    feed.children().each(function(){
      $row = $(this)
      if($($row.children('.post_first_col').children('.name_td')).children('a').text()== $(post.children('.post_first_col').children('.name_td')).children('a').text()){
        $row.children('.post_first_col').children('.user_score').html(parseInt($row.children('.post_first_col').children('.user_score').html()) +1)}
        UpdateScoreIcon($row)
    })
  }else{feed.children().each(function(){
      $row = $(this)
      if($($row.children('.post_first_col').children('.name_td')).children('a').text()== $(post.children('.post_first_col').children('.name_td')).children('a').text()){
        $row.children('.post_first_col').children('.user_score').html(parseInt($row.children('.post_first_col').children('.user_score').html()) -1)}
        UpdateScoreIcon($row)
    })
  }
}

function toggleLike(){
  console.log("like")
  $this = $(this)
  $post = $this.parent().parent().parent()
  $feed = $post.parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: true, post_id: id}
  }).success(function(){
  $this.toggleClass("liked_status").toggleClass("unchecked_status")
  }).success(function(){
    updateLikes($this, $post)
  }).success(function(){
    UpdateScoreForLike($this, $post, $feed)
  })
}

function toggleHate(){
  $this = $(this)
  $post = $this.parent().parent().parent()
  $feed = $post.parent()
  id = parseInt($post.children('.id').html())
  request("POST", "/votes", {vote:{sentiment: false, post_id: id}
  }).success(function(){
    console.log("success")
    $this.toggleClass("hated_status").toggleClass("unchecked_status")
  }).success(function(){
    updateHates($this, $post)
  }).success(function(){
    UpdateScoreForHate($this, $post, $feed)
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
    post.children('.post_third_col').children('.reposts').html(parseInt(post.children('.post_third_col').children('.reposts').html()) +1)
  }else{
    post.children('.post_third_col').children('.reposts').html(parseInt(post.children('.post_third_col').children('.reposts').html()) -1)
  }
}

function rePost(){
  console.log("respost")
  $this = $(this)
  $post = $this.parent().parent().parent()
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






