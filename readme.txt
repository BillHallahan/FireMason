Run

cabal update
cabal install --only-dependencies
cabal build

Z3 needs to be on your path for the tool to work:
https://github.com/Z3Prover/z3