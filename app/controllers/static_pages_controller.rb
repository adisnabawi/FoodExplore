class StaticPagesController < ApplicationController
  def home
    render layout: false
  end

  def help
  end

  def explore
  end

  def recipe
  end

  def about
    render layout: false
  end
end
