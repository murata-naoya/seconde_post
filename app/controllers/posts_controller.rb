class PostsController < ApplicationController
  
  def new
  end

  def create
    post = Post.new(post_params)
    post.title = params[:title]
    post.channel = params[:channel]
    post.body = params[:body]
    # if post.title.present? && post.channel.present? && post.body.present?
      notifier = Slack::Notifier.new(ENV['SLACK_API'],
        channel: '#tech',
        user_name: 'ELITE CAMP事務局',
      )
      attachments = {
        fallback: "",
        title: "【#{post.title}】",
        text: "#{post.body}",
        color: 'good'
      }
      notifier.post text: "<!channel>\n", attachments: attachments
      redirect_to post_done_path
    # else
      # flash[:notice] = "投稿できませんでした。内容を確認してください。"
      # render "new"
    # end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.permit(:title, :channel, :body)
  end
end
