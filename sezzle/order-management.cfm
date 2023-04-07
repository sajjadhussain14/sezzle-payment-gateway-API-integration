    <cfoutput>	
<cfinclude template = "./includes/header.cfm">

    <div class="container-fluid ">
		<div class="loader d-none" id="loader"></div>
        <h2 class="text-center ">Order Management</h2>
        <hr />
        <div class="row">
            <div class="col-2 offset-4">Order UUID</div>
            <div class="col-6 ">
            <input  type="text"  oninput="getOrderRequest(this.value)" id="currentorderUUID"/></div>
        </div>
        <hr />
        <br />
        <div class="order" id="order-details">
        </div>
        <p class=" text-center text-danger d-none" id="error-msg">  </p>
       
        <hr />
            <div class="row">
                <div class="col-8 border-end">
                    <h5 class=" p-2">Update Order </h5>
                    <p>
                       Use this endpoint to update an existing order. Only the reference ID can be updated.
                    </p>

                    
                    <div class="row m-2">
                        <div class="col-4 mt-2">New reference ID: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='newRefID'>
                        </div>
                    </div>
                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="updateOrderRequest()">Submit</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="update-res">  </p>

            </div>
            <div class="col-4">
                <h5 class=" p-2">Refund Order </h5>



                    <div class="row m-2">
                        <div class="col-4 mt-2">Amount in Cents: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='refund_amount'>
                        </div>
                    </div>

                    <div class="row m-2">
                        <div class="col-4 mt-2">Currency: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='refund_currency' value="USD">
                        </div>
                    </div>

                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="refundAmountRequest()">Submit</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="refund-amount-res">  </p>



            </div>
        </div>
        <hr />






            <div class="row">
                <div class="col-8 border-end">
                    <h5 class=" p-2">Release Amount By Order </h5>


                    <div class="row m-2">
                        <div class="col-4 mt-2">Amount in Cents: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='release_amount'>
                        </div>
                    </div>

                    <div class="row m-2">
                        <div class="col-4 mt-2">Currency: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='release_currency' value="USD">
                        </div>
                    </div>

                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="releaseAmountRequest()">Submit</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="release-amount-res">  </p>

            </div>
            <div class="col-4">
                <h5 class=" p-2">Capture Amount By Order</h5>

                
                    <div class="row m-2">
                        <div class="col-4 mt-2">Amount in Cents: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='capture_amount'>
                        </div>
                    </div>

                    <div class="row m-2">
                        <div class="col-4 mt-2">Currency: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='capture_currency' value="USD">
                        </div>
                    </div>


                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="captureAmountRequest()">Submit</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="capture-amount-res">  </p>

            </div>


<hr />


            <div class="row">
                <div class="col-8 border-end">
                    <h5 class=" p-2">Upcharge amount by order </h5>

                    <div class="row m-2">
                        <label for="exampleFormControlSelect1">Intent</label>
                        <select class="form-control" id="upcharge-intent">
                        <option value="CAPTURE" selected>CAPTURE</option>
                        <option value="AUTH">AUTH</option>
                        </select>
                    </div>

                    <div class="row m-2">
                        <div class="col-4 mt-2">Amount in Cents: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='upcharge_amount'>
                        </div>
                    </div>

                    <div class="row m-2">
                        <div class="col-4 mt-2">Currency: </div>
                        <div class="col-8 mt-2">
                            <input type="text" id='upcharge_currency' value="USD">
                        </div>
                    </div>

                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="upchageAmountRequest()">Submit</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="upcharge-amount-res">  </p>

            </div>
            <div class="col-4">
                <h5 class=" p-2">Delete checkout by order
</h5>

                


                    <div class="row m-2 ">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-secondary" onclick="deleteOrderRequest()">Delete Order</button>
                        </div>
                    </div>

                    <p class=" text-center text-info d-none" id="delete-res">  </p>

            </div>



        </div>
        <hr />
        <br />












    </div>
<cfinclude template = "./includes/footer.cfm">
</cfoutput>
