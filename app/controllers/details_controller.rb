# frozen_string_literal: true

class DetailsController < ApplicationController
  before_action :set_detail, only: %i[show edit update destroy]

  # GET /details or /details.json
  def index
    @details = Detail.all
    @employments = Employment.all
  end

  # GET /details/1 or /details/1.json
  def show; end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit; end

  # POST /details or /details.json
  def create
    @detail = Detail.new(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to new_employment_path }
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.prepend('details', partial: 'details/detail',
        #                                                        locals: { detail: @detail })
        # end

        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1 or /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to detail_url(@detail), notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1 or /details/1.json
  def destroy
    respond_to do |format|
      if @detail.destroy
        format.html { redirect_to details_url }
        format.json { head :no_content }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detail
    @detail = Detail.find(params[:id])
  end

  def set_employment
    @employment = Employment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def detail_params
    params.require(:detail).permit(:first_name, :last_name, :nick_name, :email_address, :phone_number)
  end
end
