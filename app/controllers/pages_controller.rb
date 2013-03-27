class PagesController < ApplicationController
  
  def index
  end

  def svn
    session[:svn] = true
  end

  def resume
  end
  
  
end
