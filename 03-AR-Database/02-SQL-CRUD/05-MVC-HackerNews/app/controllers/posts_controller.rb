class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @View.list_all_posts(Post.all)
  end

  def create
    # TODO: implement creating a new post
    # create a Post.new instace
    id = @View.ask_for_input("id")
    url = @View.ask_for_input("url")
    title = @View.ask_for_input("title")
    votes = @View.ask_for_input("votes")


  end

  def update
    # TODO: implement updating an existing post
#update_exist_post
  end

  def destroy
    # TODO: implement destroying a post
#destroy_a_post

  end

  def upvote
    # TODO: implement upvoting a post
#upvote_a_post
  end
end
