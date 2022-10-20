# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @details = Detail.all
  end

  def set_detail
    @detail = Detail.find(params[:id])
  end
end
