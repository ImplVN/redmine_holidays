class HolidaysController < ApplicationController
  before_action :require_admin
  before_action :set_holiday, only: [:edit, :update, :destroy]

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      redirect_back_or_default(controller: 'settings', action: 'plugin', id: 'redmine_holidays')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @holiday.update(holiday_params)
      redirect_back_or_default(controller: 'settings', action: 'plugin', id: 'redmine_holidays')
    else
      render :edit
    end
  end

  def destroy
    @holiday.destroy
    redirect_back_or_default(controller: 'settings', action: 'plugin', id: 'redmine_holidays')
  end

  private

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:date, :name, :country)
  end
end
