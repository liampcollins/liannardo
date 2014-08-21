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
  request("GET", "/posts?postId="+postId).success(function(data){
    // setting the last posts id to postId
    postId = data.latestpost
    if(data.count > 0){
      count = count + data.count
    }
    $('.new_post_count').text('You have '+count+' new posts')
    console.log(data, count,'second')
  });
  // $("<p>Johanna</p>").appendTo(".follow")
}

function findLastPostId(){
  var findLastPost = request("GET", "/posts").success(function(data){
    // setting the last posts id to postId
    console.log(data, count,'fisrst')
    postId = data.latestpost
    setInterval(findNewPosts, 6000);
  });
}

findLastPostId()



// var myIntervalTime = 3000;
