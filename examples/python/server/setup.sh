#!/bin/bash

python3 -m venv venv
source venv/bin/activate

pip install grpcio-tools
pip install -r requirements.txt

protoc --proto_path ../../../proto/ --python_out=./ --mypy_out=./ ../../../proto/ivr.proto
python3 -m grpc_tools.protoc --proto_path ../../../proto/ --python_out=./  --grpc_python_out=./ ../../../proto/ivr.proto

echo "Run 'source venv/bin/activate' to enable the Python virtual environment"
echo "After activating virtual environment run 'python main.py' to launch the server"
echo "To automatically launch the application press Y, otherwise press enter"

read -r -p "Launch Server [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY]) 
        python main.py
        ;;
esac
