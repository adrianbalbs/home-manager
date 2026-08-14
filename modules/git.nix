{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Adrian Balbalosa";
        email = "adrianbalbs@pm.me";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "vim";
      };
    };
  };
}
