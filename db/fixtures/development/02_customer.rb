Customer.seed do |s|
  s.id = 1
  s.last_name = '田中'
  s.first_name = '一郎'
  s.last_name_kana = 'タナカ'
  s.first_name_kana = 'イチロウ'
  s.username = 'ichiro123'
  s.introduction = 'はじめました！'
  s.telephone_number = '01020003000'
  s.email = 'user1@gmail.com'
  s.password = '000000'
  s.postal_code = '0010001'
  s.prefecture_code = '東京都'
  s.address_city = '渋谷区松濤'
  s.address_street = '1-1'
  s.address_building = 'Ruby-on-rails 101号室'
  s.is_deleted = 'false'
  s.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/default-image.jpeg')),
                  filename: 'default-image.jpeg')
end

Customer.seed do |s|
  s.id = 2
  s.last_name = '佐藤'
  s.first_name = '次郎'
  s.last_name_kana = 'サトウ'
  s.first_name_kana = 'ジロウ'
  s.username = 'jiro_desu_234'
  s.introduction = '次郎です！'
  s.telephone_number = '02030004000'
  s.email = 'user2@gmail.com'
  s.password = '000000'
  s.postal_code = '0020002'
  s.prefecture_code = '神奈川県'
  s.address_city = '横浜市南区'
  s.address_street = '2-2'
  s.address_building = 'JavaScript 202号室'
  s.is_deleted = 'false'
  s.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/default-image.jpeg')),
                  filename: 'default-image.jpeg')
end

Customer.seed do |s|
  s.id = 3
  s.last_name = '高橋'
  s.first_name = '三郎'
  s.last_name_kana = 'タカハシ'
  s.first_name_kana = 'サブロウ'
  s.username = 'sabu345'
  s.introduction = 'よろしくお願いします〜！'
  s.telephone_number = '03040005000'
  s.email = 'user3@gmail.com'
  s.password = '000000'
  s.postal_code = '0030003'
  s.prefecture_code = '千葉県'
  s.address_city = '木更津市朝日'
  s.address_street = '3-3'
  s.address_building = 'PHP 303号室'
  s.is_deleted = 'false'
  s.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/default-image.jpeg')),
                  filename: 'default-image.jpeg')
end

Customer.seed do |s|
  s.id = 4
  s.last_name = '鈴木'
  s.first_name = '士郎'
  s.last_name_kana = 'スズキ'
  s.first_name_kana = 'シロウ'
  s.username = 'shiro456'
  s.introduction = 'ボランティアによく参加しています！'
  s.telephone_number = '04050006000'
  s.email = 'user4@gmail.com'
  s.password = '000000'
  s.postal_code = '0040004'
  s.prefecture_code = '埼玉県'
  s.address_city = '川越市元町'
  s.address_street = '4-4'
  s.address_building = 'MySQL 404号室'
  s.is_deleted = 'false'
  s.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/default-image.jpeg')),
                  filename: 'default-image.jpeg')
end

Customer.seed do |s|
  s.id = 5
  s.last_name = '伊藤'
  s.first_name = '吾郎'
  s.last_name_kana = 'イトウ'
  s.first_name_kana = 'ゴロウ'
  s.username = 'gorogoro5'
  s.introduction = '吾郎といいます！よろしくお願いします！'
  s.telephone_number = '05060007000'
  s.email = 'user5@gmail.com'
  s.password = '000000'
  s.postal_code = '0050005'
  s.prefecture_code = '静岡県'
  s.address_city = '沼津市御幸町'
  s.address_street = '5-5'
  s.address_building = 'Python'
  s.is_deleted = 'false'
  s.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/default-image.jpeg')),
                  filename: 'default-image.jpeg')
end