<cfcomponent name="config">
	<cfscript>
		//APP Settings

		this.publicKey = application.publicKey;
		this.privateKay = application.privateKay;

		// SET ENVIRONMENT 
        environment='development'
		this.endpoint = {};
		// set endpint URLS
		this.endpoint.apiAuthUrl = "https://sandbox.gateway.sezzle.com/v2/authentication"
        this.endpoint.apiUrl = "https://sandbox.gateway.sezzle.com"
		this.endpoint.confirmUrl = #application.baseUrl#&"/confirm.cfm";
        this.endpoint.returnUrl = #application.baseUrl#&"/retun.cfm";
		this.endpoint.notificationUrl = #application.baseUrl#&"/notify.cfm"; 
		this.endpoint.pushUrl = #application.baseUrl#; 
        this.endpoint.cancelUrl = #application.baseUrl#&"/cancel.cfm"; 
	</cfscript>
</cfcomponent>