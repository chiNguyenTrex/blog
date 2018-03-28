class InformsController < ApplicationController
  def index
    @informs = Inform.all
  end

  def new
  end

  def create
  end

  private

  def inform_params
    params.require(:inform).permit(:title, :content, :receivers)
  end
end
