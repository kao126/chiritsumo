class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # def render_with_hashtags(caption)
  #   caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, post_tag_path}
  # end


  #ハッシュタグを先頭の'#'を外した上で保存
  after_create do
    post = Post.find_by(id: self.id)
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      hashtag = Tag.find_or_create_by(hashname: tag.downcase.delete('#'))
      post.tags << hashtag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      hashtag = Tag.find_or_create_by(hashname: tag.downcase.delete('#'))
      post.tags << hashtag
    end
  end


end
