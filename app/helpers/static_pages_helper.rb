module StaticPagesHelper

  def page_title(title)
    base_title = "American Runner"
    if title.present?
      full_title = title.to_s + " | " + base_title
    else
      base_title
    end
  end
end
