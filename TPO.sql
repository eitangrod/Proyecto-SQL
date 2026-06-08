CREATE DATABASE proyectoFinal;
GO
USE proyectoFinal;
GO
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Pago;
DROP TABLE IF EXISTS Socio;
DROP TABLE IF EXISTS Cronograma;
DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS Membresia;
DROP TABLE IF EXISTS Sede;
DROP TABLE IF EXISTS Disciplina;

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    NombreDisciplina VARCHAR(100) NOT NULL
);

CREATE TABLE Sede(
    id_sede INT PRIMARY KEY,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    CapacidadMaxima INT NOT NULL
);

CREATE TABLE Membresia (
    id_membresia INT PRIMARY KEY,
    NombrePlan VARCHAR(50) NOT NULL,
    Costo NUMERIC(10, 2) NOT NULL,
    Beneficios VARCHAR(300) NOT NULL
);

CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Mail VARCHAR(100) NULL,
    NumeroTelefono VARCHAR(20) NULL
);

CREATE TABLE Cronograma (
    id_cronograma INT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    id_sede INT NOT NULL,
    id_profesor INT NOT NULL,
    Dia VARCHAR(20) NOT NULL,
    Horario TIME NOT NULL,
    CupoMaximo INT NOT NULL,
    CONSTRAINT FK_Cronograma_Disciplina FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    CONSTRAINT FK_Cronograma_Sede FOREIGN KEY (id_sede) REFERENCES Sede(id_sede),
    CONSTRAINT FK_Cronograma_Profesor FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    CONSTRAINT CHK_CupoPositivo CHECK (CupoMaximo > 0)
);

CREATE TABLE Socio (
    id_socio INT PRIMARY KEY,
    id_membresia INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Mail VARCHAR(100) NULL,
    NumeroTelefono VARCHAR(20) NULL,
    FechaAlta DATE NOT NULL,
    EstadoMedico VARCHAR(255) NOT NULL,
    CONSTRAINT FK_Socio_Membresia FOREIGN KEY (id_membresia) REFERENCES Membresia(id_membresia)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY,
    id_cronograma INT NOT NULL,
    id_socio INT NOT NULL,
    FechaReserva DATETIME NOT NULL,
    CONSTRAINT FK_Reserva_Cronograma FOREIGN KEY (id_cronograma) REFERENCES Cronograma(id_cronograma),
    CONSTRAINT FK_Reserva_Socio FOREIGN KEY (id_socio) REFERENCES Socio(id_socio)
);

CREATE TABLE Pago (
    id_pago INT PRIMARY KEY,
    id_socio INT NOT NULL,
    Fecha DATE NOT NULL,
    Monto NUMERIC(10, 2) NOT NULL,
    MedioPago VARCHAR(50) NOT NULL,
    PeriodoCubierto VARCHAR(50) NOT NULL,
    CONSTRAINT Pago_Socio FOREIGN KEY (id_socio) REFERENCES Socio(id_socio),
    CONSTRAINT CHK_MontoPositivo CHECK (Monto > 0)
);

INSERT INTO Disciplina (id_disciplina, NombreDisciplina) VALUES 
(1, 'Yoga'), 
(2, 'Crossfit'), 
(3, 'Natacion'), 
(4, 'Pilates'),
(5, 'Zumba'), 
(6, 'Boxeo'), 
(7, 'Spinning'), 
(8, 'Kickboxing'),
(9, 'Gimnasia Artistica'), 
(10, 'Gimnasia Ritmica'), 
(11, 'Atletismo'),
(12, 'Futbol'), 
(13, 'Basquetball'), 
(14, 'Voleibol'), 
(15, 'Tenis'),
(16, 'Rugby'), 
(17, 'Hockey'),
(18, 'Ciclismo'), 
(19, 'Esgrima'),
(20, 'Artes Marciales');



