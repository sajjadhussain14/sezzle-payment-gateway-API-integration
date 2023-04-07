<cfoutput>	
    <cfinclude template = "./includes/header.cfm">

    <h1 class="text-center">Your Orcer has been placed successfully</h1>
    <br />
    <p> 
    </p>
    <cfdump var = "#session.orderData#" >

    <cfinclude template = "./includes/footer.cfm">
</cfoutput>
