module Public::PostImagesHelper
  def render_with_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post_image/tag/#{word.delete("#")}" }.html_safe
  end
end
