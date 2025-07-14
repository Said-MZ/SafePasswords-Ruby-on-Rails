class EntriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)

    if @entry.save
      flash[:notice] = "Entry Saved"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.expect(entry: [ :name, :url, :username, :password ])
  end
end

  # primary_key: yXP6gf6gDFcHFpemypZpnV9vJ7gtMExY
  # deterministic_key: PrqNlHuJ16ucqXYrc8iBomjJpXiYCLqD
  # key_derivation_salt: OO9qH4xdgv3cRo9jfx8JVo83y0DtSBQ1