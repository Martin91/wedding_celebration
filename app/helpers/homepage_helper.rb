module HomepageHelper
  def render_homepage_partial(partial_name)
    render "home/home/#{partial_name}"
  end

  def screen_shots(image_name)
    "screenshots/#{image_name}.png"
  end
end
