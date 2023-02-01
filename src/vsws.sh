#!/bin/bash

: '
  read vscode workspace √
  output folders. √
  @see https://brianchildress.co/parse-json-using-grep/

  filter st actions: each one as a single

'

grep -o '"path": "[^"]*' ../../demo.code-workspace | grep -o '[^"]*$'
