<<<<<<< HEAD
--Avance 2
--Naydelin villegas portuguez

--CREAR TABLAS
CREATE TABLE CLIENTE (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    telefono VARCHAR2(20),
    direccion VARCHAR2(100),
    correo VARCHAR2(100)
);
CREATE TABLE MASCOTA (
    id_mascota NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    especie VARCHAR2(50),
    raza VARCHAR2(50),
    edad NUMBER,
    id_cliente NUMBER,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);
CREATE TABLE VETERINARIO (
    id_veterinario NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    especialidad VARCHAR2(50),
    telefono VARCHAR2(20)
);
CREATE TABLE PRODUCTO (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(100),
    precio NUMBER
);
CREATE TABLE PROVEEDOR (
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    telefono VARCHAR2(20),
    direccion VARCHAR2(100),
    correo VARCHAR2(100)
);
CREATE TABLE VENTA (
    id_venta NUMBER PRIMARY KEY,
    fecha DATE,
    total NUMBER,
    id_cliente NUMBER,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);
CREATE TABLE CITA (
    id_cita NUMBER PRIMARY KEY,
    fecha DATE,
    hora VARCHAR2(10),
    id_mascota NUMBER,
    id_veterinario NUMBER,
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

--PROCEDIMIENTOS
--CRUD cliente
--insertar_cliente
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_telefono VARCHAR2,
    p_direccion VARCHAR2,
    p_correo VARCHAR2
)
AS
BEGIN
    INSERT INTO CLIENTE 
    VALUES (p_id, p_nombre, p_apellido, p_telefono, p_direccion, p_correo);
