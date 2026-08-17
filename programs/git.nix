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
    includes = [
      {
        condition = "gitdir:~/langdale/";
        contents = {
          user = {
            email = "adrianb@langdale.com.au";
          };
        };
      }
    ];
  };
}
