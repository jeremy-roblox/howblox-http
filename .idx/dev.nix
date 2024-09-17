# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python312
    pkgs.gcc
    pkgs.openssh
    pkgs.poetry
    pkgs.docker
    pkgs.docker-compose
  ];
  services.docker.enable = true; # used for setup.py to launch mongodb and redis
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "ms-python.python"
      # "ms-python.pylint"
      "ms-python.pylance"
      "humao.rest-client"
      "WakaTime.vscode-wakatime"
      "ms-python.debugpy"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        install = "python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt";
        run-setup = "./setup.sh";
      };
      onStart = {
        start-proxy = "ssh -R local.howblox:80:localhost:8010 localhost.run";
        update = "poetry update; poetry export --without-hashes --format=requirements.txt > requirements.txt; python3.12 -m venv .venv && source .venv/bin/activate && pip install -U -r requirements.txt";
        start-bot = "./start.sh";
      };
    };
    previews = {
      enable = false;
      previews = [
        {
          command = [
            "./start.sh"
          ];
          manager = "web";
          id = "web";
          env = {
            "PORT" = "8010";
          };
        }
      ];
    };
  };
}