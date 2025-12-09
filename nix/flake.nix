{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    grubshin-bootpact.url = "github:max-ishere/grubshin-bootpact";
  };

  # 1. GUNAKAN @inputs DI SINI
  # Ini menangkap 'hyprpanel', 'grubshin-bootpact', dan 'nixpkgs' sekaligus.
  outputs = { self, nixpkgs, ... }@inputs: {

    # 2. UPDATE BAGIAN OVERLAY
    overlays.default = final: prev: {
      # Karena kita pakai @inputs, kita memanggilnya dengan 'inputs.hyprpanel'
      hyprpanel = inputs.hyprpanel.packages.${prev.system}.default;
    };

    nixosConfigurations."mamat" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # 3. UPDATE SPECIALARGS (PENTING UNTUK GRUB THEME)
      # Ini mengirimkan variabel 'inputs' ke file configuration.nix
      # agar kamu bisa pakai 'inputs.grubshin-bootpact...' di sana.
      specialArgs = { inherit inputs; };

      modules = [
        # Terapkan overlay HyprPanel
        { nixpkgs.overlays = [ self.overlays.default ]; }

        # Impor konfigurasi utama
        ./configuration.nix
      ];
    };
  };
}
