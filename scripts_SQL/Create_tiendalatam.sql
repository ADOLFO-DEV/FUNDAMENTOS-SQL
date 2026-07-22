CREATE TABLE demo_tipos(
  -- Creacion de la primera tabla con los primeros tipos de datos
  id    integer,
  nombre TEXT, 
  precio NUMERIC(20,4),
  activo BOOLEAN, 
  fecha_ingereso DATE,
  creado_en timestamp
);

-- insertar datos en la tabla creada 
-- Recuerda que para cada Ejecucion de codigo es ncesario poner un punto y coma 
INSERT INTO demo_tipos VALUES(
  1,
  'Producto Demo',
  29.99,
  TRUE,
  '2026-01-01',
  NOW() 
);

Select * from demo_tipos ; -- primera consulta para ver los datos de toda la tabla

--forma 1: Serial (Clasica, muy usuada)
CREATE TABLE ejemplo_serial(
  id SERIAL PRIMARY KEY, 
  nombre  TEXT NOT NULL
);

-- FORMA 2 : Genereted always as identity ( estandar más usado y moderno)
CREATE TABLE ejemplo_identity(
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  nombre text NOT NULL 
);