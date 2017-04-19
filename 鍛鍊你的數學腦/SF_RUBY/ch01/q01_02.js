/* 在字串類型裡新增傳回顛倒字串的方法 */
String.prototype.reverse = function (){
  return this.split("").reverse().join("");
}

/* 從11開始搜尋 */
var num = 11;
while (true){
  if ((num.toString() == num.toString().reverse()) &&
      (num.toString(8) == num.toString(8).reverse()) &&
      (num.toString(2) == num.toString(2).reverse())){
    console.log(num);
    break;
  }
  /* 為了只搜尋奇數每次加2 */
  num += 2;
}
