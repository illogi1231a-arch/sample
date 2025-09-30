// リンゴの位置
float appleX;
float appleY;
float startY = 100; // 初期高さ

// 落下用の変数
float speed = 0;
boolean isFalling = false;
boolean isVisible = true; // リンゴを表示するかどうか

void setup() {
  size(400, 400);
  resetApple(); // 最初のリンゴを配置
}

void draw() {
  background(200, 230, 255);

  // 木
  fill(120, 70, 20);
  rect(180, 200, 40, 200); // 幹
  fill(50, 160, 70);
  ellipse(200, 150, 200, 200); // 葉っぱ

  // 地面
  fill(100, 200, 100);
  rect(0, 370, width, 30);

  // リンゴを描く
  if (isVisible) {
    fill(255, 0, 0);
    ellipse(appleX, appleY, 40, 40);
  }

  // 落下中なら動かす
  if (isFalling) {
    if (appleY < 350) {
      speed += 0.2;    // 重力加速
      appleY += speed;
    } else {
      appleY = 350;    // 地面に到達
      speed = 0;
      isFalling = false;
      isVisible = false;
    }
  }
}

// マウスクリックで落下 or リセット
void mousePressed() {
  if (!isFalling) {
    if (!isVisible) {
      resetApple();    // リンゴをリセット
      isVisible = true;
    } else {
      // 見えていたら落下開始
      isFalling = true;
      speed = 0;
    }
  }
}

// リンゴを木の範囲でランダム配置
void resetApple() {
  appleX = random(140, 260); // 木の葉っぱあたりの横幅
  appleY = startY + random(-30, 30); // 高さも少しバラつかせる
}
