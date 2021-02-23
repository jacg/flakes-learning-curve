This repository tries to document how to write and use Nix flakes by providing a
sequence of steps, starting with just about the simplest flake that can be
written, and gradually building it up by adding more features.

Crucially, every step should

+ consist of self-contained and correctly working code
+ be documented with usage examples which are *automatically tested* for correctness.

As flake consists of a version-controlled filesystem tree with a `flake.nix`
file in its root, each step is in a separate commit of this repository. These commits are labelled with meaningfully named branches.

Currently available steps are:

1. `first-flake`
2. `generalize-system`
3. `defult-package`
