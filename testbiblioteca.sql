-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS testbiblioteca;
USE testbiblioteca;

-- Crear la tabla 'materias'
CREATE TABLE IF NOT EXISTS materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(255) NOT NULL,
    semestre INT NOT NULL,
    descripcion_materia TEXT
);

-- Insertar las materias
INSERT INTO materias (nombre_materia, semestre, descripcion_materia) VALUES
('Comunicación oral y escrita', 1, 'Desarrollo de habilidades de comunicación oral y escrita.'),
('Tecnologías de la información y comunicación (TIC)', 1, 'Introducción a las TIC y su importancia en la sociedad.'),
('Algoritmos y pseudocódigo', 1, 'Fundamentos de algoritmos y estructuras básicas de programación.'),
('Matemática básica', 1, 'Conceptos fundamentales de matemáticas aplicadas.'),
('Física y laboratorio', 1, 'Estudio de los principios básicos de la física y prácticas de laboratorio.'),
('Álgebra lineal', 1, 'Teoría de matrices y vectores, fundamentos del álgebra lineal.'),
('Fundamentos de la investigación', 2, 'Técnicas básicas de investigación científica y estructuración de proyectos.'),
('Contextos e interculturalidad', 2, 'Estudio de la diversidad cultural y su impacto en la sociedad moderna.'),
('Programación estructurada y funcional', 2, 'Introducción a la programación estructurada y principios de programación funcional.'),
('Cálculo diferencial e integral', 2, 'Estudio de los conceptos básicos de cálculo, derivadas e integrales.'),
('Sistemas electrónicos digitales', 2, 'Estudio de circuitos y sistemas electrónicos.'),
('Estructuras discretas', 2, 'Estudio de teoría de conjuntos, lógica y combinatoria.'),
('Jesucristo y la persona de hoy', 3, 'Análisis de la figura de Jesucristo en la actualidad.'),
('Redes I', 3, 'Fundamentos de redes de comunicación y su configuración.'),
('Estructura de datos', 3, 'Estudio de estructuras de datos como listas, pilas, colas, y árboles.'),
('Lectura y escritura académica', 3, 'Desarrollo de habilidades de lectura y escritura en el contexto académico.'),
('Arquitectura de computadores', 3, 'Estudio de los componentes internos de las computadoras y su funcionamiento.'),
('Estadística y probabilidades', 3, 'Conceptos fundamentales de estadística y teoría de probabilidades.'),
('Filosofía de las ciencias computacionales', 4, 'Reflexión filosófica sobre la computación y sus implicaciones sociales.'),
('Redes II', 4, 'Conceptos avanzados en redes de comunicación y su administración.'),
('Programación orientada a objetos', 4, 'Fundamentos de la programación orientada a objetos y sus aplicaciones.'),
('Base de datos 1', 4, 'Conceptos fundamentales sobre bases de datos y su diseño.'),
('Sistemas operativos', 4, 'Estudio de los sistemas operativos y sus componentes principales.'),
('Internet de las cosas', 4, 'Tecnologías que permiten la comunicación entre dispositivos inteligentes.'),
('Ética personal y socioambiental', 5, 'Reflexión sobre ética personal y su impacto en el entorno social y ambiental.'),
('Redes inalámbricas', 5, 'Estudio de las redes de comunicación inalámbrica.'),
('Desarrollo basado en plataformas', 5, 'Uso de plataformas tecnológicas para el desarrollo de software.'),
('Base de datos 2', 5, 'Profundización en bases de datos, consultas avanzadas y administración.'),
('Administración de sistemas operativos', 5, 'Estudio de la administración y gestión de sistemas operativos.'),
('Arquitectura y plataforma de servidores', 5, 'Diseño y administración de arquitecturas de servidores.'),
('Emprendimiento tecnológico', 6, 'Fomento de la innovación y el emprendimiento en tecnología.'),
('Redes inteligentes', 6, 'Estudio de redes de comunicación avanzadas y su inteligencia.'),
('Ingeniería de software', 6, 'Métodos y herramientas en el desarrollo de software de calidad.'),
('Administración de base de datos', 6, 'Gestión y administración de bases de datos complejas.'),
('Fundamentos de ciberseguridad', 6, 'Fundamentos de seguridad informática y protección de datos.'),
('Virtualización', 6, 'Tecnologías de virtualización de servidores y redes.'),
('Diseño y evaluación de proyectos', 7, 'Metodología para el diseño y evaluación de proyectos tecnológicos.'),
('Gestión y seguridad de redes', 7, 'Administración de redes con enfoque en la seguridad.'),
('Interacción humano-computadora', 7, 'Estudio de la interacción entre los usuarios y los sistemas informáticos.'),
('Herramientas y técnicas de ciberseguridad', 7, 'Herramientas utilizadas en la protección de sistemas informáticos.'),
('Prácticas pre profesionales', 7, 'Desarrollo de competencias profesionales a través de prácticas en empresas.'),
('Prácticas de servicio a la comunidad', 7, 'Actividades de servicio social relacionadas con la tecnología.'),
('Deontología profesional y legislación', 8, 'Estudio de los principios éticos y legales en el campo de la informática.'),
('Cloud computing', 8, 'Fundamentos de la computación en la nube y sus aplicaciones.'),
('Gestión y gobierno de ti', 8, 'Gestión y control de la infraestructura tecnológica en las organizaciones.'),
('Tópicos especiales de base de datos', 8, 'Temas avanzados en la administración y optimización de bases de datos.'),
('Auditoría informática', 8, 'Auditoría y control de sistemas informáticos y su seguridad.'),
('Unidad de integración curricular', 8, 'Integración de todos los conocimientos adquiridos durante la carrera.');

