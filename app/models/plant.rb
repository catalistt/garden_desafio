class Plant < ApplicationRecord
  #Esto se le agrega para vincularla con watering y dejar la eliminación en cascada
  has_many :waterings, dependent: :destroy
  
  #para que se vean el nombre, no el número
  def to_s
    name
  end

  def total_watering
    #Contar la colección de datos
    waterings.count
  end

  def total_volume
    #De Waterings, saca solo la información del volumen de cada uno de los riegos
    #Luego, suma todos los números de los arreglos y deja un valor
    waterings.pluck(:volume).reduce(&:+)
  end

  #Se crean todos los métodos que realizarán mini consultas.
  #Se hacen las consultas acá para usarlas sobre la instancia de waterings.
  def daily_quantity
    #Cuenta la cantidad de registros del día
    waterings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
  end

  def last_watering
    #Muestra el tiempo de creación del último registro
    waterings.last&.created_at&.to_date
  end

  def daily_volume
    #suma el conjunto de "volumen" del día
    waterings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).pluck(:volume).reduce(&:+)
  end

  def daily_minutes
    #suma el conjunto de "minutos" del día
    waterings.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).pluck(:minutes).reduce(&:+)
  end

end