INSERT INTO Sede (id_sede, Direccion, Telefono, CapacidadMaxima) VALUES 
(1, 'Av. Siempre Viva 123', '4444-1111', 20),
(2, 'Calle Falsa 456', '4444-2222', 15),
(3, 'Boulevard Central 789', '4444-3333', 10),
(4, 'Avenida Principal 321', '4444-4444', 12),
(5, 'Calle Secundaria 654', '4444-5555', 25),
(6, 'Plaza Mayor 987', '4444-6666', 30),
(7, 'Calle Tercera 111', '4444-7777', 18),
(8, 'Avenida Secundaria 222', '4444-8888', 22),
(9, 'Calle Cuarta 333', '4444-9999', 16),
(10, 'Boulevard Secundario 444', '4444-0000', 14),
(11, 'Avenida Tercera 555', '4444-1234', 20),
(12, 'Calle Quinta 666', '4444-2345', 18),
(13, 'Plaza Secundaria 777', '4444-3456', 25),
(14, 'Avenida Cuarta 888', '4444-4567', 30),
(15, 'Calle Sexta 999', '4444-5678', 12),
(16, 'Boulevard Terciario 1111', '4444-6789', 22),
(17, 'Avenida Quinta 2222', '4444-7890', 16),
(18, 'Calle Septima 3333', '4444-8901', 14),
(19, 'Plaza Terciaria 4444', '4444-9012', 20),
(20, 'Avenida Sexta 5555', '4444-0123', 18);

INSERT INTO Profesor (id_profesor, Nombre, DNI, Mail, NumeroTelefono) VALUES 
(1, 'Ana Lopez', '11222333', 'ana@mail.com', '1511110001'),
(2, 'Juan Perez', '22333444', 'juan@mail.com', '1511110002'),
(3, 'Luis Gomez', '33444555', 'luis@mail.com', '1511110003'),
(4, 'Sofia Martinez', '44555666', 'sofia@mail.com', '1511110004'),
(5, 'Diego Fernandez', '55666777', 'diego@mail.com', '1511110005'),
(6, 'Laura Sanchez', '66777888', 'laura@mail.com', '1511110006'),
(7, 'Carlos Ramirez', '77888999', 'carlos@mail.com', '1511110007'),
(8, 'Marta Diaz', '88999000', 'marta@mail.com', '1511110008'),
(9, 'Jorge Torres', '99000111', 'jorge@mail.com', '1511110009'),
(10, 'Lucia Alvarez', '10101010', 'lucia@mail.com', '1511110010'),
(11, 'Santiago Castro', '11111111', 'santiago@mail.com', '1511110011'),
(12, 'Valentina Ortiz', '12121212', 'valentina@mail.com', '1511110012'),
(13, 'Federico Ramirez', '13131313', 'federico@mail.com', '1511110013'),
(14, 'Camila Torres', '14141414', 'camila@mail.com', '1511110014'),
(15, 'Matias Fernandez', '15151515', 'matias@mail.com', '1511110015'),
(16, 'Sofia Gomez', '16161616', 'sofia@mail.com', '1511110016'),
(17, 'Diego Sanchez', '17171717', 'diego@mail.com', '1511110017'),
(18, 'Laura Ramirez', '18181818', 'laura@mail.com', '1511110018'),
(19, 'Carlos Diaz', '19191919', 'carlos@mail.com', '1511110019'),
(20, 'Marta Torres', '20202020', 'marta@mail.com', '1511110020');

INSERT INTO Membresia (id_membresia, NombrePlan, Costo, Beneficios) VALUES 
(1, 'Mensual', 50.00, 'Acceso ilimitado'),
(2, 'Anual', 500.00, 'Acceso ilimitado + descuentos'),
(3, 'Semestral', 250.00, 'Acceso ilimitado + 1 clase gratis'),
(4, 'Trimestral', 150.00, 'Acceso ilimitado + 2 clases gratis'),
(5, 'Familiar', 400.00, 'Acceso ilimitado para 4 personas'),
(6, 'Estudiante', 30.00, 'Acceso ilimitado con credencial de estudiante'),
(7, 'Senior', 40.00, 'Acceso ilimitado para mayores de 60 años'),
(8, 'Corporativo', 1000.00, 'Acceso ilimitado para empleados de una empresa'),
(9, 'VIP', 800.00, 'Acceso ilimitado + asesoramiento personalizado'),
(10, 'Promocional', 20.00, 'Acceso limitado a ciertas disciplinas'),
(11, 'Prueba', 10.00, 'Acceso limitado por 1 semana'),
(12, 'Premium', 600.00, 'Acceso ilimitado + beneficios exclusivos'),
(13, 'Básica', 40.00, 'Acceso limitado a ciertas disciplinas'),
(14, 'Plus', 70.00, 'Acceso ilimitado + 1 clase gratis al mes'),
(15, 'Gold', 900.00, 'Acceso ilimitado + beneficios VIP'),
(16, 'Silver', 300.00, 'Acceso ilimitado + descuentos en productos'),
(17, 'Bronze', 200.00, 'Acceso ilimitado + descuentos en clases'),
(18, 'Platinum', 1200.00, 'Acceso ilimitado + asesoramiento personalizado y beneficios VIP'),
(19, 'Diamond', 1500.00, 'Acceso ilimitado + beneficios exclusivos y asesoramiento personalizado'),
(20, 'Basic Plus', 60.00, 'Acceso limitado a ciertas disciplinas + 1 clase gratis al mes');

