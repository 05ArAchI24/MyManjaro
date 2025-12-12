import javax.swing.*;
import java.awt.*;

public class Mishen extends JPanel {
    private int w = 50;
    private int n = 3;
    private static final Color[] COLORS = {Color.RED, Color.GREEN, Color.BLUE};

    public Mishen() {
        setPreferredSize(new Dimension(w * n * 2, w * n * 2));
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        int centerX = getWidth() / 2;
        int centerY = getHeight() / 2;

        for (int i = 0; i < n; i++) {
            int radius = w * (n - i);
            Color color = COLORS[i % COLORS.length];
            g.setColor(color);
            g.fillOval(centerX - radius, centerY - radius, radius * 2, radius * 2);
        }
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Мишень");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(new Mishen());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}