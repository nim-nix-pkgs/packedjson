{
  description = ''packedjson is an alternative Nim implementation for JSON. The JSON is essentially kept as a single string in order to save memory over a more traditional tree representation.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-packedjson-0_2_1.flake = false;
  inputs.src-packedjson-0_2_1.owner = "Araq";
  inputs.src-packedjson-0_2_1.ref   = "refs/tags/0.2.1";
  inputs.src-packedjson-0_2_1.repo  = "packedjson";
  inputs.src-packedjson-0_2_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-packedjson-0_2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-packedjson-0_2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}