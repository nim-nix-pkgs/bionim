{
  description = ''This package tries to provide a lot of the most useful data structures and alogrithms need in the different subfield of bio informatics'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."bionim-main".dir   = "main";
  inputs."bionim-main".owner = "nim-nix-pkgs";
  inputs."bionim-main".ref   = "master";
  inputs."bionim-main".repo  = "bionim";
  inputs."bionim-main".type  = "github";
  inputs."bionim-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bionim-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bionim-0_0_2".dir   = "0_0_2";
  inputs."bionim-0_0_2".owner = "nim-nix-pkgs";
  inputs."bionim-0_0_2".ref   = "master";
  inputs."bionim-0_0_2".repo  = "bionim";
  inputs."bionim-0_0_2".type  = "github";
  inputs."bionim-0_0_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bionim-0_0_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bionim-0_0_3".dir   = "0_0_3";
  inputs."bionim-0_0_3".owner = "nim-nix-pkgs";
  inputs."bionim-0_0_3".ref   = "master";
  inputs."bionim-0_0_3".repo  = "bionim";
  inputs."bionim-0_0_3".type  = "github";
  inputs."bionim-0_0_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bionim-0_0_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bionim-0_0_4".dir   = "0_0_4";
  inputs."bionim-0_0_4".owner = "nim-nix-pkgs";
  inputs."bionim-0_0_4".ref   = "master";
  inputs."bionim-0_0_4".repo  = "bionim";
  inputs."bionim-0_0_4".type  = "github";
  inputs."bionim-0_0_4".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bionim-0_0_4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bionim-v0_0_1".dir   = "v0_0_1";
  inputs."bionim-v0_0_1".owner = "nim-nix-pkgs";
  inputs."bionim-v0_0_1".ref   = "master";
  inputs."bionim-v0_0_1".repo  = "bionim";
  inputs."bionim-v0_0_1".type  = "github";
  inputs."bionim-v0_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bionim-v0_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}