require_relative "board"

class Card
  attr_accessor :face_up, :face_value

  def initialize(face_value, face_up=false)
    @face_value = face_value
    @face_up = face_up
  end

  def flip
    self.face_up == true ? self.face_up = false : self.face_up = true
  end

  def display
    if self.face_up == true
      self.face_value
    else
      "x"
    end
  end

  # def to_s
  # end

  def ==(second_card)
    self.face_value == second_card.face_value
  end

end
