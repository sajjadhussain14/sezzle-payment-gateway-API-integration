<cfcomponent name="payment">
	<cfscript>
		app = createObject("component","config");
	</cfscript>

	<!------------------------START CREATE ORDER KLARNA-------------------------->
	<cffunction name="createOrder" access="remote" returnFormat="plain">
		<cfargument name="authorizationToken" type="any" required="false" />
		<cfargument name="intent" type="any" required="false" />


		<cfset session.orderData.order.intent=arguments.intent >
		<cfhttp method="post" url="#app.endpoint.apiUrl#/v2/session" result="result">
			<cfhttpparam type="header" name="Authorization" value="Bearer #authorizationToken#">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#serializeJSON(session.orderData)#">
		</cfhttp>
		<cfset res=result.filecontent />
		<cfset order=deserializeJSON(res)>
		<cfset session.orderData.order_uuid=order.order.uuid>
		<cfreturn res >
	</cffunction>
	<!------------------------END CREATE ORDER KLARNA-------------------------->
</cfcomponent>