{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-opensource-terraform.url = "github:nixos/nixpkgs/39ed4b64ba5929e8e9221d06b719a758915e619b";
  };

  outputs = inputs@{self, nixpkgs, nixpkgs-unstable, nixpkgs-opensource-terraform, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.pkgs;
    unstable = nixpkgs-unstable.legacyPackages.${system}.pkgs;
    pkgs-opensource-terraform = nixpkgs-opensource-terraform.legacyPackages.${system}.pkgs;
  in {
    devShells.${system}.default = unstable.mkShell {
      name = "daluca/cloud tools";
      buildInputs = with pkgs; [
        kubectl
        krew
        kustomize
        kubernetes-helm
        fluxcd
        sops
        pkgs-opensource-terraform.terraform
        opentofu
        unstable.tflint
        unstable.terraform-docs
        just
        markdownlint-cli2
        doctl
        jq
        wget
        kubeconform
        mdbook
        velero
        codespell
        pre-commit
        nodejs_22
        nodePackages.npm
        tflint
        trivy
        unstable.yamlfmt
        unstable.yamllint
        yq-go
      ];
      shellHook = ''
        echo "Loaded $name...";
      '';
    };
  };
}
