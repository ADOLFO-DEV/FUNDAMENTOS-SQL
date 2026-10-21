-- ============================================================
-- C17 · UPDATE: modificar datos existentes
-- Curso: SQL con PostgreSQL — TiendaLatam
-- REGLA DE ORO: siempre usar WHERE en el UPDATE
-- ============================================================

-- Preparar datos de ejemplo
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INTEGER PRIMARY KEY,
    nombre     TEXT NOT NULL,
    email      VARCHAR(100),
    activo     BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS productos (
    producto_id INTEGER PRIMARY KEY,
    nombre      TEXT NOT NULL,
    precio      NUMERIC(12,2),
    stock       INTEGER,
    categoria_id INTEGER
);

INSERT INTO clientes (cliente_id, nombre, email, activo) VALUES
    (1, 'María González', 'maria@email.cl', TRUE),
    (2, 'Carlos Rodríguez', 'carlos@email.cl', TRUE),
    (3, 'Ana Martínez', 'ana@email.ar', TRUE);

INSERT INTO productos (producto_id, nombre, precio, stock, categoria_id) VALUES
    (1, 'Laptop', 899.99, 5, 1),
    (2, 'Mouse', 25.50, 150, 1),
    (3, 'Teclado', 125.00, 8, 1),
    (4, 'Monitor', 299.99, 3, 1);

-- Super importante ver tus datos antes de hacer un cambio, si es posible realiza un backup
SELECT cliente_id,  nombre, email, activo 
FROM clientes 
WHERE cliente_id = 1; 

-- vamos a hacer un UPDATE de este mismo user que pertece a MARIA 

UPDATE clientes 
SET activo = FALSE 
Where cliente_id =1; 


-- volvemos a ver como quedo el user 1 

SELECT cliente_id,  nombre, email, activo 
FROM clientes 
WHERE cliente_id = 1;  -- Listo para este paso ya se ve como false el estado de activo del user 

-- Ahora si vamos a hacer el cambio de varias columnas del user ya existente 

Update clientes 
SET nombre = 'Maria Gonzales Esquivel', -- hacemos el cambio de su nombre en donde se agrega otro apellido,
    activo = TRUE -- volvemos a activar su user 
Where cliente_id = 1
RETURNING *;

-- volvemos a checar el user con el RETURNING 

-- recuerda como nunca se debe de hacer update sin fliltro 