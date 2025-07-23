class TsueetsController < ApplicationController
  before_action :set_tsueet, only: %i[ show edit update destroy ]

  # GET /tsueets
  def index
    @tsueets = Tsueet.all
  end

  # GET /tsueets/1
  def show
  end

  # GET /tsueets/new
  def new
    @tsueet = Tsueet.new
  end

  # GET /tsueets/1/edit
  def edit
  end

  # POST /tsueets
  def create
    @tsueet = Tsueet.new(tsueet_params)

    if @tsueet.save
      redirect_to tsueets_path, notice: "Tsueet was successfully created."
    else
      # TODO: バリデーションエラーのときも一覧ページにエラー表示できるように検討する
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tsueets/1
  def update
    if @tsueet.update(tsueet_params)
      redirect_to @tsueet, notice: "Tsueet was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tsueets/1
  def destroy
    @tsueet.destroy!
    redirect_to tsueets_path, notice: "Tsueet was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tsueet
      @tsueet = Tsueet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tsueet_params
      params.expect(tsueet: [ :content ])
    end
end
