module Public::HomesHelper
  #ハッシュタグをリンク化
  def render_with_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/explore/tags/#{word.delete("#")}"}.html_safe
  end
end
