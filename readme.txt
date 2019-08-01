Run

cabal update
cabal install --only-dependencies
cabal build

Z3 (==4.8.4) needs to be on your path for the tool to work:
https://github.com/Z3Prover/z3

also requires the latest version of z3 haskell bindings from the github page https://github.com/IagoAbal/haskell-z3

you can read more about how this works in our publications

Automated repair by example for firewalls
William T. Hallahan ; Ennan Zhai ; Ruzica Piskac
https://ieeexplore.ieee.org/document/8102263
