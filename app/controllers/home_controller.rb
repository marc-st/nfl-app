require 'espn_scraper'

class HomeController < ApplicationController
  def contact
  end
  
  def home
  end
  
  def scores
    scores = ESPN.get_nfl_scores(2017, 8)
    scores.each { |game| 
      @game = Game.new
    }
  end
  
  def request_contact
    
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    
    if email.blank?
      flash[:alert] = I18n.t('home.request_path.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_path.email_sent')
    end
    
    redirect_to root_path
    
  end
end
