<cffunction name="findNextEmbeddedImage" returntype="struct" access="public">
	<cfargument name="richContent" type="string" required="true" />
	<cfscript>
		// The following regex is designed to match the following pattern that would be embedded in rich editor content:
			// {{image:{asset:"assetId",option:"value",option2:"value"}:image}}

			var regex  = "{{image:(.*?):image}}";
			var match  = ReFindNoCase( regex, arguments.richContent, 1, true );
			var img    = {};
			var config = "";

			if ( ArrayLen( match.len ) eq 2 and match.len[1] and match.len[2] ) {
				img.placeHolder = Mid( arguments.richContent, match.pos[1], match.len[1] );

				config = Mid( arguments.richContent, match.pos[2], match.len[2] );
				config = UrlDecode( config );

				try {
					config = DeserializeJson( config );
					StructAppend( img, config );
				} catch ( any e ) {}
			}

			return img;
	</cfscript>
</cffunction>