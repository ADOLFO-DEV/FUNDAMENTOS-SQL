-- Tabla de ejemplo
CREATE TABLE empleados_demo (
    empleado_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre      TEXT    NOT NULL,
    cargo       TEXT
);
--  add column : Agregar una columna nueva 
Alter Table empleados_demo 
add column email text; 

Select * from empleados_demo; 

ALTER TABLE empleados_demo 
ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE; 

ALTER TABLE empleados_demo
ADD COLUMN fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE;

Select * from empleados_demo; 

-- Verificar resultado
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_demo'
ORDER BY ordinal_position;

-- ALTER COLUMN ... TYPE: cambiar tipo de dato
-- Nota PG: usa "TYPE" a diferencia de SQL Server
ALTER TABLE empleados_demo
ALTER COLUMN email TYPE VARCHAR(100);

ALTER TABLE empleados_demo 
ALTER COLUMN email SET NOT NULL ; -- SET  para dejarlo como no nulo - DROP para quitarlo 

-- RENAME COLUMN : Renombrar una columna

ALTER TABLE empleados_demo 
rename COLUMN cargo TO puesto; 


-- Verificar resultado

SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_demo'
ORDER BY ordinal_position;

-- ADD CONSTRAINT : Agrega una restriccion luego de crear una tabla 

ALTER TABLE empleados_demo 
ADD CONSTRAINT email_unico UNIQUE (email);
-- Verificar resultado

SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_demo'
ORDER BY ordinal_position;
-- Eliminar el Add CONSTRAINT que pusimos 


ALTER TABLE empleados_demo
DROP CONSTRAINT email_unico; 

-- Verificar resultado

SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_demo'
ORDER BY ordinal_position;

--DROP COLUMN : eliminar una columana de la tabla en este caso activo 

SELECT activo FROM empleados_demo; -- hacemos un check antes de borrar 

ALTER TABLE empleados_demo
DROP COLUMN activo; --- esto es irreversible 


-- Verificar resultado drop column 

SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_demo'
ORDER BY ordinal_position;

-- cambios de nombre con alter a una tabla 

ALTER TABLE empleados_demo
RENAME to empleados_v2;


SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_v2'
ORDER BY ordinal_position;

-- tres cambios extra de la activdad de platzi 

-- un add 
ALTER TABLE empleados_v2
ADD COLUMN distrito VARCHAR(120) NOT NULL DEFAULT 'OAT';

SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'empleados_v2'
ORDER BY ordinal_position;
-- 
