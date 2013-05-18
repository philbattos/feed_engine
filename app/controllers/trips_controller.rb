class TripsController < ApplicationController
  before_filter :require_login

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to dashboard_path
    else
      render :new, :notice => 'Error!'
    end
  end

  def show
    @trip = current_user.trips.find(params[:id])
    @tweets = current_user.tweets.where("? >= ? AND ? <= ?", :created_at, @trip.start, :created_at, @trip.end)
  end

  private

  def trip_params
    params[:trip].merge(:start => Chronic.parse(params[:trip][:start]),
                        :end => Chronic.parse(params[:trip][:end]))
  end
end