INSERT INTO Cronograma (id_cronograma, id_disciplina, id_sede, id_profesor, Dia, Horario, CupoMaximo) VALUES 
(1, 1, 1, 1, 'Lunes', '08:00:00', 20),
(2, 2, 2, 2, 'Martes', '10:00:00', 15),
(3, 3, 1, 3, 'Miércoles', '18:00:00', 10),
(4, 4, 2, 1, 'Jueves', '09:00:00', 12),
(5, 5, 3, 2, 'Viernes', '19:00:00', 25),
(6, 6, 4, 3, 'Sábado', '11:00:00', 30),
(7, 7, 5, 1, 'Domingo', '17:00:00', 18),
(8, 8, 6, 2, 'Lunes', '12:00:00', 22),
(9, 9, 7, 3, 'Martes', '14:00:00', 16),
(10, 10, 8, 1, 'Miércoles', '16:00:00', 14),
(11, 11, 9, 2, 'Jueves', '20:00:00', 20),
(12, 12, 10, 3, 'Viernes', '08:00:00', 18),
(13, 13, 11, 1, 'Sábado', '09:00:00', 25),
(14, 14, 12, 2, 'Domingo', '10:00:00', 30),
(15, 15, 13, 3, 'Lunes', '18:00:00', 12),
(16, 16, 14, 1, 'Martes', '19:00:00', 22),
(17, 17, 15, 2, 'Miércoles', '20:00:00', 16),
(18, 18, 16, 3, 'Jueves', '08:00:00', 14),
(19, 19, 17, 1, 'Viernes', '09:00:00', 20),
(20, 20, 18, 2, 'Sábado', '10:00:00', 18);

INSERT INTO Socio (id_socio, id_membresia, Nombre, DNI, Mail, NumeroTelefono, FechaAlta, EstadoMedico) VALUES 
(1, 1, 'Maria Garcia', '99888777', 'maria@mail.com', '1522220001', '2026-01-10', 'Apto'),
(2, 2, 'Carlos Ruiz', '88777666', 'carlos@mail.com', '1522220002', '2026-02-15', 'Apto'),
(3, 1, 'Lucia Fernandez', '77666555', 'lucia@mail.com', '1522220003', '2026-03-01', 'Apto'),
(4, 3, 'Sofia Lopez', '66555444', 'sofia@mail.com', '1522220004', '2026-03-15', 'Apto'),
(5, 4, 'Diego Martinez', '55444333', 'diego@mail.com', '1522220005', '2026-03-20', 'Apto'),
(6, 5, 'Laura Sanchez', '44333222', 'laura@mail.com', '1522220006', '2026-03-25', 'Apto'),
(7, 6, 'Jorge Ramirez', '33222111', 'jorge@mail.com', '1522220007', '2026-03-30', 'Apto'),
(8, 7, 'Marta Diaz', '22111000', 'marta@mail.com', '1522220008', '2026-04-01', 'Apto'),
(9, 8, 'Santiago Torres', '11000099', 'santiago@mail.com', '1522220009', '2026-04-05', 'Apto'),
(10, 9, 'Valentina Ortiz', '00009988', 'valentina@mail.com', '1522220010', '2026-04-10', 'Apto'),
(11, 10, 'Federico Ramirez', '99998877', 'federico@mail.com', '1522220011', '2026-04-15', 'Apto'),
(12, 11, 'Camila Torres', '88887766', 'camila@mail.com', '1522220012', '2026-04-20', 'Apto'),
(13, 12, 'Matias Fernandez', '77776655', 'matias@mail.com', '1522220013', '2026-04-25', 'Apto'),
(14, 13, 'Sofia Gomez', '66665544', 'sofia@mail.com', '1522220014', '2026-04-30', 'Apto'),
(15, 14, 'Diego Sanchez', '55554433', 'diego@mail.com', '1522220015', '2026-05-05', 'Apto'),
(16, 15, 'Laura Ramirez', '44443322', 'laura@mail.com', '1522220016', '2026-05-10', 'Apto'),
(17, 16, 'Carlos Diaz', '33332211', 'carlos@mail.com', '1522220017', '2026-05-15', 'Apto'),
(18, 17, 'Marta Torres', '22221100', 'marta@mail.com', '1522220018', '2026-05-20', 'Apto'),
(19, 18, 'Santiago Castro', '11110099', 'santiago@mail.com', '1522220019', '2026-05-25', 'Apto'),
(20, 19, 'Valentino Ortiz', '00009918', 'valentino@mail.com', '1522220020', '2026-05-30', 'Apto');

