class TipsChipsController < ApplicationController
  before_filter :require_admin

  def index
    @tips = TipsChips.find(:all)
  end

  def new
    @tip = TipsChips.new()

    if request.post? && params[:tips_chips]
      @tip.attributes = params[:tips_chips]
      if @tip.save
        redirect_to :controller => 'tips_chips', :action => 'index'
      end
    end
  end

  def edit
    @tip = TipsChips.find(params[:id])

    if request.post? && params[:tips_chips]
      @tip.attributes = params[:tips_chips]
      if @tip.save
        redirect_to :controller => 'tips_chips', :action => 'index'
      end
    end
  end

  def destroy
    @tip = TipsChips.find(params[:id])

    if request.post? && @tip
      @tip.destroy
    end

    redirect_to :controller => 'tips_chips', :action => 'index'
  end
end
