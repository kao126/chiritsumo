class Customer < ApplicationRecord
  after_initialize :set_default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :is_deleted, on: :withdraw , acceptance: { message: 'チェックを入れてください' }

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  #ゲストログイン情報の生成
  def self.guest
    find_or_create_by!(username: 'guest123', email: 'guest@example.com') do |guest|
      guest.password = SecureRandom.urlsafe_base64
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
    self.prefecture_code + self.address_city + self.address_street + "　" + self.address_building
  end

end
