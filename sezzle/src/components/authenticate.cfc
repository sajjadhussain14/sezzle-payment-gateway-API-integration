<cfcomponent name="Authentication">
 	<!---- GET CONFIGURATION SETTINGS ----->
	<cfscript>
		this.token=''
		app = createObject("component","config");
	</cfscript>
 	

		<cffunction name="getToken" access="remote">

		<cfscript>
			data={
				private_key: app.privateKay,
				public_key: app.publicKey
			}
		</cfscript>

			<cfhttp method="post" url="#app.endpoint.apiAuthUrl#" result="result">
			<cfhttpparam type="header" name="accept" value="application/json">
			<cfhttpparam type="header" name="content-type" value="application/json">
			<cfhttpparam type="body" value="#serializeJson(data)#">
			</cfhttp>

			<cfset this.tokenData= result.filecontent />
			<cfreturn this.tokenData>
		</cffunction>
</cfcomponent>