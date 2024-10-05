{
    description = "NixOS Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
    	home-manager.url = "github:nix-community/home-manager/release-24.05";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	firefox-addons = {
      	    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
   	 };
    };

    outputs = { self, nixpkgs, home-manager,  ... }@inputs: 
        let 
          lib = nixpkgs.lib; 
     	  system = "x86_64-linux";
	      pkgs = nixpkgs.legacyPackages.${system};
        in {
           nixosConfigurations = {
              nixos = lib.nixosSystem {
                 inherit system;
                 modules = [ ./configuration.nix ];
              };
           };
	   homeConfigurations = {
                technik = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit inputs; };
		        modules = [ ./home.nix ];
            };
	    };
    };
}
