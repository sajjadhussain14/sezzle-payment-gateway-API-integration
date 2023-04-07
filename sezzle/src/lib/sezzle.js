// Sezzle Integration
// Version : 1.0.2
// author: Sajjad Hussain

// CREATE NEW ORDER REQUEST
let loaderHtmlt = `<div class="row   content-holder p-0 text-center">
            <div class="spinner-border" role="status">
  <span class="visually-hidden">Loading...</span>
</div>
`;
const createOrderRequest = (authorizationToken) => {
  let intent = "";
  intent = document.getElementById("intent").value;
  document.getElementById("checkoutBtn").innerHTML = loaderHtmlt;

  if (!intent || intent.trim() == "") {
    intent = "CAPTURE";
  }

  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/payment.cfc?method=createOrder",
    method: "POST",
    data: {
      authorizationToken: authorizationToken,
      intent: intent,
    },
  };
  $.ajax(settings).done(function (response) {
    sesessionRes = JSON.parse(response);
    document.getElementById("checkoutBtn").innerHTML = `Checkout with Sezzle
`;
    window.location.href = sesessionRes.order.checkout_url;
  });
};

// GET AN ORDER BY ORDER ID REQUEST
const getOrderRequest = (orderUUID) => {
  try {
    document.getElementById("loader").classList.remove("d-none");
  } catch (err) {}

  orderUUID = orderUUID.replace(/\s+/g, "");
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/orders.cfc?method=getOrder",
    method: "POST",
    data: {
      orderUUID: orderUUID,
    },
  };

  $.ajax(settings).done(function (order) {
    window.scrollTo(0, 0);

    document.getElementById("order-details").innerHTML = order;

    try {
      setTimeout(() => {
        document.getElementById("loader").classList.add("d-none");
      }, 500);
    } catch (err) {}
  });
};

// UPDATE ORDER AMOUNT
const updateOrderRequest = () => {
  try {
    document.getElementById("update-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("update-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let orderUUID = "";

  newRefID = document.getElementById("newRefID").value;
  orderUUID = document.getElementById("currentorderUUID").value;

  if (!orderUUID || orderUUID.trim() == "" || orderUUID == null) {
    alert("Please get an Order First and then Update");
    return;
  }

  if (newRefID != "") {
    let payLoad = {};

    payLoad = { reference_id: newRefID };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=updateOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      if (response == "" || response == " " || response == "No Content") {
        res = "Updated order successfully!";
        console.log("update res is : ", res);
      } else {
        res = JSON.parse(response);
        res = res[0].message;
        if (res == "unprocessable entity") {
          res = "Same Refrence ID Already Exists!";
        }
        console.log("update res is : ", res);
      }

      displayResponse("update-res", res);
      document.getElementById("newRefID").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

const releaseAmountRequest = () => {
  try {
    document.getElementById("release-amount-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("release-amount-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let orderUUID = "";

  orderUUID = document.getElementById("currentorderUUID").value;
  release_amount = document.getElementById("release_amount").value;
  release_currency = document.getElementById("release_currency").value;
  if (!orderUUID) {
    alert("Please get an Order First and then Release");
    return;
  }

  if (release_amount != "" && release_currency != "") {
    let payLoad = {};
    let amt = parseInt(release_amount);
    payLoad = {
      amount_in_cents: amt,
      currency: release_currency.toString().toUpperCase(),
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createReleaseAmountByOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("release-amount-res", response);
      document.getElementById("release_amount").value = "";
      document.getElementById("release_currency").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

const captureAmountRequest = () => {
  try {
    document.getElementById("capture-amount-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("capture-amount-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let orderUUID = "";

  orderUUID = document.getElementById("currentorderUUID").value;
  capture_amount = document.getElementById("capture_amount").value;
  capture_currency = document.getElementById("capture_currency").value;
  if (!orderUUID) {
    alert("Please get an Order First and then capture");
    return;
  }

  if (capture_amount != "" && capture_currency != "") {
    let payLoad = {};
    let amt = parseInt(capture_amount);

    payLoad = {
      capture_amount: {
        amount_in_cents: amt,
        currency: capture_currency.toString().toUpperCase(),
      },
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createCaptureAmountByOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("capture-amount-res", response);
      document.getElementById("capture_amount").value = "";
      document.getElementById("capture_currency").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

// REFUND ORDER
const refundAmountRequest = () => {
  try {
    document.getElementById("refund-amount-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("refund-amount-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let orderUUID = "";

  orderUUID = document.getElementById("currentorderUUID").value;
  refund_amount = document.getElementById("refund_amount").value;
  refund_currency = document.getElementById("refund_currency").value;
  if (!orderUUID) {
    alert("Please get an Order First and then refund");
    return;
  }

  if (refund_amount != "" && refund_currency != "") {
    let payLoad = {};
    let amt = parseInt(refund_amount);
    payLoad = {
      amount_in_cents: amt,
      currency: refund_currency.toString().toUpperCase(),
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createRefundAmountByOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("refund-amount-res", response);
      document.getElementById("refund_amount").value = "";
      document.getElementById("refund_currency").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

const upchageAmountRequest = () => {
  try {
    document.getElementById("upcharge-amount-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("upcharge-amount-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let newRefID = "";
  let orderUUID = "";

  orderUUID = document.getElementById("currentorderUUID").value;
  upcharge_amount = document.getElementById("upcharge_amount").value;
  upcharge_currency = document.getElementById("upcharge_currency").value;
  upcharge_intent = document.getElementById("upcharge-intent").value;

  if (!orderUUID) {
    alert("Please get an Order First and then upcharge");
    return;
  }

  if (upcharge_amount != "" && upcharge_currency != "") {
    let payLoad = {};
    let amt = parseInt(upcharge_amount);
    payLoad = {
      upcharge_amount: {
        amount_in_cents: amt,
        currency: upcharge_currency.toString().toUpperCase(),
      },
      intent: upcharge_intent,
    };
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=createUpchargeAmountByOrder",
      method: "POST",
      data: {
        payLoad: JSON.stringify(payLoad),
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("upcharge-amount-res", response);
      document.getElementById("upcharge_amount").value = "";
      document.getElementById("upcharge_currency").value = "";
    });
  } else {
    alert("Please enter a valid New order Amount");
  }
};

const deleteOrderRequest = () => {
  try {
    document.getElementById("delete-res").classList.remove("d-none");
  } catch (err) {}

  try {
    document.getElementById("delete-res").innerHTML = loaderHtmlt;
  } catch (err) {}

  let orderUUID = "";

  orderUUID = document.getElementById("currentorderUUID").value;

  if (!orderUUID) {
    alert("Please get an Order First and then upcharge");
    return;
  }

  if (orderUUID != "" && orderUUID != "") {
    try {
      document.getElementById("loader").classList.remove("d-none");
    } catch (err) {}

    let settings = {
      async: true,
      crossDomain: true,
      url: "src/components/orders.cfc?method=deleteOrder",
      method: "POST",
      data: {
        orderUUID: orderUUID,
      },
    };
    $.ajax(settings).done(function (response) {
      displayResponse("delete-res", response);
    });
  } else {
    alert("Please enter a valid  order ");
  }
};

const displayResponse = (id, text) => {
  document.getElementById(id).innerHTML = text;

  setTimeout(() => {
    try {
      document.getElementById(id).classList.add("d-none");
    } catch (err) {}
  }, 500000000);
};
