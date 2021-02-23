Describe 'nix'

# --------------------------------------------------------------------------------

  It 'A sanity check: we have a recent enough version of `nix`'
    When call nix --version
    The output should include 'nix (Nix) 2.4'
  End

# --------------------------------------------------------------------------------

  # # TODO how to inspect something inside the shell?
  # It 'shell (local default)'
  #   When call nix shell
  #   The output should equal 'This is program AAA.'
  # End

# --------------------------------------------------------------------------------
  It 'shell local-flake#package-name --command'
    # `nix shell --command <executable>` can be used within the repository (or
    # anywhere on the local filesystem) to run executables installed by the
    # `defaultPackage`.
    When call nix shell .#aaa-and-bbb --command aaa
    The output should equal 'This is program AAA.'
  End

  It 'shell remote-flake#pakcage-name --command'
    # It also works for flakes which are not present on the local machine.
    When call nix shell github:jacg/flakes-learning-curve/generalize-system#aaa-and-bbb --command bbb
    The output should include 'this is program BBB!'
  End

  # TODO point out that `-c 'this | that'` doesn't work, and the `-c bash -c
  # 'this | that'` workaround.

# --------------------------------------------------------------------------------

  It 'nix build'
    When call nix build
    The status should be failure
    The error should include 'does not provide attribute'
    The error should include 'defaultPackage'
  End

  # --------------------------------------------------------------------------------

  It 'nix shell'
  When call nix shell
  The status should be failure
  The error should include 'does not provide attribute'
  The error should include 'defaultPackage'
  End

# --------------------------------------------------------------------------------

  It 'nix develop'
    When call nix develop
    The status should be failure
    The error should include 'does not provide attribute'
    The error should include 'defaultPackage'
  End

# --------------------------------------------------------------------------------
  It 'run'
    # By default `nix run` tries to execute a binary with a name that is
    # identical to the name of the `default Package`. Our current flake does not
    # include such a binary, so `nix run` will fail:
    When call nix run
    The status should be failure
    The error should include 'cannot find flake attribute'
    The error should include "#defaultApp."
  End
  # Next we'll see two approaches to getting this to work:
  # 1. Set a binary with the appropritate name.
  # 2. Define a `defaultApp` in the flake's outputs.

# --------------------------------------------------------------------------------

End
