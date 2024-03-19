import rikkei.academy.QuadraticEquationSolver;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("======= GIẢI PHƯƠNG TRÌNH BẬC 2 ========");
        System.out.println("===== Nhập Các hệ số a,b,c cho phương trình a.x^2 + b.x + c = 0");
        System.out.print("Nhập a: ");
        int a = scanner.nextInt();
        System.out.print("Nhập b: ");
        int b = scanner.nextInt();
        System.out.print("Nhập c: ");
        int c = scanner.nextInt();
        QuadraticEquationSolver quadraticEquationSolver = new QuadraticEquationSolver();
        quadraticEquationSolver.solveQuadraticEquation(a,b,c);
    }
}