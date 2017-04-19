const W = 6; /* 水平格眼數量 */
const H = 5; /* 垂直格眼數量 */
const USABLE = 2; /* 可使用的次數 */
var max = 0; /* 最長的長度 */
var h = new Array(H + 1); /* 儲存水平線的使用次數 */
var v = new Array(W + 1); /* 儲存垂直線的使用次數 */

for (var i = 0; i < H + 1; i++){ h[i] = 0; }
for (var i = 0; i < W + 1; i++){ v[i] = 0; }

function sum(a) {
  return a.reduce(function(x, y) { return x + y; });
}

function search(x, y){
  if ((x == W) && (y == H)){
    /* 到達B的時候，確認為最大值並且結束程式 */
    max = Math.max(sum(h) + sum(v), max);
    return;
  }
  if (h[y] < USABLE){ /* 可往水平方向移動時 */
    if (x > 0) { /* 往左移動 */
      h[y] += 1;
      search(x - 1, y);
      h[y] -= 1;
    }
    if (x < W) { /* 往右移動 */
      h[y] += 1;
      search(x + 1, y);
      h[y] -= 1;
    }
  }
  if (v[x] < USABLE){ /* 可往垂直方向移動時 */
    if (y > 0){ /* 往上移動 */
      v[x] += 1;
      search(x, y - 1);
      v[x] -= 1;
    }
    if (y < H){ /* 往下移動 */
      v[x] += 1;
      search(x, y + 1);
      v[x] -= 1;
    }
  }
}

search(0, 0); /* 從A的位置開始移動 */
console.log(max);
