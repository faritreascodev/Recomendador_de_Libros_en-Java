package main;

import java.sql.*;
import java.util.Scanner;

public class main {
    // Método para conectar a la base de datos
    public static Connection ConectarBD(String bd) {
        Connection conexion = null;
        // Datos de la BD
        String host = "jdbc:mysql://localhost/";  // Puerto por defecto de MySQL:3306/
        String user = "root"; // usuario por defecto
        String pass = ""; // Contraseña por defecto (cambiar si es necesario)

        System.out.println("Conectando a la base de datos...");

        try {
            conexion = DriverManager.getConnection(host + bd, user, pass);
            System.out.println("¡Conexión exitosa!");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }

        return conexion;
    }

    // Método para cerrar la conexión
    public static void Desconexion(Connection cbd) {
        try {
            cbd.close();
            System.out.println("Desconectado de la base de datos...");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    // Método para consultar los libros recomendados por materia y semestre
    public static void consultarLibros(Connection conexion, String semestre, String materia) {
        // Consulta SQL para obtener los libros recomendados
        String query = "SELECT libros.titulo, libros.autor " +
                "FROM libros " +
                "JOIN materias ON libros.id_materia = materias.id_materia " +
                "WHERE materias.nombre_materia = ? AND materias.semestre = ?";

        try (PreparedStatement stmt = conexion.prepareStatement(query)) {
            // Establecer los parámetros de la consulta
            stmt.setString(1, materia);  // Nombre de la materia
            stmt.setInt(2, Integer.parseInt(semestre));  // Semestre

            // Ejecutar la consulta
            ResultSet rs = stmt.executeQuery();

            // Mostrar los resultados
            boolean found = false;
            while (rs.next()) {
                found = true;
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                System.out.println("Título: " + titulo + ", Autor: " + autor);
            }

            if (!found) {
                System.out.println("No se encontraron libros recomendados para la materia '" + materia + "' en el semestre " + semestre + ".");
            }

        } catch (SQLException e) {
            System.out.println("Error al realizar la consulta: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        // Mensaje de presentación
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║   -Sistema de Recomendación de Libros- ║");
        System.out.println("╚════════════════════════════════════════╝\n");
        // Crear un scanner para que el usuario ingrese los datos
        Scanner scanner = new Scanner(System.in);

        // Ingresar el semestre y la materia
        System.out.print("Ingrese el semestre que está cursando (por ejemplo, '1', '2', etc.): ");
        String semestre = scanner.nextLine();
        System.out.print("Ingrese la materia que desea buscar: ");
        String materia = scanner.nextLine();

        System.out.println("════════════════════════════════════════");
        // Conectar a la base de datos 'testbiblioteca'
        Connection bd = ConectarBD("testbiblioteca");
        System.out.println("════════════════════════════════════════");

        // Consultar los libros recomendados
        consultarLibros(bd, semestre, materia);
        System.out.println("════════════════════════════════════════");

        // Cerrar la conexión
        Desconexion(bd);

        scanner.close();  // Cerrar el scanner

        System.out.println("\n╔════════════════════════════════════════╗");
        System.out.println("║   ¡Gracias por usar la Biblioteca!     ║");
        System.out.println("╚════════════════════════════════════════╝");
    }
}