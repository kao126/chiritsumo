// jpostalの記述
$(document).on('turbolinks:load', function () {
  $('#customer_postal_code').jpostal({
    // 取得する郵便番号のテキストボックスをidで指定
    postcode : ['#customer_postal_code'],
    address : {
      // 都道府県: %3 / 市区町村: %4 / 町域: %5 / 番地: %6 / 名称: %7
      "#customer_prefecture_code" : "%3",
      "#customer_address_city" : "%4",
      "#customer_address_street" : "%5%6%7"
    }
  });
});