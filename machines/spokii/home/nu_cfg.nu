
$env.config = {
  # auto-enter direnv
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return 
      }
        direnv export json | from json | default {} | load-env
      }]
  }

  show_banner: false,
  completions: {
    case_sensitive: false # case-sensitive completions
    quick: true    # set to false to prevent auto-selecting completions
    partial: true    # set to false to prevent partial filling of the prompt
    algorithm: "fuzzy"    # prefix or fuzzy
    external: {
      # set to false to prevent nushell looking into $env.PATH to find more suggestions
      enable: true 
      # set to lower can improve completion performance at the cost of omitting some options
      max_results: 100 
    }
  }
} 

alias gg = git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all

$env.PATH = ($env.PATH | 
  split row (char esep) |
  prepend /home/ben/.apps |
  append /usr/bin/env
)
