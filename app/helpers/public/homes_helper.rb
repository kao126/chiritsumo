module Public::HomesHelper
  #ハッシュタグをリンク化
  def render_with_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/explore/tags/#{word.delete("#")}"}.html_safe
  end

  #投稿のカテゴリ画像
  def post_category_image(category_id)
    case category_id
      when 1 then
        image_tag 'category_1.png', size: '60x60'
      when 2 then
        image_tag 'category_2.png', size: '50x50'
      when 3 then
        image_tag 'category_3.png', size: '60x60'
      when 4 then
        image_tag 'category_4.png', size: '60x60'
      when 5 then
        image_tag 'category_5.png', size: '60x60'
      when 6 then
        image_tag 'category_6.png', size: '60x60'
      when 7 then
        image_tag 'category_7.png', size: '60x60'
      when 8 then
        image_tag 'category_8.png', size: '60x60'
      when 9 then
        image_tag 'category_9.png', size: '60x60'
      when 10 then
        image_tag 'category_10.png', size: '60x60'
      when 11 then
        image_tag 'category_11.png', size: '60x60'
      when 12 then
        image_tag 'category_12.png', size: '60x60'
      when 13 then
        image_tag 'category_13.png', size: '60x60'
      when 14 then
        image_tag 'category_14.png', size: '60x60'
      when 15 then
        image_tag 'category_15.png', size: '60x60'
      when 16 then
        image_tag 'category_16.png', size: '60x60'
      when 17 then
        image_tag 'category_17.png', size: '60x60'
    end
  end

end
