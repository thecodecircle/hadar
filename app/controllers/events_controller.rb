class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy toggle_status ]
  before_action :authenticate_user!, except: [:index, :map]

  # GET /events or /events.json
  def index
    if user_signed_in? && current_user.admin?
      @events = Event.all.order(created_at: :desc)
    else
      @events = Event.where(status: :approved).order(created_at: :desc)
    end
  end

  # @events defined in map.js.erb
  def map
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if current_user.unreliable?
      @event.status = :unapproved
    else
      @event.status = :approved
    end

    respond_to do |format|
      if @event.save
        if current_user.unreliable?
          format.html { redirect_to events_url, notice: "האירוע נוצר בהצלחה ומחכה לאחד המנהלים לאישור. בקשה להיות מדווחת מהימנה תפטור אותך מלחכות" }
        else
          format.html { redirect_to events_url, notice: "האירוע נוצר בהצלחה." }
        end
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url, notice: "האירוע עודכן בהצלחה." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "האירוע נמחק בהצלחה." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
    if @event.approved?
      @event.unapproved!
    elsif @event.unapproved?
      @event.approved!
    end
    redirect_to events_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:time, :date, :description, :lat, :long, :street)
    end
end
