class EventsController < ApplicationController
  before_action :load_event, only: [:show, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
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

  def update
  end

  private

  def load_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit :name
  end
end
