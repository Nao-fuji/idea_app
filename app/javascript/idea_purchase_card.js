const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("chargea-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("chargea-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("idea_purchase[number]"),
      cvc: formData.get("idea_purchase[cvc]"),
      exp_month: formData.get("idea_purchase[exp_month]"),
      exp_year: `20${formData.get("idea_purchase[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("chargea-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("carda-number").removeAttribute("name");
      document.getElementById("carda-cvc").removeAttribute("name");
      document.getElementById("carda-exp-month").removeAttribute("name");
      document.getElementById("carda-exp-year").removeAttribute("name");

      document.getElementById("chargea-form").submit();
    });
  });
};

window.addEventListener("load", pay);