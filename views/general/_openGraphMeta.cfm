<cfscript>
	local.site         = event.getSite();
	local.teaser       = Trim( event.getPageProperty( "teaser"             ) );
	local.description  = Trim( event.getPageProperty( "description"        ) );
	local.browsertitle = Trim( event.getPageProperty( "browser_title"      ) );
	local.title        = Trim( event.getPageProperty( "title"              ) );
	local.mainImage    = Trim( event.getPageProperty( "main_image"         ) );
	local.ogType       = local.site.og_type ?: "website";

	local.title          = Len( local.browserTitle ) ? local.browserTitle : local.title;
	local.teaser         = Len( local.teaser       ) ? local.teaser       : local.description;
	twitterSite          = getSystemSetting( 'twitter-card', 'twitter_account', '' );
	useSummaryLargeImage = getSystemSetting( 'twitter-card', 'summary_large_image', true );
	useAlternativeImage  = getSystemSetting( 'twitter-card', 'use_alternative_image_from_content', true );

	if( !Len( local.mainImage ) && useAlternativeImage ){
		local.mainImage = findNextEmbeddedImage( event.getPageProperty( "main_content" ) ).asset ?: "";
	}
</cfscript>

<cfoutput>
	<meta property="og:title" content="#XmlFormat( local.title )#" />
	<meta property="og:type"  content="#local.ogType#" />
	<meta property="og:url"   content="#event.getBaseUrl()##HtmlEditFormat( event.getCurrentUrl() )#" />
	<cfif Len( local.teaser )>
		<meta property="og:description" content="#HtmlEditFormat( local.teaser )#" />
	</cfif>
	<cfif Len( local.mainImage )>
		<meta property="og:image" content="#event.buildLink( assetId=local.mainImage, derivative='socialMediaImage' )#" />
	</cfif>

	<cfif useSummaryLargeImage == 1>
		<meta name="twitter:card" content="summary_large_image">
	<cfelse>
		<meta name="twitter:card" content="summary" />
	</cfif>
	<cfif !isEmpty( twitterSite )>
		<meta name="twitter:site" content="#twitterSite#" />
	</cfif>
	<meta name="twitter:title" content="#XmlFormat( local.title )#" />
	<cfif Len( local.teaser )>
		<meta name="twitter:description" content="#HtmlEditFormat( local.teaser )#" />
	</cfif>
	<cfif Len( local.mainImage )>
		<meta name="twitter:image" content="#event.buildLink( assetId=local.mainImage, derivative='socialMediaImage' )#" />
	</cfif>
</cfoutput>