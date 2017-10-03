module BlogHelper
  def blog_preview(content)
    if(content.length > 100)
      content[0..99] + " ..."
    else
      content
    end
  end
end