const pay = () => {

 // 以下V1のカリキュラムの不要？箇所（学習用で記録を残します）
    
    // Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
    // const submit = document.getElementById("button");
    // submit.addEventListener("click", (e) => {
    //   e.preventDefault();
  

// 以下V2のカリキュラムのハイライト箇所

  //環境変数をもとに公開鍵を復号
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); 
  console.log(process.env.PAYJP_PUBLIC_KEY);
  console.log("OK");
  //elementsインスタンスを生成
  const elements = payjp.elements();
  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber');
  const cvcElement = elements.create('cardCvc');
  const expiryElement = elements.create('cardExpiry');
  //入力欄をDOM上に表示
  numberElement.mount('#number');
  expiryElement.mount('#exp-date');
  cvcElement.mount('#cvc') ;

  //フォームの要素を取得
  const form = document.getElementById("charge-form");
  //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expiryElement).then((response) => {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form"); 
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  });
};


 // 以下V1のカリキュラムの不要？箇所（学習用で記録を残します）

//       const formResult = document.getElementById("charge-form");
//       const formData = new FormData(formResult);
  
//       const card = {
//         number: formData.get("order[number]"),
//         cvc: formData.get("order[cvc]"),
//         exp_month: formData.get("order[exp_month]"),
//         exp_year: `20${formData.get("order[exp_year]")}`,
//       };
  
//       Payjp.createToken(card, (status, response) => {
//         if (status == 200) {
//           const token = response.id;
//           const renderDom = document.getElementById("charge-form");
//           const tokenObj = `<input value=${token} name='token' type="hidden"> `;
//           renderDom.insertAdjacentHTML("beforeend", tokenObj);
//         }
  
//         document.getElementById("order_number").removeAttribute("name");
//         document.getElementById("order_cvc").removeAttribute("name");
//         document.getElementById("order_exp_month").removeAttribute("name");
//         document.getElementById("order_exp_year").removeAttribute("name");
  
//         document.getElementById("charge-form").submit();
//       });
//     });
//   };
  
  window.addEventListener("load", pay);