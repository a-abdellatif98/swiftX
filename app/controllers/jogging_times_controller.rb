# frozen_string_literal: true

class JoggingTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_maneger!,
                only: %i[index show edit update destroy]
  before_action :set_jogging_time, only: %i[show edit update destroy]

  # GET /jogging_times or /jogging_times.json
  def index
    @jogging_times = current_user.jogging_time # .where(:date => start_date.to_time..end_date.to_time )

    @avg_distance, @avg_time, @avg_speed = JoggingTime.avg(current_user)
  end

  # GET /jogging_times/1 or /jogging_times/1.json
  def show; end

  # GET /jogging_times/new
  def new
    @jogging_time = JoggingTime.new
  end

  # GET /jogging_times/1/edit
  def edit; end

  # POST /jogging_times or /jogging_times.json
  def create
    @jogging_time = current_user.jogging_time.new(jogging_time_params)

    respond_to do |format|
      if @jogging_time.save
        format.html do
          redirect_to jogging_time_url(@jogging_time),
                      notice: 'Jogging time was successfully created.'
        end
        format.json { render :show, status: :created, location: @jogging_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @jogging_time.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /jogging_times/1 or /jogging_times/1.json
  def update
    respond_to do |format|
      if @jogging_time.update(jogging_time_params)
        format.html do
          redirect_to jogging_time_url(@jogging_time),
                      notice: 'Jogging time was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @jogging_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @jogging_time.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /jogging_times/1 or /jogging_times/1.json
  def destroy
    @jogging_time.destroy

    respond_to do |format|
      format.html do
        redirect_to jogging_times_url,
                    notice: 'Jogging time was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def authenticate_user_maneger!
    authenticate_user!
    # redirect_to root_path,  notice: 'YOU ARE NOT ALLOWED.' unless current_user.user_maneger?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_jogging_time
    @jogging_time = JoggingTime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def jogging_time_params
    params.require(:jogging_time).permit(:date, :distanse, :time)
  end
end