INSERT INTO Reserva (id_reserva, id_cronograma, id_socio, FechaReserva) VALUES 
(1, 1, 1, '2026-05-20 10:00:00'),
(2, 2, 2, '2026-05-20 11:00:00'),
(3, 3, 3, '2026-05-21 09:00:00'),
(4, 4, 4, '2026-05-21 10:00:00'),
(5, 5, 5, '2026-05-21 11:00:00'),
(6, 6, 6, '2026-05-22 08:00:00'),
(7, 7, 7, '2026-05-22 09:00:00'),
(8, 8, 8, '2026-05-22 10:00:00'),
(9, 9, 9, '2026-05-22 11:00:00'),
(10, 10, 10, '2026-05-23 08:00:00'),
(11, 11, 11, '2026-05-23 09:00:00'),
(12, 12, 12, '2026-05-23 10:00:00'),
(13, 13, 13, '2026-05-23 11:00:00'),
(14, 14, 14, '2026-05-24 08:00:00'),
(15, 15, 15, '2026-05-24 09:00:00'),
(16, 16, 16, '2026-05-24 10:00:00'),
(17, 17, 17, '2026-05-24 11:00:00'),
(18, 18, 18, '2026-05-25 08:00:00'),
(19, 19, 19, '2026-05-25 09:00:00'),
(20, 20, 20, '2026-05-25 10:00:00');

INSERT INTO Pago (id_pago, id_socio, Fecha, Monto, MedioPago, PeriodoCubierto) VALUES 
(1, 1, '2026-01-10', 50.00, 'Tarjeta', 'Enero'),
(2, 2, '2026-02-15', 500.00, 'Efectivo', 'Anual'),
(3, 3, '2026-03-01', 50.00, 'Transferencia', 'Marzo'),
(4, 4, '2026-03-15', 150.00, 'Tarjeta', 'Trimestral'),
(5, 5, '2026-03-20', 250.00, 'Efectivo', 'Semestral'),
(6, 6, '2026-03-25', 400.00, 'Transferencia', 'Familiar'),
(7, 7, '2026-03-30', 30.00, 'Tarjeta', 'Estudiante'),
(8, 8, '2026-04-01', 40.00, 'Efectivo', 'Senior'),
(9, 9, '2026-04-05', 1000.00, 'Transferencia', 'Corporativo'),
(10, 10, '2026-04-10', 800.00, 'Tarjeta', 'VIP'),
(11, 11, '2026-04-15', 20.00, 'Efectivo', 'Promocional'),
(12, 12, '2026-04-20', 10.00, 'Transferencia', 'Prueba'),
(13, 13, '2026-04-25', 600.00, 'Tarjeta', 'Premium'),
(14, 14, '2026-04-30', 40.00, 'Efectivo', 'Básica'),
(15, 15, '2026-05-05', 70.00, 'Transferencia', 'Plus'),
(16, 16, '2026-05-10', 900.00, 'Tarjeta', 'Gold'),
(17, 17, '2026-05-15', 300.00, 'Efectivo', 'Silver'),
(18, 18, '2026-05-20', 200.00, 'Transferencia', 'Bronze'),
(19, 19, '2026-05-25', 1200.00, 'Tarjeta', 'Platinum'),
(20, 20, '2026-05-30', 1500.00, 'Efectivo', 'Diamond');

-- Listado de socios con su plan y fecha de alta
SELECT s.id_socio, s.Nombre, s.DNI, m.NombrePlan, s.FechaAlta
FROM Socio s
JOIN Membresia m ON s.id_membresia = m.id_membresia
ORDER BY s.FechaAlta DESC;

-- Disciplinas disponibles
SELECT *
FROM Disciplina
ORDER BY NombreDisciplina;

-- Profesores y datos de contacto
SELECT id_profesor, Nombre, DNI, Mail, NumeroTelefono
FROM Profesor;

-- Cronograma con disciplina, profesor y sede
SELECT c.id_cronograma, d.NombreDisciplina, p.Nombre AS Profesor, s.Direccion AS Sede, c.Dia, c.Horario, c.CupoMaximo
FROM Cronograma c
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
JOIN Profesor p ON c.id_profesor = p.id_profesor
JOIN Sede s ON c.id_sede = s.id_sede
ORDER BY c.Dia, c.Horario;

