# db/seeds.rb

# Crear algunos registros de Report
# Report.create(
#   mag: 1.5,
#   place: 'San Francisco',
#   time: Time.now,
#   url: 'https://example.com/report/1',
#   tsunami: 1,
#   mag_type: 'Tipo A',
#   title: 'Reporte 1',
#   longitude: -122.4194,
#   latitude: 37.7749
# )

# Report.create(
#   mag: 2.0,
#   place: 'Los Angeles',
#   time: Time.now,
#   url: 'https://example.com/report/2',
#   tsunami: 0,
#   mag_type: 'Tipo B',
#   title: 'Reporte 2',
#   longitude: -118.2437,
#   latitude: 34.0522
# )

# Report.create(
#   mag: 3.2,
#   place: 'New York',
#   time: Time.now,
#   url: 'https://example.com/report/3',
#   tsunami: 1,
#   mag_type: 'Tipo C',
#   title: 'Reporte 3',
#   longitude: -74.0059,
#   latitude: 40.7128
# )


require 'net/http'
require 'json'

# Consumir el endpoint para obtener datos de terremotos
response = Net::HTTP.get(URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'))
earthquakes = JSON.parse(response)['features']


# Iterar sobre cada terremoto y guardarlos en la base de datos usando tu modelo
earthquakes.each do |earthquake|
  next if Report.exists?(id: earthquake['id']) # Saltar si el registro ya existe

  # Validar que los campos obligatorios no sean nulos
  title = earthquake['properties']['title']
  url = earthquake['properties']['url']
  place = earthquake['properties']['place']
  mag_type = earthquake['properties']['magType']
  coordinates = earthquake['geometry']['coordinates']

  next unless title && url && place && mag_type && coordinates

  # Validar rangos de magnitud, latitud y longitud
  mag = earthquake['properties']['mag']
  latitude = coordinates[1]
  longitude = coordinates[0]

  next unless (mag >= -1.0 && mag <= 10.0) &&
              (latitude >= -90.0 && latitude <= 90.0) &&
              (longitude >= -180.0 && longitude <= 180.0)

  # Crear el registro en la base de datos si pasa todas las validaciones

  puts earthquake['id']

  Report.create!(
    identifier: earthquake['id'], # Usar el ID del terremoto como clave principal
    title: title,
    url: url,
    place: place,
    mag_type: mag_type,
    mag: mag,
    latitude: latitude,
    longitude: longitude,
    time: Time.at(earthquake['properties']['time'] / 1000) # Convertir a tiempo legible
    # Otros atributos que deseas guardar en tu modelo Report
  )
end