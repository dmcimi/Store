 var OriginTitle = document.title;
 var titleTime;
 document.addEventListener('visibilitychange', function () {
     if (document.hidden) {
         $('[rel="icon"]').attr('href', "/images/lcd.png");
         document.title = 'ヽ(●-`Д´-)ノ！哼哼😕';
         clearTimeout(titleTime);
     }
     else {
         $('[rel="icon"]').attr('href', "/images/lcd.png");
         document.title = 'ヾ(Ő∀Ő3)ノ！哈哈😄' + OriginTitle;
         titleTime = setTimeout(function () {
             document.title = OriginTitle;
         }, 2000);
     }
 });