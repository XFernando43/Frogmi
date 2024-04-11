# db/seeds.rb

# Crear algunos registros de Report
Report.create(
  mag: 1.5,
  place: 'San Francisco',
  time: Time.now,
  url: 'https://example.com/report/1',
  tsunami: 1,
  mag_type: 'Tipo A',
  title: 'Reporte 1',
  longitude: -122.4194,
  latitude: 37.7749
)

Report.create(
  mag: 2.0,
  place: 'Los Angeles',
  time: Time.now,
  url: 'https://example.com/report/2',
  tsunami: 0,
  mag_type: 'Tipo B',
  title: 'Reporte 2',
  longitude: -118.2437,
  latitude: 34.0522
)

Report.create(
  mag: 3.2,
  place: 'New York',
  time: Time.now,
  url: 'https://example.com/report/3',
  tsunami: 1,
  mag_type: 'Tipo C',
  title: 'Reporte 3',
  longitude: -74.0059,
  latitude: 40.7128
)
