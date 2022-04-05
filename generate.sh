#!/bin/bash
echo "RUNNING generate.sh script"

echo "Creating file schema.json"
echo "{name: 'test'}" > schema.json

echo "Creating file schema.js"
echo "console.log('test file generated')" > schema.js

echo "----xxxxx---- Completed file generation ----xxxxx----"