-- Pagos del mes de mayo
SELECT *
FROM Pago
WHERE Fecha >= '2026-05-01' AND Fecha < '2026-06-01'
ORDER BY Fecha;

-- Reservas con detalle de socio, disciplina, profesor y sede
SELECT r.id_reserva, r.FechaReserva, so.Nombre AS Socio, d.NombreDisciplina, p.Nombre AS Profesor, se.Direccion AS Sede
FROM Reserva r
JOIN Socio so ON r.id_socio = so.id_socio
JOIN Cronograma c ON r.id_cronograma = c.id_cronograma
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
JOIN Profesor p ON c.id_profesor = p.id_profesor
JOIN Sede se ON c.id_sede = se.id_sede;

-- Total pagado por cada socio (incluye los que no pagaron nada)
SELECT s.id_socio, s.Nombre, ISNULL(SUM(p.Monto), 0) AS TotalPagado
FROM Socio s
LEFT JOIN Pago p ON p.id_socio = s.id_socio
GROUP BY s.id_socio, s.Nombre
ORDER BY TotalPagado DESC;

-- Profesores y disciplinas que dictan
SELECT DISTINCT p.Nombre, d.NombreDisciplina
FROM Profesor p
JOIN Cronograma c ON p.id_profesor = c.id_profesor
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina;

-- Cantidad de clases programadas por sede
SELECT se.Direccion, COUNT(c.id_cronograma) AS CantClases
FROM Sede se
LEFT JOIN Cronograma c ON se.id_sede = c.id_sede
GROUP BY se.Direccion;

-- Socios y las disciplinas en las que reservaron
SELECT DISTINCT so.Nombre AS Socio, d.NombreDisciplina
FROM Socio so
JOIN Reserva r ON so.id_socio = r.id_socio
JOIN Cronograma c ON r.id_cronograma = c.id_cronograma
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina;

-- Total recaudado por medio de pago
SELECT MedioPago, COUNT(*) AS Cant, SUM(Monto) AS Total
FROM Pago
GROUP BY MedioPago
ORDER BY Total DESC;

-- Cantidad de reservas por disciplina
SELECT d.NombreDisciplina, COUNT(r.id_reserva) AS CantReservas
FROM Disciplina d
LEFT JOIN Cronograma c ON d.id_disciplina = c.id_disciplina
LEFT JOIN Reserva r ON c.id_cronograma = r.id_cronograma
GROUP BY d.NombreDisciplina
ORDER BY CantReservas DESC;

-- Promedio de pago por plan
SELECT m.NombrePlan, AVG(p.Monto) AS Promedio, COUNT(p.id_pago) AS CantPagos
FROM Membresia m
JOIN Socio s ON m.id_membresia = s.id_membresia
JOIN Pago p ON s.id_socio = p.id_socio
GROUP BY m.NombrePlan;

-- Disciplinas con mas de 2 reservas 
SELECT d.NombreDisciplina, COUNT(r.id_reserva) AS CantReservas
FROM Disciplina d
JOIN Cronograma c ON d.id_disciplina = c.id_disciplina
JOIN Reserva r ON c.id_cronograma = r.id_cronograma
GROUP BY d.NombreDisciplina
HAVING COUNT(r.id_reserva) >= 1;

-- Profesores con mas de 2 clases asignadas
SELECT p.Nombre, COUNT(c.id_cronograma) AS CantClases
FROM Profesor p
JOIN Cronograma c ON p.id_profesor = c.id_profesor
GROUP BY p.Nombre
HAVING COUNT(c.id_cronograma) > 2;

-- Recaudacion por mes
SELECT YEAR(Fecha) AS Anio, MONTH(Fecha) AS Mes, SUM(Monto) AS Total
FROM Pago
GROUP BY YEAR(Fecha), MONTH(Fecha)
ORDER BY Anio, Mes;

-- Subconsulta escalar: socios cuyo total pagado supera el promedio general
SELECT s.id_socio, s.Nombre, SUM(p.Monto) AS TotalPagado
FROM Socio s
JOIN Pago p ON s.id_socio = p.id_socio
GROUP BY s.id_socio, s.Nombre
HAVING SUM(p.Monto) > (SELECT AVG(Monto) FROM Pago);

-- Subconsulta con IN: socios que reservaron clases de Yoga
SELECT id_socio, Nombre
FROM Socio
WHERE id_socio IN (
    SELECT r.id_socio
    FROM Reserva r
    JOIN Cronograma c ON r.id_cronograma = c.id_cronograma
    JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
    WHERE d.NombreDisciplina = 'Yoga'
);

