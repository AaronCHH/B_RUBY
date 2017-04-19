const N = 8; /* 兩種顏色的數 */
var start = (1 << N) - 1; /* 初始状態(0有N個、1有N個) */
var mask = (1 << N * 2) - 1; /* 位元遮罩 */

/* 目標狀態(0與1交錯排列) */
var goal1 = 0;
for (var i = 0; i < N; i++){ goal1 = (goal1 << 2) + 1; }
var goal2 = mask - goal1;

/* 計算為1的位數有幾個 */
function bitcount(x) {
  x = (x & 0x55555555) + (x >> 1 & 0x55555555);
  x = (x & 0x33333333) + (x >> 2 & 0x33333333);
  x = (x & 0x0F0F0F0F) + (x >> 4 & 0x0F0F0F0F);
  x = (x & 0x00FF00FF) + (x >> 8 & 0x00FF00FF);
  x = (x & 0x0000FFFF) + (x >> 16 & 0x0000FFFF);
  return x;
}

/* 交換次數 */
var count = N * 2;
for (var i = 0; i < (1 << N * 2); i++){
  var turn = i ^ (i << 1) ^ (i << 2);
  turn = (turn ^ (turn >> (N * 2))) & mask;

  /* 若與目標狀態一做，就判定為最小的交換次數 */
  if (((start ^ turn) == goal1) || ((start ^ turn) == goal2)){
    if (count > bitcount(i)){
      count = bitcount(i);
    }
  }
}
console.log(count);
