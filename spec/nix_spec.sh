# The current flake is rather unsatisfactory: it only works on one system
# (x86_64-linux) and the various nix commands (`nix shell`, `nix build`, etc.)
# require verbose and inconvenient specification of the output we wish to
# access. We will significantly improve on this in the next step, so let's not
# dwell on it for too long. Here are two basic sanity checks:

Describe 'nix'

# --------------------------------------------------------------------------------

  It 'A sanity check: we have a recent enough version of `nix`'
    When call nix --version
    The output should include 'nix (Nix) 2.4'
  End

# --------------------------------------------------------------------------------

  It 'nix shell --command'
    When call nix shell .#packages.x86_64-linux.aaa-and-bbb --command aaa
    The output should equal 'This is program AAA.'
  End

# --------------------------------------------------------------------------------

End