-- Subconsulta con EXISTS: profesores con al menos una clase asignada
SELECT id_profesor, Nombre
FROM Profesor p
WHERE EXISTS (SELECT 1 FROM Cronograma c WHERE c.id_profesor = p.id_profesor);

-- Subconsulta con NOT EXISTS: socios que nunca reservaron
SELECT id_socio, Nombre
FROM Socio s
WHERE NOT EXISTS (SELECT 1 FROM Reserva r WHERE r.id_socio = s.id_socio);

-- Subconsulta correlacionada: ultimo pago de cada socio mayor al promedio de su plan 
SELECT s.Nombre, m.NombrePlan, p.Monto AS UltimoMonto, p.Fecha
FROM Socio s
JOIN Membresia m ON s.id_membresia = m.id_membresia
JOIN Pago p ON p.id_socio = s.id_socio
WHERE p.Fecha = (SELECT MAX(p2.Fecha) FROM Pago p2 WHERE p2.id_socio = s.id_socio)
AND p.Monto >= (
    SELECT AVG(p3.Monto)
    FROM Pago p3
    JOIN Socio s3 ON p3.id_socio = s3.id_socio
    WHERE s3.id_membresia = s.id_membresia
);

-- Subconsulta correlacionada: clases con ocupacion mayor o igual al 80% 
SELECT c.id_cronograma, d.NombreDisciplina, c.Dia, c.Horario, c.CupoMaximo,
    (SELECT COUNT(*) FROM Reserva r WHERE r.id_cronograma = c.id_cronograma) AS Ocupacion
FROM Cronograma c
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
WHERE (SELECT COUNT(*) FROM Reserva r WHERE r.id_cronograma = c.id_cronograma) * 1.0 / c.CupoMaximo >= 0.05;


--Vista 1 
DROP VIEW IF EXISTS vw_SociosActivos;
GO

CREATE VIEW vw_SociosActivos AS
SELECT s.id_socio, s.Nombre, s.DNI, s.Mail, s.NumeroTelefono, s.FechaAlta, s.EstadoMedico, m.NombrePlan, m.Costo, m.Beneficios
FROM Socio s
JOIN Membresia m ON s.id_membresia = m.id_membresia;
GO

-- Uso: 
SELECT * FROM vw_SociosActivos ORDER BY FechaAlta DESC;
GO


--Vista 2 
DROP VIEW IF EXISTS vw_CronogramaCompleto;
GO

CREATE VIEW vw_CronogramaCompleto AS
SELECT c.id_cronograma, d.NombreDisciplina, p.Nombre AS Profesor, p.Mail AS MailProfesor, se.Direccion AS Sede, se.Telefono    AS TelefonoSede, c.Dia, c.Horario, c.CupoMaximo
FROM Cronograma c
JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
JOIN Profesor p ON c.id_profesor = p.id_profesor
JOIN Sede se ON c.id_sede = se.id_sede;
GO

-- Uso:
SELECT * FROM vw_CronogramaCompleto WHERE Dia = 'Lunes';


--Vista 3
DROP VIEW IF EXISTS vw_ReservasSocios;
GO

CREATE VIEW vw_ReservasSocios AS
SELECT r.id_reserva,so.Nombre AS Socio, d.NombreDisciplina, c.Dia, c.Horario, se.Direccion AS Sede, r.FechaReserva
FROM Reserva r
INNER JOIN Socio so ON r.id_socio = so.id_socio
INNER JOIN Cronograma c ON r.id_cronograma = c.id_cronograma
INNER JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
INNER JOIN Sede se ON c.id_sede = se.id_sede;
GO

-- Uso:
SELECT * FROM vw_ReservasSocios WHERE Socio = 'Maria Garcia';


-- Triggers --


-- Membresia con costo mayor a 5000
GO
CREATE TRIGGER TR_CostoMayorA5000
ON Membresia
AFTER INSERT
AS
BEGIN

	DECLARE @NombrePlan VARCHAR(50)
	DECLARE @Costo DECIMAL(10,2)

	SELECT 
		@NombrePlan = NombrePlan,
		@Costo = Costo
	FROM inserted;

	IF @Costo > 50000
	BEGIN
		PRINT 'El costo de la membresia '  +  @NombrePlan + ' es mayor a $5000'
	END
	ELSE
	BEGIN
		PRINT 'El costo de la membresia '  +  @NombrePlan + ' es menor a $5000'
	END
END;
GO

