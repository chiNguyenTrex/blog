class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :load_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] = "Event was created successfully!"
      redirect_to events_path
    else
      flash[:danger] = "Create event failed!"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to events_path
    else
      flash.now[:danger] = "There's something wrong"
      render :edit
    end
  end

  def destroy
    if @event.destroy
      flash[:success] = "Event cancelled"
      redirect_to events_path
    end
  end

  private

  def load_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit :name
  end
end
