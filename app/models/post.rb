class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :category, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy

  enum status: {draft: 0, share: 1}

  validates_each :image do |record, attr, value|
    if record.status == "share"
      record.errors.add(attr, '：「画像」を選択してください。') if record.image.blank?
    end
  end

  validates_each :caption do |record, attr, value|
    if record.status == "share"
      record.errors.add(attr, '：200文字以内で入力してください。') if record.caption.length > 200
    end
  end

  validates_each :category_id do |record, attr, value|
    if record.status == "share"
      record.errors.add(attr, '：「カテゴリー」を選択してください。') if record.category_id.nil?
    end
  end

  #投稿の写真がなかった場合（Active Storage）
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  #いいねの確認
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  #キーワード検索
  def self.search_for(content)
      self.where('caption LIKE?', '%' + content + '%')
  end

  #ハッシュタグを先頭の'#'を外した上で保存
  after_create do
    post = Post.find_by(id: self.id)
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.tags = []
    tags.uniq.map do |tag|
      hashtag = Tag.find_or_create_by(hashname: tag.downcase.delete('#'))
      post.tags << hashtag
    end
  end

  #ハッシュタグを先頭の'#'を外した上で更新
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
