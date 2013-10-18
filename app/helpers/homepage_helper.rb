module HomepageHelper
  def render_homepage_partial(partial_name)
    render "refinery/pages/home/#{partial_name}"
  end
end
