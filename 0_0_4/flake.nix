{
  description = ''This package tries to provide a lot of the most useful data structures and alogrithms need in the different subfield of bio informatics'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-bionim-0_0_4.flake = false;
  inputs.src-bionim-0_0_4.owner = "Unaimend";
  inputs.src-bionim-0_0_4.ref   = "refs/tags/0.0.4";
  inputs.src-bionim-0_0_4.repo  = "bionim";
  inputs.src-bionim-0_0_4.type  = "github";
  
  inputs."phylogeni".dir   = "nimpkgs/p/phylogeni";
  inputs."phylogeni".owner = "riinr";
  inputs."phylogeni".ref   = "flake-pinning";
  inputs."phylogeni".repo  = "flake-nimble";
  inputs."phylogeni".type  = "github";
  inputs."phylogeni".inputs.nixpkgs.follows = "nixpkgs";
  inputs."phylogeni".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."bio_seq".dir   = "nimpkgs/b/bio_seq";
  inputs."bio_seq".owner = "riinr";
  inputs."bio_seq".ref   = "flake-pinning";
  inputs."bio_seq".repo  = "flake-nimble";
  inputs."bio_seq".type  = "github";
  inputs."bio_seq".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bio_seq".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-bionim-0_0_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-bionim-0_0_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}