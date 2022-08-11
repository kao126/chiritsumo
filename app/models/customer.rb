class Customer < ApplicationRecord
  after_initialize :set_default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include JpPrefecture
  jp_prefecture :prefecture_code

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :last_name, format: { with: /\A[一-龥]+\z/, message: "には漢字を入力ください。" }, allow_blank: true
  validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: "には漢字/ひらがなを入力ください。" }, allow_blank: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "にはカタカナを入力ください。" }, allow_blank: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "にはカタカナを入力ください。" }, allow_blank: true
  validates :username, presence: true, uniqueness: true, length: { in: 6..20 }, format: { with: /\A[\w@-]*[A-Za-z][\w@-]*\z/, message: "には半角英数字記号[@_-]を入力ください。" }
  validates :introduction, length: { maximum: 100 }, allow_blank: true
  validates :telephone_number, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "にはハイフンを入力してください。" }, allow_blank: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "にはハイフンを入力してください。" }, allow_blank: true


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  #ゲストログイン情報の生成
  def self.guest
    find_or_create_by!(username: 'guest123', email: 'guest@example.com') do |guest|
      guest.password = SecureRandom.urlsafe_base64
      guest.prefecture_code = '13'
    end
  end

  # データがない場合に空文字を入れる
  def set_default_values
    self.last_name  ||= ''
    self.first_name ||= ''
    self.last_name_kana ||= ''
    self.first_name_kana ||= ''
    self.prefecture_code ||= ''
    self.address_city ||= ''
    self.address_street ||= ''
    self.address_building ||= ''
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def address
    if prefecture_code.present?
      self.prefecture.name + self.address_city + self.address_street + "　" + self.address_building
    else
      self.prefecture_code + self.address_city + self.address_street + "　" + self.address_building
    end
  end

end
