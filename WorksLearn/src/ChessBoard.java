import javax.swing.*;
import java.awt.*;

public class ChessBoard extends JPanel {
    private int a = 250;
    private int n = 5;

    public ChessBoard() {
        setPreferredSize(new Dimension(a, a));
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        int cellSize = a / n;

        for (int row = 0; row < n; row++) {
            for (int col = 0; col < n; col++) {
                boolean isBlack = ((row + col) % 2 == (n % 2 == 0 ? 1 : 0));

                if (isBlack) {
                    g.setColor(Color.BLACK);
                } else {
                    g.setColor(Color.WHITE);
                }

                g.fillRect(col * cellSize, row * cellSize, cellSize, cellSize);
            }
        }
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Шахматная доска");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(new ChessBoard());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}