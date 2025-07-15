class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [ :show, :edit, :update, :destroy ]

  def index
    @entries = current_user.entries
    @main_entry = current_user.entries.first
  end

  def show
    @entry = current_user.entries.find(params[:id])
    @entries = current_user.entries
    @main_entry = @entry
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)

    if @entry.save
      flash[:notice] = "Entry Saved"
      redirect_to entries_path
    else
      flash[:alert] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:notice] = "Entry updated successfully"
      redirect_to entry_path(@entry)
    else
      flash[:alert] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    flash[:notice] = "Entry deleted successfully"
    redirect_to entries_path
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end

  def entry_params
    params.expect(entry: [ :name, :url, :username, :password ])
  end
end

# primary_key: yXP6gf6gDFcHFpemypZpnV9vJ7gtMExY
# deterministic_key: PrqNlHuJ16ucqXYrc8iBomjJpXiYCLqD
# key_derivation_salt: OO9qH4xdgv3cRo9jfx8JVo83y0DtSBQ1
