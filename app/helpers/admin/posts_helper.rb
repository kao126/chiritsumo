module Admin::PostsHelper
  #ハッシュタグをリンク化(管理者用)
  def admin_render_with_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/admin/explore/tags/#{word.delete("#")}"}.html_safe
  end
end
