<cfoutput>
<cfinclude template = "./includes/header.cfm">


<cfscript>
	auth = createObject("component","src.components.authenticate");
	authToken=deserializeJSON(auth.getToken())
	paymentObject = createObject("component","src.components.payment");
	app = createObject("component","src.components.config");
	orderData={}
	cancel=application.secureurl & "cancel.cfm";
	confirm=application.secureurl & "confirm.cfm";

	orderData={
     "cancel_url": {
          "href": cancel,
          "method": "get"
     },
     "complete_url": {
          "href": confirm,
          "method": "get"
     },
     "customer": {
          "billing_address": {
               "city": "New York",
               "country_code": "US",
               "name": "John Edward",
               "phone": "3106683312",
               "postal_code": "10024",
               "state": "NY",
               "street": "Amsterdam Ave"
          },
          "shipping_address": {
               "city": "New York",
               "country_code": "US",
               "name": "John Edward",
               "phone": "3106683312",
               "postal_code": "10024",
               "state": "NY",
               "street": "Amsterdam Ave"
          },
          "tokenize": false,
          "email": "sajjadast786@gmail.com",
          "first_name": "john",
          "last_name": "Edward",
          "phone": "3106683312"
     },
     "order": {
		"order_Number":randRange(1, 999999999),
          "items": [
               {
                    "price": {
                         "amount_in_cents": 4000,
                         "currency": "USD"
                    },
                    "name": "Item 1",
                    "quantity": 1,
                    "sku": "457457547"
               },
               {
                    "price": {
                         "amount_in_cents": 300,
                         "currency": "USD"
                    },
                    "name": "Item 2",
                    "quantity": 2,
                    "sku": "89678687"
               }
          ],
          "discounts": [
               {
                    "amount": {
                         "amount_in_cents": 200,
                         "currency": "USD"
                    },
                    "name": "General Discount"
               }
          ],
          "shipping_amount": {
               "amount_in_cents": 100,
               "currency": "USD"
          },
          "tax_amount": {
               "amount_in_cents": 100,
               "currency": "USD"
          },
          "order_amount": {
               "amount_in_cents": 5000,
               "currency": "USD"
          },
          "checkout_financing_options": [
               "4-pay-monthly"
          ],
          "send_checkout_url": {
               "to_sms_phone": "3106683312",
               "to_email": "sajjadast786@gmail.com",
               "language": "en-US"
          },
          "intent": "CAPTURE",
          "reference_id": "6443636",
          "description": "test description",
          "locale": "en-US",
          "requires_shipping_info": false
     }
}


	session.orderData=orderData

 </cfscript>
<h2>Cart </h2>

<cfdump var = "#session.orderData#" >


<cfif IsDefined("orderData.order_lines") && ArrayLen(orderData.order_lines) gt 0>
	<cfset	paymentSessionRecord=auth.createPaymentSession(serializeJSON(orderData)) />
	<cfset	paymentSessionRecord=deserializeJSON(paymentSessionRecord) />
	<script>
	//********* INITIAL KLARNA ******//
	</script>
</cfif>


<div class="form-group">
    <label for="exampleFormControlSelect1">Intent</label>
    <select class="form-control" id="intent">
      <option value="CAPTURE" selected>CAPTURE</option>
      <option value="AUTH">AUTH</option>
    </select>
  </div>

            <div class="col-lg-4 col-md-4 col-sm-12 boder p-2">
                <h2>Checkout</h2>
                <div class="row">
                    <button id="checkoutBtn" class="btn btn-primary mt-2" onclick="createOrderRequest('#authToken.token#')">Checkout with Sezzle</button>
            </div>
            </div>




		</div>
	
<cfinclude template = "./includes/footer.cfm">
</cfoutput>