-- Monto mayor a 1000
CREATE TRIGGER TR_MontoMayorA1000
ON Pago
AFTER INSERT
AS
BEGIN

    DECLARE @ID INT
    DECLARE @Monto DECIMAL(10,2)

    SELECT
        @ID = id_socio,
        @Monto = Monto
    FROM inserted;

    IF @Monto > 1000
    BEGIN
        PRINT 'El socio con ID ' + CAST(@ID AS VARCHAR(10))
              + ' realizo un pago alto de $'
              + CAST(@Monto AS VARCHAR(20))
    END
    ELSE
    BEGIN
        PRINT 'Pago registrado correctamente.'
    END

END;
GO

-- Pago con metodo tarjeta
CREATE TRIGGER TR_PagoTarjeta
ON Pago
AFTER INSERT
AS
BEGIN

    DECLARE @MedioPago VARCHAR(50)

    SELECT @MedioPago = MedioPago
    FROM inserted;

    IF @MedioPago = 'Tarjeta'
    BEGIN
        PRINT 'El pago fue realizado con tarjeta'
    END
    ELSE
    BEGIN
        PRINT 'El pago fue realizado por otro medio'
    END

END;
GO

-- Clases cuyo horario sean a la 10:00 AM
CREATE TRIGGER TR_Clase10AM
ON Cronograma
AFTER INSERT
AS
BEGIN

    DECLARE @Horario TIME

    SELECT @Horario = Horario
    FROM inserted;

    IF @Horario = '10:00:00'
    BEGIN
        PRINT 'Se programo una clase a las 10:00 AM'
    END
    
END;
GO

-- Membresia VIP
CREATE TRIGGER TR_MembresiaVIP
ON Membresia
AFTER INSERT
AS
BEGIN

    DECLARE @NombrePlan VARCHAR(50)

    SELECT @NombrePlan = NombrePlan
    FROM inserted;

    IF @NombrePlan = 'VIP'
    BEGIN
        PRINT 'Se agrego una membresia VIP.'
    END

END;
GO

-- Pago anual
CREATE TRIGGER TR_PagoAnual
ON Pago
AFTER INSERT
AS
BEGIN

    DECLARE @Periodo VARCHAR(50)

    SELECT @Periodo = PeriodoCubierto
    FROM inserted;

    IF @Periodo = 'Anual'
    BEGIN
        PRINT 'Se registro un pago de membresia anual.'
    END

END;
GO

-- Insercion compleja: agregar una clase al cronograma
CREATE PROCEDURE SP_AgregarClaseCronograma
    @id_cronograma INT,
    @id_disciplina INT,
    @id_sede INT,
    @id_profesor INT,
    @Dia VARCHAR(20),
    @Horario TIME,
    @CupoMaximo INT
