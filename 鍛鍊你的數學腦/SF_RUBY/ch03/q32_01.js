var height = 4;
var width = 7;
var str = "";
var tatami = new Array(height + 2);

/* 設定初始值(外圍設定為「-1」、內部設定為「0」)*/
for (var h = 0; h <= height + 1; h++){
  tatami[h] = new Array(width + 2);
  for (var w = 0; w <= width + 1; w++){
    tatami[h][w] = 0;
    if ((h == 0) || (w == 0) ||
    (h == height + 1) || (w == width + 1)){
      tatami[h][w] = -1;
    }
  }
}

/* 標記榻榻米 */
function printTatami(){
  for (var i = 1; i <= height; i++){
    for (var j = 1; j <= width; j++){
      /* 水平鋪設時以「-」標記 */
      if ((tatami[i][j] == tatami[i][j + 1]) ||
           (tatami[i][j] == tatami[i][j - 1]))
      str += "-";
      /* 垂直鋪設時以「|」標記 */
      if ((tatami[i][j] == tatami[i + 1][j]) ||
           (tatami[i][j] == tatami[i - 1][j]))
      str += "|";
    }
    str += "\n";
  }
  str += "\n";
}

/* 以遞迴的方式設定榻榻米的位置 */
function setTatami(h, w, id){
  if (h == height + 1){ /* 在最後一行時標記榻榻米 */
    printTatami();
  } else if (w == width + 1){ /* 碰到右端時往下一行移動 */
    setTatami(h + 1, 1, id);
  } else if (tatami[h][w] > 0){ /* 已設定完成時，往右移動 */
    setTatami(h, w + 1, id);
  } else { /* 左上角與上方相同以及左上角與左側相同時可設定 */
    if ((tatami[h - 1][w - 1] == tatami[h - 1][w]) ||
        (tatami[h - 1][w - 1] == tatami[h][w - 1])){
      if (tatami[h][w + 1] == 0){ /* 可水平鋪設的情況 */
        tatami[h][w] = tatami[h][w + 1] = id;
        setTatami(h, w + 2, id + 1);
        tatami[h][w] = tatami[h][w + 1] = 0;
      }
      if (tatami[h + 1][w] == 0){ /* 可垂直鋪設的情況 */
        tatami[h][w] = tatami[h + 1][w] = id;
        setTatami(h, w + 1, id + 1);
        tatami[h][w] = tatami[h + 1][w] = 0;
      }
    }
  }
}

setTatami(1, 1, 1);
console.log(str);
