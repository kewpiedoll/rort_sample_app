module StaticPagesHelper

  def full_title(page_title= '')
    base_title = "American Runner"
    if page_title.present?
      page_title + " | " + base_title
    else
      base_title
    end
  end
end
