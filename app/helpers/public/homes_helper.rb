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
        image_tag 'category_2.png', size: '60x60'
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

  def chart_category_count
    category_1 = Post.where(status: "share", category_id: 1).all
    category_2 = Post.where(status: "share", category_id: 2).all
    category_3 = Post.where(status: "share", category_id: 3).all
    category_4 = Post.where(status: "share", category_id: 4).all
    category_5 = Post.where(status: "share", category_id: 5).all
    category_6 = Post.where(status: "share", category_id: 6).all
    category_7 = Post.where(status: "share", category_id: 7).all
    category_8 = Post.where(status: "share", category_id: 8).all
    category_9 = Post.where(status: "share", category_id: 9).all
    category_10 = Post.where(status: "share", category_id: 10).all
    category_11 = Post.where(status: "share", category_id: 11).all
    category_12 = Post.where(status: "share", category_id: 12).all
    category_13 = Post.where(status: "share", category_id: 13).all
    category_14 = Post.where(status: "share", category_id: 14).all
    category_15 = Post.where(status: "share", category_id: 15).all
    category_16 = Post.where(status: "share", category_id: 16).all
    category_17 = Post.where(status: "share", category_id: 17).all

    [
      category_1.count,
      category_2.count,
      category_3.count,
      category_4.count,
      category_5.count,
      category_6.count,
      category_7.count,
      category_8.count,
      category_9.count,
      category_10.count,
      category_11.count,
      category_12.count,
      category_13.count,
      category_14.count,
      category_15.count,
      category_16.count,
      category_17.count
      ]
  end
end
