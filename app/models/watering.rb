class Watering < ApplicationRecord
  #Para decirle que está asociada (condicionada) a Watering
  belongs_to :plant
end
