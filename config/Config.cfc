component {

	public void function configure( required struct config ) {
		var settings         = arguments.config.settings     ?: {};
		settings.assetManager.derivatives.seed_image = {
			  permissions = "inherit"
			, transformations = [ { method="resize", args={ width=396, height=396, maintainaspectratio=true } } ]
		};

	}

}