-- On this analysis we calculate the flights being done by looking at segments with high speed and long distance.
-- If you travel faster than 300km/h is very likely you are doing in on a plane.
-- To find the start airport and end aiport we use an external table of airports worlwide. We look for the last position
-- before the flight and the first position after the flight. We look for the closest airport to this location

-- The openpaths_segments table contain the speed on meters per second and distance in meters.
-- The airport table was found from https://osm2.cartodb.com/tables/52#/map

(SELECT iata_faa FROM airports as a WHERE iata_faa <>'' ORDER BY a.the_geom <-> ST_StartPoint(ST_GeometryN(o.the_geom,1)) LIMIT 1) as start_airport,
(SELECT city FROM airports as a WHERE iata_faa <>'' ORDER BY a.the_geom <-> ST_StartPoint(ST_GeometryN(o.the_geom,1)) LIMIT 1) as start_city,
(SELECT iata_faa FROM airports as a WHERE iata_faa <>'' ORDER BY a.the_geom <-> ST_EndPoint(ST_GeometryN(o.the_geom,1)) LIMIT 1) as end_airport,
(SELECT city FROM airports as a WHERE iata_faa <>''  ORDER BY a.the_geom <-> ST_EndPoint(ST_GeometryN(o.the_geom,1)) LIMIT 1) as end_city

FROM openpaths_segments as o WHERE  distance>100000 and speed>60