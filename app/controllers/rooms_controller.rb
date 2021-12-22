class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    2.times { @room.stations.build }
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path notice: "物件情報を追加しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @room.stations.build
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "物件情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice:"物件情報を削除しました！"
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
                                  :name,
                                  :rent,
                                  :address,
                                  :age, 
                                  :note,
                                  stations_attributes:[
                                                      :line,
                                                      :station,
                                                      :on_foot])
  end

end