-- Crear la tabla 'libros'
CREATE TABLE IF NOT EXISTS libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    id_materia INT,
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

-- Insertar 6 libros recomendados por materia, por semestre

-- Semestre 1
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Introducción a la Comunicación', 'John Doe', 1),
('Guía Completa de las TIC', 'Jane Smith', 2),
('Algoritmos y pseudocódigo', 'Carlos González', 3),
('Matemática Básica para Ingenieros', 'Pedro Martínez', 4),
('Física para Todos', 'Luis Pérez', 5),
('Álgebra Lineal: Una Aproximación', 'Ana López', 6);

-- Semestre 2
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Métodos de Investigación Científica', 'Felipe Rodríguez', 7),
('Interculturalidad y Sociedad', 'María García', 8),
('Programación Funcional para Todos', 'Juan Díaz', 9),
('Cálculo Diferencial: Fundamentos y Aplicaciones', 'José Sánchez', 10),
('Sistemas Electrónicos Digitales: Una Introducción', 'Marcelo Fernández', 11),
('Estructuras Discretas y su Aplicación', 'Laura Martínez', 12);

-- Semestre 3
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Teología y Filosofía Cristiana', 'Antonio Ruiz', 13),
('Redes de Computadoras: Un Enfoque Práctico', 'Esteban Morales', 14),
('Estructura de Datos: Teoría y Práctica', 'Ricardo García', 15),
('Escritura Académica Avanzada', 'Sofía Hernández', 16),
('Arquitectura de Computadores: Fundamentos', 'Raúl Sánchez', 17),
('Estadística para Ingenieros', 'Marta López', 18);

-- Semestre 4
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Filosofía de la Computación', 'Esteban Pérez', 19),
('Redes de Alta Velocidad', 'Luis Miguel', 20),
('Programación Orientada a Objetos', 'Carlos Ramírez', 21),
('Bases de Datos Relacionales', 'Antonio Sánchez', 22),
('Sistemas Operativos: Teoría y Práctica', 'Julio Torres', 23),
('Introducción al Internet de las Cosas', 'María González', 24);

-- Semestre 5
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Ética Profesional en Tecnologías', 'José Luis Álvarez', 25),
('Redes Inalámbricas: Teoría y Práctica', 'Martín Gómez', 26),
('Desarrollo de Software en Plataformas', 'Sandra Rodríguez', 27),
('Base de Datos 2: Consultas Avanzadas', 'Patricia Gómez', 28),
('Administración de Sistemas Operativos', 'Carlos Fernández', 29),
('Arquitectura y Diseño de Servidores', 'David López', 30);

-- Semestre 6
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Emprendimiento Tecnológico', 'Santiago Díaz', 31),
('Redes Inteligentes: Nuevas Tendencias', 'Pedro López', 32),
('Ingeniería de Software: Principios y Métodos', 'Raúl Martínez', 33),
('Administración de Base de Datos Avanzada', 'José Ruiz', 34),
('Ciberseguridad: Protección de Sistemas', 'Fernando Torres', 35),
('Virtualización en la Era Digital', 'Carlos Pérez', 36);

-- Semestre 7
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Gestión de Proyectos Tecnológicos', 'Laura González', 37),
('Seguridad en Redes Computacionales', 'Antonio Pérez', 38),
('Interacción Humano-Computadora: Diseño de Interfaces', 'María Álvarez', 39),
('Ciberseguridad: Herramientas y Técnicas', 'Felipe Sánchez', 40),
('Prácticas Pre Profesionales en TI', 'Raúl García', 41),
('Prácticas de Servicio a la Comunidad en TI', 'Ana Sánchez', 42);

-- Semestre 8
INSERT INTO libros (titulo, autor, id_materia) VALUES
('Deontología Profesional en TI', 'Luis Álvarez', 43),
('Cloud Computing: Fundamentos y Aplicaciones', 'Esteban Sánchez', 44),
('Gestión y Gobierno de la Tecnología de Información', 'Patricia Torres', 45),
('Tópicos Avanzados en Bases de Datos', 'Carlos Martínez', 46),
('Auditoría Informática: Teoría y Práctica', 'José González', 47),
('Integración Curricular en la Educación Tecnológica', 'Sandra López', 48);