END;
/
--consultar_cliente
CREATE OR REPLACE PROCEDURE consultar_cliente (
    p_id NUMBER
)
AS
BEGIN
    FOR c IN (SELECT * FROM CLIENTE WHERE id_cliente = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(c.nombre || ' ' || c.apellido);
    END LOOP;
END;
/
--actualizar_cliente
CREATE OR REPLACE PROCEDURE actualizar_cliente (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2
)
AS
BEGIN
    UPDATE CLIENTE
    SET nombre = p_nombre,
        apellido = p_apellido
    WHERE id_cliente = p_id;
END;
/
--eliminar_cliente
CREATE OR REPLACE PROCEDURE eliminar_cliente (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM CLIENTE
    WHERE id_cliente = p_id;
END;
/

--CRUD mascota
--insetar mascota
CREATE OR REPLACE PROCEDURE insertar_mascota (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_especie VARCHAR2,
    p_raza VARCHAR2,
    p_edad NUMBER,
    p_id_cliente NUMBER
)
AS
BEGIN
    INSERT INTO MASCOTA
    VALUES (p_id, p_nombre, p_especie, p_raza, p_edad, p_id_cliente);
END;
/
--consultar_mascota
CREATE OR REPLACE PROCEDURE consultar_mascota (
    p_id NUMBER
)
AS
BEGIN
    FOR m IN (SELECT * FROM MASCOTA WHERE id_mascota = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(m.nombre || ' - ' || m.especie);
    END LOOP;
END;
/
--actualizar_mascota
CREATE OR REPLACE PROCEDURE actualizar_mascota (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_edad NUMBER
)
AS
BEGIN
    UPDATE MASCOTA
    SET nombre = p_nombre,
        edad = p_edad
    WHERE id_mascota = p_id;
END;
/
--eliminar_mascota
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM MASCOTA
    WHERE id_mascota = p_id;
END;
/

--CRUD producto
--insertar producto
CREATE OR REPLACE PROCEDURE insertar_producto (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_descripcion VARCHAR2,
    p_precio NUMBER
)
AS
BEGIN
    INSERT INTO PRODUCTO
    VALUES (p_id, p_nombre, p_descripcion, p_precio);
END;
/
--consultar producto
CREATE OR REPLACE PROCEDURE consultar_producto (
    p_id NUMBER
)
AS
BEGIN
    FOR p IN (SELECT * FROM PRODUCTO WHERE id_producto = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(p.nombre || ' ₡' || p.precio);
    END LOOP;
END;
/
--actualizar producto
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_id NUMBER,
    p_precio NUMBER
)
AS
BEGIN
    UPDATE PRODUCTO
    SET precio = p_precio
    WHERE id_producto = p_id;
END;
/
--eliminar producto
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM PRODUCTO
    WHERE id_producto = p_id;
END;
/

--CRUD venta
--insertar venta
CREATE OR REPLACE PROCEDURE insertar_venta (
    p_id NUMBER,
    p_fecha DATE,
    p_total NUMBER,
    p_id_cliente NUMBER
)
AS
BEGIN
    INSERT INTO VENTA
    VALUES (p_id, p_fecha, p_total, p_id_cliente);
END;
/

--consultar venta
CREATE OR REPLACE PROCEDURE consultar_venta (
    p_id NUMBER
)
AS
BEGIN
    FOR v IN (SELECT * FROM VENTA WHERE id_venta = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Total: ₡' || v.total);
    END LOOP;
END;
/

--actualizar venta
CREATE OR REPLACE PROCEDURE actualizar_venta (
    p_id NUMBER,
    p_total NUMBER
)
AS
BEGIN
    UPDATE VENTA
    SET total = p_total
    WHERE id_venta = p_id;
END;
/
--eliminar venta
CREATE OR REPLACE PROCEDURE eliminar_venta (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM VENTA
    WHERE id_venta = p_id;
END;
/


--PRUEBA CLIENTE
SET SERVEROUTPUT ON;
--insertar
BEGIN
    insertar_cliente(1,'Ana','Venegas','8888','SJ','ana@gmail.com');
END;
/
SELECT * FROM CLIENTE;

--consultar 
BEGIN
    consultar_cliente(1);
END;
/

--Actualizar
BEGIN
    actualizar_cliente(1,'Ana Maria','Venegas');
END;
/
SELECT * FROM CLIENTE;

--eliminar
BEGIN
    eliminar_cliente(1);
END;
/
SELECT * FROM CLIENTE;

--PRUEBA MASCOTA
--crear cliente
BEGIN
    insertar_cliente(2,'Jonatan','Jimenez','7777','Heredia','carlos@gmail.com');
END;
/

--insertar 
BEGIN
    insertar_mascota(1,'zeus','Perro','Labrador',3,2);
END;
/
SELECT * FROM MASCOTA;

--consultar 
BEGIN
    consultar_mascota(1);
END;
/

--actualizar
BEGIN
    actualizar_mascota(1,'zeus',5);
END;
/
SELECT * FROM MASCOTA;

--eliminar
BEGIN
    eliminar_mascota(1);
END;
/
SELECT * FROM MASCOTA;


--PRUEBA PRODUCTO
--insertar
BEGIN
    insertar_producto(1,'Vacuna','Vacuna para perros',5000);
END;
/
SELECT * FROM PRODUCTO;

--consultar
BEGIN
    consultar_producto(1);
END;
/

--actualizar
BEGIN
    actualizar_producto(1,6000);
END;
/
SELECT * FROM PRODUCTO;

--eliminar
BEGIN
    eliminar_producto(1);
END;
/
SELECT * FROM PRODUCTO;

--PRUEBA VENTA
--insertar cliente
BEGIN
    insertar_cliente(3,'Luis','Gomez','9999','Cartago','luis@gmail.com');
END;
/

--insertar venta
BEGIN
    insertar_venta(1,SYSDATE,15000,3);
END;
/
SELECT * FROM VENTA;

--consultar
BEGIN
    consultar_venta(1);
END;
/
--actualizar
BEGIN
    actualizar_venta(1,20000);
END;
/
SELECT * FROM VENTA;

--eliminar
BEGIN
    eliminar_venta(1);
END;
/
SELECT * FROM VENTA;

--FUNCIONES
--TOTAL DE VENTAS POR CLIENTE
CREATE OR REPLACE FUNCTION total_ventas_cliente (p_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(total),0)
    INTO v_total
    FROM VENTA
    WHERE id_cliente = p_id;

    RETURN v_total;
END;
/
SELECT total_ventas_cliente(3) FROM dual;

--CANTIDAD DE MASCOTAS POR CLIENTE
CREATE OR REPLACE FUNCTION total_mascotas (p_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM MASCOTA
    WHERE id_cliente = p_id;

    RETURN v_total;
END;
/
SELECT total_mascotas(2) FROM dual;

--VISTAS
--CLIENTES CON MASCOTA
CREATE OR REPLACE VIEW vista_clientes_mascotas AS
SELECT c.nombre, c.apellido, m.nombre AS mascota
FROM CLIENTE c
JOIN MASCOTA m ON c.id_cliente = m.id_cliente;

--VENTAS POR CLIENTE
CREATE OR REPLACE VIEW vista_ventas_clientes AS
SELECT c.nombre, v.total, v.fecha
FROM CLIENTE c
JOIN VENTA v ON c.id_cliente = v.id_cliente;

--CURSORES
--LISTAR CLIENTES
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_clientes IS
        SELECT nombre, apellido FROM CLIENTE;
BEGIN
    FOR c IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE(c.nombre || ' ' || c.apellido);
    END LOOP;
END;
/

--LISTAR MASCOTAS POR DUEÑO
DECLARE
    CURSOR c_mascotas IS
        SELECT m.nombre, c.nombre AS dueño
        FROM MASCOTA m
        JOIN CLIENTE c ON m.id_cliente = c.id_cliente;
BEGIN
    FOR r IN c_mascotas LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' - ' || r.dueño);
    END LOOP;
END;
/

--DICCIONARIO DE DATOS
--VER TABLAS
SELECT table_name FROM user_tables;

--VER COLUMNAS
SELECT column_name, data_type
FROM user_tab_columns
WHERE table_name = 'CLIENTE';

--VER LLAVES FORANEAS
SELECT constraint_name, table_name
FROM user_constraints
WHERE constraint_type = 'R';

=======
--Avance 2
--Naydelin villegas portuguez

--CREAR TABLAS
CREATE TABLE CLIENTE (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    telefono VARCHAR2(20),
    direccion VARCHAR2(100),
    correo VARCHAR2(100)
);
CREATE TABLE MASCOTA (
    id_mascota NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    especie VARCHAR2(50),
    raza VARCHAR2(50),
    edad NUMBER,
    id_cliente NUMBER,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);
CREATE TABLE VETERINARIO (
    id_veterinario NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    especialidad VARCHAR2(50),
    telefono VARCHAR2(20)
);
CREATE TABLE PRODUCTO (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(100),
    precio NUMBER
);
CREATE TABLE PROVEEDOR (
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    telefono VARCHAR2(20),
    direccion VARCHAR2(100),
    correo VARCHAR2(100)
);
CREATE TABLE VENTA (
    id_venta NUMBER PRIMARY KEY,
    fecha DATE,
    total NUMBER,
    id_cliente NUMBER,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);
CREATE TABLE CITA (
    id_cita NUMBER PRIMARY KEY,
    fecha DATE,
    hora VARCHAR2(10),
    id_mascota NUMBER,
    id_veterinario NUMBER,
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

--PROCEDIMIENTOS
--CRUD cliente
--insertar_cliente
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_telefono VARCHAR2,
    p_direccion VARCHAR2,
    p_correo VARCHAR2
)
AS
BEGIN
    INSERT INTO CLIENTE 
    VALUES (p_id, p_nombre, p_apellido, p_telefono, p_direccion, p_correo);
END;
/
--consultar_cliente
CREATE OR REPLACE PROCEDURE consultar_cliente (
    p_id NUMBER
)
AS
BEGIN
    FOR c IN (SELECT * FROM CLIENTE WHERE id_cliente = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(c.nombre || ' ' || c.apellido);
    END LOOP;
END;
/
--actualizar_cliente
CREATE OR REPLACE PROCEDURE actualizar_cliente (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2
)
AS
BEGIN
    UPDATE CLIENTE
    SET nombre = p_nombre,
        apellido = p_apellido
    WHERE id_cliente = p_id;
END;
/
--eliminar_cliente
CREATE OR REPLACE PROCEDURE eliminar_cliente (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM CLIENTE
    WHERE id_cliente = p_id;
END;
/

--CRUD mascota
--insetar mascota
CREATE OR REPLACE PROCEDURE insertar_mascota (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_especie VARCHAR2,
    p_raza VARCHAR2,
    p_edad NUMBER,
    p_id_cliente NUMBER
)
AS
BEGIN
    INSERT INTO MASCOTA
    VALUES (p_id, p_nombre, p_especie, p_raza, p_edad, p_id_cliente);
END;
/
--consultar_mascota
CREATE OR REPLACE PROCEDURE consultar_mascota (
    p_id NUMBER
)
AS
BEGIN
    FOR m IN (SELECT * FROM MASCOTA WHERE id_mascota = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(m.nombre || ' - ' || m.especie);
    END LOOP;
END;
/
--actualizar_mascota
CREATE OR REPLACE PROCEDURE actualizar_mascota (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_edad NUMBER
)
AS
BEGIN
    UPDATE MASCOTA
    SET nombre = p_nombre,
        edad = p_edad
    WHERE id_mascota = p_id;
END;
/
--eliminar_mascota
CREATE OR REPLACE PROCEDURE eliminar_mascota (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM MASCOTA
    WHERE id_mascota = p_id;
END;
/

--CRUD producto
--insertar producto
CREATE OR REPLACE PROCEDURE insertar_producto (
    p_id NUMBER,
    p_nombre VARCHAR2,
    p_descripcion VARCHAR2,
    p_precio NUMBER
)
AS
BEGIN
    INSERT INTO PRODUCTO
    VALUES (p_id, p_nombre, p_descripcion, p_precio);
END;
/
--consultar producto
CREATE OR REPLACE PROCEDURE consultar_producto (
    p_id NUMBER
)
AS
BEGIN
    FOR p IN (SELECT * FROM PRODUCTO WHERE id_producto = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE(p.nombre || ' ₡' || p.precio);
    END LOOP;
END;
/
--actualizar producto
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_id NUMBER,
    p_precio NUMBER
)
AS
BEGIN
    UPDATE PRODUCTO
    SET precio = p_precio
    WHERE id_producto = p_id;
END;
/
--eliminar producto
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM PRODUCTO
    WHERE id_producto = p_id;
END;
/

--CRUD venta
--insertar venta
CREATE OR REPLACE PROCEDURE insertar_venta (
    p_id NUMBER,
    p_fecha DATE,
    p_total NUMBER,
    p_id_cliente NUMBER
)
AS
BEGIN
    INSERT INTO VENTA
    VALUES (p_id, p_fecha, p_total, p_id_cliente);
END;
/

--consultar venta
CREATE OR REPLACE PROCEDURE consultar_venta (
    p_id NUMBER
)
AS
BEGIN
    FOR v IN (SELECT * FROM VENTA WHERE id_venta = p_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Total: ₡' || v.total);
    END LOOP;
END;
/

--actualizar venta
CREATE OR REPLACE PROCEDURE actualizar_venta (
    p_id NUMBER,
    p_total NUMBER
)
AS
BEGIN
    UPDATE VENTA
    SET total = p_total
    WHERE id_venta = p_id;
END;
/
--eliminar venta
CREATE OR REPLACE PROCEDURE eliminar_venta (
    p_id NUMBER
)
AS
BEGIN
    DELETE FROM VENTA
    WHERE id_venta = p_id;
END;
/


--PRUEBA CLIENTE
SET SERVEROUTPUT ON;
--insertar
BEGIN
    insertar_cliente(1,'Ana','Venegas','8888','SJ','ana@gmail.com');
END;
/
SELECT * FROM CLIENTE;

--consultar 
BEGIN
    consultar_cliente(1);
END;
/

--Actualizar
BEGIN
    actualizar_cliente(1,'Ana Maria','Venegas');
END;
/
SELECT * FROM CLIENTE;

--eliminar
BEGIN
    eliminar_cliente(1);
END;
/
SELECT * FROM CLIENTE;

--PRUEBA MASCOTA
--crear cliente
BEGIN
    insertar_cliente(2,'Jonatan','Jimenez','7777','Heredia','carlos@gmail.com');
END;
/

--insertar 
BEGIN
    insertar_mascota(1,'zeus','Perro','Labrador',3,2);
END;
/
SELECT * FROM MASCOTA;

--consultar 
BEGIN
    consultar_mascota(1);
END;
/

--actualizar
BEGIN
    actualizar_mascota(1,'zeus',5);
END;
/
SELECT * FROM MASCOTA;

--eliminar
BEGIN
    eliminar_mascota(1);
END;
/
SELECT * FROM MASCOTA;


--PRUEBA PRODUCTO
--insertar
BEGIN
    insertar_producto(1,'Vacuna','Vacuna para perros',5000);
END;
/
SELECT * FROM PRODUCTO;

--consultar
BEGIN
    consultar_producto(1);
END;
/

--actualizar
BEGIN
    actualizar_producto(1,6000);
END;
/
SELECT * FROM PRODUCTO;

--eliminar
BEGIN
    eliminar_producto(1);
END;
/
SELECT * FROM PRODUCTO;

--PRUEBA VENTA
--insertar cliente
BEGIN
    insertar_cliente(3,'Luis','Gomez','9999','Cartago','luis@gmail.com');
END;
/

--insertar venta
BEGIN
    insertar_venta(1,SYSDATE,15000,3);
END;
/
SELECT * FROM VENTA;

--consultar
BEGIN
    consultar_venta(1);
END;
/
--actualizar
BEGIN
    actualizar_venta(1,20000);
END;
/
SELECT * FROM VENTA;

--eliminar
BEGIN
    eliminar_venta(1);
END;
/
SELECT * FROM VENTA;

--FUNCIONES
--TOTAL DE VENTAS POR CLIENTE
CREATE OR REPLACE FUNCTION total_ventas_cliente (p_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(total),0)
    INTO v_total
    FROM VENTA
    WHERE id_cliente = p_id;

    RETURN v_total;
END;
/
SELECT total_ventas_cliente(3) FROM dual;

--CANTIDAD DE MASCOTAS POR CLIENTE
CREATE OR REPLACE FUNCTION total_mascotas (p_id NUMBER)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM MASCOTA
    WHERE id_cliente = p_id;

    RETURN v_total;
END;
/
SELECT total_mascotas(2) FROM dual;

--VISTAS
--CLIENTES CON MASCOTA
CREATE OR REPLACE VIEW vista_clientes_mascotas AS
SELECT c.nombre, c.apellido, m.nombre AS mascota
FROM CLIENTE c
JOIN MASCOTA m ON c.id_cliente = m.id_cliente;

--VENTAS POR CLIENTE
CREATE OR REPLACE VIEW vista_ventas_clientes AS
SELECT c.nombre, v.total, v.fecha
FROM CLIENTE c
JOIN VENTA v ON c.id_cliente = v.id_cliente;

--CURSORES
--LISTAR CLIENTES
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_clientes IS
        SELECT nombre, apellido FROM CLIENTE;
BEGIN
    FOR c IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE(c.nombre || ' ' || c.apellido);
    END LOOP;
END;
/

--LISTAR MASCOTAS POR DUEÑO
DECLARE
    CURSOR c_mascotas IS
        SELECT m.nombre, c.nombre AS dueño
        FROM MASCOTA m
        JOIN CLIENTE c ON m.id_cliente = c.id_cliente;
BEGIN
    FOR r IN c_mascotas LOOP
        DBMS_OUTPUT.PUT_LINE(r.nombre || ' - ' || r.dueño);
    END LOOP;
END;
/

--DICCIONARIO DE DATOS
--VER TABLAS
SELECT table_name FROM user_tables;

--VER COLUMNAS
SELECT column_name, data_type
FROM user_tab_columns
WHERE table_name = 'CLIENTE';

--VER LLAVES FORANEAS
SELECT constraint_name, table_name
FROM user_constraints
WHERE constraint_type = 'R';

>>>>>>> 01709a8fe76da30628d6818b864f99f98aabbc5a
