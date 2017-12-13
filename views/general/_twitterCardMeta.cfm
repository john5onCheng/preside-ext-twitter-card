<cfscript>
	local.site         = event.getSite();
	local.teaser       = Trim( event.getPageProperty( "teaser"             ) );
	local.description  = Trim( event.getPageProperty( "description"        ) );
	local.browsertitle = Trim( event.getPageProperty( "browser_title"      ) );
	local.title        = Trim( event.getPageProperty( "title"              ) );
	local.mainImage    = Trim( event.getPageProperty( "main_image"         ) );
	local.ogType       = local.site.og_type ?: "website";

	local.title  = Len( local.browserTitle ) ? local.browserTitle : local.title;
	local.teaser = Len( local.teaser       ) ? local.teaser       : local.description;
	twitterSite  = event.getSystemSetting( 'twitter-card', 'twitter_account', '' );
</cfscript>

<cfoutput>
	<meta name="twitter:card" content="summary" />
	<cfif !isEmpty( twitterSite )>
		<meta name="twitter:site" content="#twitterSite#" />
	</cfif>
	<meta name="twitter:title" content="#XmlFormat( local.title )#" />
	<cfif Len( local.teaser )>
		<meta name="twitter:description" content="#HtmlEditFormat( local.teaser )#" />
	</cfif>
	<cfif Len( local.mainImage )>
		<meta name="twitter:image" content="#event.buildLink( assetId=local.mainImage )#" />
	</cfif>
</cfoutput>