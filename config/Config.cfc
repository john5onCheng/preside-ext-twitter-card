component {

	public void function configure( required struct config ) {
		var settings  = arguments.config.settings  ?: {};
		settings.assetManager.derivatives.socialMediaImage = {
			  permissions = "inherit"
			, transformations = [ { method="resize", args={ width=600, height=314, maintainaspectratio=true } } ]
		};

	}

}