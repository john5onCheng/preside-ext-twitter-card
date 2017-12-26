component extends="preside.system.config.Config" {

	public void function configure() {
		super.configure();
		_getConfiguredAssetDerivatives();
	}

	private struct function _getConfiguredAssetDerivatives() {
		var derivatives  = super._getConfiguredAssetDerivatives();

		derivatives.socialMediaImage = {
			  permissions = "inherit"
			, transformations = [ { method="resize", args={ width=396, height=396, maintainaspectratio=true } } ]
		};

		return derivatives;
	}

}