AS
BEGIN

    IF EXISTS (SELECT 1 FROM Cronograma WHERE id_cronograma = @id_cronograma)
    BEGIN
        RAISERROR('Ya existe una clase con ese id_cronograma.', 16, 1);
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM Disciplina WHERE id_disciplina = @id_disciplina)
    BEGIN
        RAISERROR('No existe la disciplina ingresada.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Sede WHERE id_sede = @id_sede)
    BEGIN
        RAISERROR('No existe la sede ingresada.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Profesor WHERE id_profesor = @id_profesor)
    BEGIN
        RAISERROR('No existe el profesor ingresado.', 16, 1);
        RETURN
    END

    IF @CupoMaximo <= 0
    BEGIN
        RAISERROR('El cupo maximo debe ser mayor a cero.', 16, 1);
        RETURN
    END

    IF @CupoMaximo > (SELECT CapacidadMaxima FROM Sede WHERE id_sede = @id_sede)
    BEGIN
        RAISERROR('El cupo maximo no puede superar la capacidad maxima de la sede.', 16, 1);
        RETURN
    END

    IF EXISTS (SELECT 1 FROM Cronograma WHERE id_profesor = @id_profesor AND Dia = @Dia AND Horario = @Horario)
    BEGIN
        RAISERROR('El profesor ya tiene una clase asignada en ese dia y horario.', 16, 1);
        RETURN
    END

    IF EXISTS (SELECT 1 FROM Cronograma WHERE id_sede = @id_sede AND Dia = @Dia AND Horario = @Horario)
    BEGIN
        RAISERROR('La sede ya tiene una clase asignada en ese dia y horario.', 16, 1);
        RETURN
    END

    INSERT INTO Cronograma (id_cronograma, id_disciplina, id_sede, id_profesor, Dia, Horario, CupoMaximo)
    VALUES (@id_cronograma, @id_disciplina, @id_sede, @id_profesor, @Dia, @Horario, @CupoMaximo)

    PRINT 'Clase agregada correctamente al cronograma'

END;
GO

--Ejemplo de uso
BEGIN TRANSACTION

EXEC SP_AgregarClaseCronograma
    @id_cronograma = 21,
    @id_disciplina = 1,
    @id_sede = 1,
    @id_profesor = 4,
    @Dia = 'Lunes',
    @Horario = '15:00:00',
    @CupoMaximo = 15;

SELECT *
FROM Cronograma


ROLLBACK TRANSACTION


-- Insercion compleja: registrar un nuevo socio
GO
CREATE OR ALTER PROCEDURE sp_RegistrarSocio
    @id_socio INT,
    @id_membresia INT,
    @Nombre VARCHAR(50),
    @DNI VARCHAR(20),
    @Mail VARCHAR(100),
    @NumeroTelefono VARCHAR(20),
    @FechaAlta DATE,
    @EstadoMedico VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar que el DNI no este registrado
        IF EXISTS (SELECT 1 FROM Socio WHERE DNI = @DNI)
        BEGIN
            RAISERROR('Ya existe un socio con ese DNI.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validar que la membresia exista
        IF NOT EXISTS (SELECT 1 FROM Membresia WHERE id_membresia = @id_membresia)
        BEGIN
            RAISERROR('La membresia indicada no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO Socio (id_socio, id_membresia, Nombre, DNI, Mail, NumeroTelefono, FechaAlta, EstadoMedico)
        VALUES (@id_socio, @id_membresia, @Nombre, @DNI, @Mail, @NumeroTelefono, @FechaAlta, @EstadoMedico);

        COMMIT TRANSACTION;
        PRINT 'Socio registrado exitosamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error al registrar el socio: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO

--Ejemplo de uso
BEGIN TRANSACTION

EXEC sp_RegistrarSocio
    @id_socio       = 21,
    @id_membresia   = 1,
    @Nombre         = 'Pedro Alvarez',
    @DNI            = '12345678',
    @Mail           = 'pedro@mail.com',
    @NumeroTelefono = '1533330001',
    @FechaAlta      = '2026-06-01',
    @EstadoMedico   = 'Apto';

SELECT *
FROM Socio

ROLLBACK TRANSACTION


-- Consulta parametrizada: Cronograma por disciplina y dia
GO
CREATE OR ALTER PROCEDURE sp_ConsultarCronograma
    @NombreDisciplina VARCHAR(100) = NULL,
    @Dia              VARCHAR(20)  = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.id_cronograma,
        d.NombreDisciplina,
        p.Nombre AS Profesor,
        se.Direccion AS Sede,
        c.Dia,
        c.Horario,
        c.CupoMaximo,
        COUNT(r.id_reserva) AS ReservasActuales,
        c.CupoMaximo - COUNT(r.id_reserva) AS LugaresDisponibles
    FROM Cronograma c
    JOIN Disciplina d ON c.id_disciplina = d.id_disciplina
    JOIN Profesor p ON c.id_profesor = p.id_profesor
    JOIN Sede se ON c.id_sede = se.id_sede
    LEFT JOIN Reserva r ON c.id_cronograma = r.id_cronograma
    WHERE (@NombreDisciplina IS NULL OR d.NombreDisciplina = @NombreDisciplina)
    AND (@Dia IS NULL OR c.Dia = @Dia)
    GROUP BY c.id_cronograma, d.NombreDisciplina, p.Nombre, se.Direccion, c.Dia, c.Horario, c.CupoMaximo
    ORDER BY c.Dia, c.Horario;
END;
GO

-- Ejemplos de uso 
EXEC sp_ConsultarCronograma @NombreDisciplina = 'Yoga';
GO

EXEC sp_ConsultarCronograma @Dia = 'Lunes';
GO

EXEC sp_ConsultarCronograma @NombreDisciplina = 'Futbol', @Dia = 'Viernes';
GO


-- Consulta parametrizada: Socios por tipo de membresia
CREATE OR ALTER PROCEDURE sp_ConsultarSociosPorMembresia
    @NombrePlan VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        s.id_socio,
        s.Nombre,
        s.DNI,
        s.Mail,
        s.NumeroTelefono,
        s.FechaAlta,
        s.EstadoMedico,
        m.NombrePlan,
        m.Costo
    FROM Socio s
    JOIN Membresia m ON s.id_membresia = m.id_membresia
    WHERE (@NombrePlan IS NULL OR m.NombrePlan = @NombrePlan)
    ORDER BY m.NombrePlan, s.Nombre;
END;
GO

EXEC sp_ConsultarSociosPorMembresia @NombrePlan = 'Mensual';
GO