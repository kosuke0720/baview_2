class Room < ApplicationRecord

  def new
    @room = Room.new
  end

  private

  def rooms_params
    params.require(:room).permit(:name, user_ids: [])
  
  end

end
