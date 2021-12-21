class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
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
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: "物件情報を編集しました！"
    else
      render :edit
    end
  end



  # # POST /rooms or /rooms.json
  # def create
  #   @room = current_user.rooms.build(room_params)
  #   if params[:back]
  #     render :new
  #   elsif @room.save
  #     ConfirmMailer.confirm_mail(@room).deliver
  #     redirect_to rooms_path, notice: '確認メールを送信しました。'
  #   else
  #     render :new
  #   end
  # end

  # def confirm
  #   @room = current_user.rooms.build(room_params)
  #   render :new if @room.invalid?
  # end

  # # PATCH/PUT /rooms/1 or /rooms/1.json
  # def update
  #   respond_to do |format|
  #     if @room.update(room_params)
  #       format.html { redirect_to @room, notice: 'room was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @room }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @room.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /rooms/1 or /rooms/1.json
  # def destroy
  #   @room.destroy
  #   respond_to do |format|
  #     format.html { redirect_to rooms_url, notice: 'room was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private

  # def set_room
  #   @room = room.find(params[:id])
  # end

  def room_params
    params.require(:room).permit(:name, :rent, :address, :age, :note)
  end

end
