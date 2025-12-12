import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ClassWork439065 extends JPanel {

    //Colors
    Color pc1 = new Color(230, 188, 9);
    Color pc2 = new Color(28, 214, 205);
    Color bc = new Color(55, 150, 255);
    Color fc = new Color(55, 150, 255);
    Color bg = new Color(4, 29, 55);

    // Size
    int pw = 10; // ширина ракетки
    int ph = 80; // высота ракетки
    int bs = 10; // размер мяча
    int bv_x = 5; // скорочть по оси x
    int bv_y = 5; // скорость по оси y

    int w = 800;
    int h = 600;

    // game objects
    Rectangle pad1 = new Rectangle(pw, h / 2 - ph / 2, pw, ph);
    Rectangle pad2 = new Rectangle(w - pw * 13, h / 2 - ph / 2, pw, ph);
    Rectangle ball = new Rectangle(w / 2 - bs / 2, h / 2 - bs / 2, bs, bs);

    //конструктор
    public ClassWork439065() {
        setBackground(bg);
        setPreferredSize(new Dimension(w, h));

        addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                switch (e.getKeyCode()) {
                    case KeyEvent.VK_W:
                        pad1.y = Math.max(pad1.y - 15, 0);
                        break;
                    case KeyEvent.VK_S:
                        pad1.y = Math.min(pad1.y + 15, h - ph);
                        break;
                    case KeyEvent.VK_DOWN:
                        pad2.y = Math.min(pad2.y + 15, h - ph);
                        break;
                    case KeyEvent.VK_UP:
                        pad2.y = Math.max(pad2.y - 15, 0);
                        break;
                }

            }

        });

        setFocusable(true);
        requestFocusInWindow();

        Timer timer = new Timer(16, e -> gameLoop());
        timer.start();


    }

    private void gameLoop() {
        ball.x += bv_y;
        ball.y += bv_x;

        if (ball.y <= 0 || ball.x >= w - bs) {
            ball.x = w / 2 - bs / 2;
            ball.y = h / 2 - bs / 2;
        }
        if (ball.intersects(pad1) || ball.intersects(pad2)) {
            bv_x = -bv_x;
        }

        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        g.setColor(bc);
        g.fillRect(ball.x, ball.y, bs, bs);

        g.setColor(pc1);
        g.fillRect(pad1.x, pad1.y, pw, ph);

        g.setColor(pc2);
        g.fillRect(pad2.x, pad2.y, pw, ph);

        g.setColor(fc);
        g.setFont(new Font("Courier new", Font.BOLD, 50));
        String title = "THE PONG GAME";
        FontMetrics fm = g.getFontMetrics();
        int titlex = w / 2 - fm.stringWidth(title) / 2;
        g.drawString(title, titlex, 100);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame window = new JFrame("Pong");
            ClassWork439065 game = new ClassWork439065();

            window.add(game);
            window.pack();
            window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            window.setLocationRelativeTo(null);
            window.setResizable(false);
            window.setVisible(true);

            game.requestFocusInWindow();
        });
    }


}
