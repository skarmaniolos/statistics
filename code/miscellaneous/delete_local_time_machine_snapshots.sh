#!/bin/bash

# code which deletes local time machine snapshots on macOS
for d in $(tmutil listlocalsnapshotdates | grep "-"); do sudo tmutil deletelocalsnapshots $d; done
