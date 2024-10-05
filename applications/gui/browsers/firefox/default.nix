{lib, pkgs}:

{
  programs.firefox = {
    enable = true;
    profiles = {
        technik = {
            search = {
                force = true;
                default = "DuckDuckGo";
                order = ["DuckDuckGo" "Google"];
                engines = {
                    "Nix Packages" = {
                        urls = [{
                            template = "https://search.nixos.org/packages";
                            params = [
                                {
                                    name = "type";
                                    value = "packages";
                                }
                                {
                                    name = "query";
                                    value = "{searchTerms}";
                                }
                            ];
                        }];
                         icon = 
                            "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@np" ];
                    };
                    "NixOS Wiki" = {
                        urls = [{
                            template = 
                                "https://nixos.wiki/index.php?search={searchTerms}";
                        }];
                        definedAliases = [ "@nw" ];
                    };
                    "DuckDuckGo" = {
                        urls = [{
                            template = "https://duckduckgo.com/?q={searchTerms}";
                        }];
                    };
                };
            };         
        };
      };
   };
}
