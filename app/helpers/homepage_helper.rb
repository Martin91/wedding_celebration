module HomepageHelper
  def render_homepage_partial(partial_name)
    render "home/home/#{partial_name}"
  end
end
