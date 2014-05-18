# Returns the site name, preprended with the page name if provided
def full_title(page_title)
  base_title = "Hello Rails"
  if page_title.empty?
    base_title
  else
    "#{page_title} - #{base_title}"
  end
end 