
/*
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.Random;


public class DrawingRobot extends JPanel implements ActionListener {

    private int eyeColorIndex = 0;
    private final Color[] eyeColors =  {Color.RED, Color.GREEN, Color.CYAN, Color.MAGENTA, Color.YELLOW, Color.ORANGE};

    private boolean isHappy = true;
    private final Timer timer;
    private final Random rand = new Random();

    public DrawingRobot() {
        timer = new Timer(2000, this);
        timer.start();
    }

    @Override
    protected void paintComponnent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        g2d.setColor(new Color(10, 20, 40));
        g2d.fillRect(0, 0, getWidth(), getHeight());

        g2d.setColor(Color.WHITE);
        for (int i = 0; i < 80; i++) {
            int x = rand.nextInt(getWidth());
            int y = rand.nextInt(getHeight());
            g2d.fillOval(x, y, 2, 2);
        }

        g2d.setColor(new Color(183, 180, 200));
        g2d.fillRoundRect(150, 80, 300, 220, 60, 60);
        g2d.setColor(Color.BLACK);
        g2d.setStroke(new BasicStroke(6));
        g2d.drawRoundRect(150, 80, 300, 220, 60, 60);

        g2d.setColor(Color.ORANGE);
        g2d.setStroke(new BasicStroke(8));
        g2d.drawLine(300, 80, 300, 38);
        g2d.setColor(Color.RED);
        g2d.fillOval(200, 10, 40, 40);

        g2d.setColor(isHappy ? eyeColors[eyeColorIndex]  : Color.DARK_GRAY);
        g2d.fillOval(200,140,80, 80);
        g2d.fillOval(320, 140, 80, 80);

        g2d.setColor(Color.BLACK);
        g2d.fillOval(225, 165, 30, 30);
        g2d.fillOval(345, 165, 30, 30);

        g2d.setStroke(new BasicStroke(10));
        if (isHappy) {
            g2d.drawArc(220,180, 160, 80, 8, -180);
        } else {
            g2d.drawArc(220, 220, 160, 80, 8, 180);
        }


        g2d.setColor(new Color(100, 150, 255));
        g2d.fillRoundRect(180, 320, 240, 50, 50);
        g2d.setStroke(new BasicStroke(6));
        g2d.drawRoundRect(180, 320, 240, 180, 50, 50);

        g2d.setColor(Color.BLACK);
        g2d.fillRect(230, 370, 160, 80);
        g2d.setColor(Color.GREEN);
        g2d.fillRect(245, 385, 30, 30);
        g2d.fillRect(295, 385, 30, 30);
        g2d.fillRect(345, 385, 30, 30);

        g2d.setColor(new Color(180, 180, 200));
        g2d.setStroke(new BasicStroke(40));
        g2d.drawLine(150, 400, 80, 520);
        g2d.drawLine(450, 400,520, 520);

        g2d.fillOval(50, 510, 60, 60);
        g2d.fillOval(490, 510, 60, 60);

        g2d.setStroke(new BasicStroke(50));
        g2d.drawLine(230, 500, 230, 600);
        g2d.drawLine(370, 500, 370, 600);

        g2d.setColor(new Color(80, 80, 100));
        g2d.fillRoundRect(180, 600, 100, 50, 30, 30);
        g2d.fillRoundRect(320, 600, 100, 50, 30, 30);

        g2d.setColor(Color.CYAN);
        g2d.setFont(new Font);

    }



    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("ROBOTIX-3000 -- ЖИВОЙ РОБОТ");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(800, 800);
            frame.setLocationRelativeTo(null);
            frame.setResizable(false);

            DrawingRobot robot = new DrawingRobot();
            robot.setBackground(new Color(10, 10, 40));
            frame.add(robot);
            frame.setVisible(true);

            System.out.println("Robot start!");

            int[] colors = {(int) ()}
        });
    }
}


 */