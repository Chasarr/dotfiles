#!/bin/sh
paru
coursier update
npm update
julia -e 'using Pkg; Pkg.update()'

