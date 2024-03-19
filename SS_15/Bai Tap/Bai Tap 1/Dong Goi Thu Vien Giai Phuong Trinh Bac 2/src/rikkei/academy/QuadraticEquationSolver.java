package rikkei.academy;

public class QuadraticEquationSolver {
    // Phương thức giải phương trình bậc 2
    public void solveQuadraticEquation(double a, double b, double c) {
        // Tính delta
        double delta = b * b - 4 * a * c;

        // Kiểm tra giá trị của delta
        if (delta > 0) {
            // Phương trình có 2 nghiệm phân biệt
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            double x2 = (-b - Math.sqrt(delta)) / (2 * a);
            System.out.println("Phương trình có 2 nghiệm phân biệt:");
            System.out.println("x1 = " + x1);
            System.out.println("x2 = " + x2);
        } else if (delta == 0) {
            // Phương trình có nghiệm kép
            double x = -b / (2 * a);
            System.out.println("Phương trình có nghiệm kép:");
            System.out.println("x = " + x);
        } else {
            // Phương trình không có nghiệm thực
            System.out.println("Phương trình không có nghiệm thực");
        }
    }
}
