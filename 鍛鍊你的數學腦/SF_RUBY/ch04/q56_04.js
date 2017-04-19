/* 垂直線與水平線 */
const V = 7, H = 10;

/* 以遞迴方式繪製水平 */
function make_bars(v, h){
  var new_h = new Array(h.length + v - 1);
  for (var i = 0; i < h.length + v - 1; i++){
    new_h[i] = 0;
  }
  /* 計算各水平線的排列模式種類 */
  for (var i = 0; i < v; i++){
    for (var j = 0; j < h.length; j++){
      new_h[i + j] += h[j]
    }
  }
  if (v == V + 1){
    console.log(h[H]);
  } else {
    make_bars(v + 1, new_h);
  }
}

make_bars(1, [1]);
