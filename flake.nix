{
    description = "NixOS Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
    };

    outputs = { self, nixpkgs, ... }: 
        let 
          lib = nixpkgs.lib; 
        in {
           nixosConfigurations = {
              technik = lib.nixosSystem {
                 system = "x86_64-linux";
                 modules = [ ./configuration.nix ];
              };
           };
        };
}
