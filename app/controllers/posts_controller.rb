class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 12)
  end
  
  def new
    @post = Post.new
    
    @select_option = [
    ['北海道地方', [
        ['北海道',   '北海道'],
      ]
    ],
    ['東北地方', [
        ['青森県',    '青森県'],
        ['岩手県',   '岩手県'],
        ['宮城県',   '宮城県'],
        ['秋田県',   '秋田県'],
        ['山形県',   '山形県'],
        ['福島県',   '福島県'],
      ]
    ],
    ['関東地方', [
        ['茨城県',    '茨城県'],
        ['栃木県',   '栃木県'],
        ['群馬県',   '群馬県'],
        ['埼玉県',   '埼玉県'],
        ['千葉県',   '千葉県'],
        ['東京都',   '東京都'],
        ['神奈川県',   '神奈川県'],
      ]
    ],
    ['中部地方', [
        ['新潟県',    '新潟県'],
        ['富山県',   '富山県'],
        ['石川県',   '石川県'],
        ['福井県',   '福井県'],
        ['山梨県',   '山梨県'],
        ['長野県',   '長野県'],
        ['岐阜県',   '岐阜県'],
        ['静岡県',   '静岡県'],
        ['愛知県',   '愛知県'],
      ]
    ],
    ['近畿地方', [
        ['三重県',    '三重県'],
        ['滋賀県',   '滋賀県'],
        ['京都府',   '京都府'],
        ['大阪府',   '大阪府'],
        ['兵庫県',   '兵庫県'],
        ['奈良県',   '奈良県'],
        ['和歌山県',   '和歌山県'],
      ]
    ],
    ['中国地方', [
        ['鳥取県',    '鳥取県'],
        ['島根県',   '島根県'],
        ['岡山県',   '岡山県'],
        ['広島県',   '広島県'],
        ['山口県',   '山口県'],
      ]
    ],
    ['四国地方', [
        ['徳島県',    '徳島県'],
        ['香川県',   '香川県'],
        ['愛媛県',   '愛媛県'],
        ['高知県',   '高知県'],
      ]
    ],
    ['九州地方', [
        ['福岡県',    '福岡県'],
        ['佐賀県',   '佐賀県'],
        ['長崎県',   '長崎県'],
        ['熊本県',   '熊本県'],
        ['大分県',   '大分県'],
        ['宮崎県',   '宮崎県'],
        ['鹿児島県',   '鹿児島県'],
      ]
    ],
    ['沖縄地方', [
        ['沖縄県',    '沖縄県'],
      ]
    ],
  ]
  
  end
  

  def create
    @post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
  end
  
  
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
  end
  
  
  
  private

  	def post_params
  		params.require(:post).permit(:name, :body, :prefecture)
  	end
  
end
