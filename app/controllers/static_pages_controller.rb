class StaticPagesController < ApplicationController
  add_breadcrumb "about", :about_path
  # add_breadcrddumb("support", :support_url)
  def home
  end

  def about
  end

  def support
  end
end
