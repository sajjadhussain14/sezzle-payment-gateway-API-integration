<cfcomponent name="orders">
	<cfscript>
		app = createObject("component","config");
		auth = createObject("component","authenticate");
		authToken=deserializeJSON(auth.getToken())
		this.authCode=authToken.token
	</cfscript>


	<!------------------------START GET ORDER BY ORDER ID-------------------------->
	<cffunction name="getOrder" access="remote" returnFormat="plain">
		<cfargument name="orderUUID" type="any" required="false" />
		
		<cfhttp method="get" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END GET ORDER BY ORDER ID-------------------------->


	<!------------------------START Release amount BY Order-------------------------->
	<cffunction name="createReleaseAmountByOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="orderUUID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#/release" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Release ORDER BY ORDER ID-------------------------->


	<!------------------------START Capture amount BY Order-------------------------->
	<cffunction name="createCaptureAmountByOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="orderUUID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#/capture" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END CAPTURE ORDER BY ORDER ID-------------------------->


	<!------------------------START Refund amount BY Order-------------------------->
	<cffunction name="createRefundAmountByOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="orderUUID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#/refund" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Refund ORDER BY ORDER ID-------------------------->



	<!------------------------START Upcharge amount BY Order-------------------------->
	<cffunction name="createUpchargeAmountByOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="orderUUID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		<cfhttp method="POST" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#/upcharge" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Upcharge ORDER BY ORDER ID-------------------------->





	<!------------------------START UPDATE ORDER AMOUNT BY ORDER ID-------------------------->
	<cffunction name="updateOrder" access="remote" returnFormat="plain">
		<cfargument name="payLoad" type="any" required="false" />
		<cfargument name="orderUUID" type="any" required="false" />

		<cfset data=serializeJSON(arguments.payLoad)>
		<cfhttp method="PATCH" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#deserializeJSON(data)#">
		</cfhttp>

		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END UPDATE ORDER AMOUNT BY ORDER ID-------------------------->



	<!------------------------START Delete ORDER  BY ORDER ID-------------------------->
	<cffunction name="deleteOrder" access="remote" returnFormat="plain">
		<cfargument name="orderUUID" type="any" required="false" />

		<cfhttp method="DELETE" url="#app.endpoint.apiUrl#/v2/order/#arguments.orderUUID#/checkout" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #this.authCode#">
			<cfhttpparam type="header" name="content-type" value="application/json">
		</cfhttp>
		<cfreturn #result.filecontent#>
	</cffunction>
	<!------------------------END Delete ORDER  BY ORDER ID-------------------------->



</cfcomponent>