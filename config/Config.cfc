component {

	public void function configure( required struct config ) {
		var settings  = arguments.config.settings  ?: {};
		settings.assetManager.derivatives.socialMediaImage = {
			  permissions = "inherit"
			, transformations = [ { method="resize", args={ width=1200, height=630, maintainaspectratio=true } } ]
		};

	}

}