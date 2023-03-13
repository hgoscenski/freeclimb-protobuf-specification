# FreeClimb PerCL for Audio Stream

## PerCL

PerCL is the command language for the FreeClimb platform, this is required to tell the FreeClimb platform how to handle a specific call, this includes Audio Stream.
In order to activate Audio Streaming for a call, the below PerCL command must be provided. In addition to the Audio Stream PerCL command the FreeClimb platform has many others available, some of which (`StartRecordCall`) can used in conjunction with Audio Streaming.
For a complete list of available PerCL commands please see the primary FreeClimb [documentation](https://docs.freeclimb.com/reference/percl-overview).

## Serving PerCL

PerCL is fetched from an HTTP webserver with a POST request from the FreeClimb platform on receipt of an inbound call, this request will include [information about the call](https://docs.freeclimb.com/reference/inbound) that can be used, if needed, to configure metadata in the returned AudioStream PerCL response.
This PerCL also configures the `actionUrl` used to notify if the call state changes or any unexpected termination takes place.

## Audio Stream PerCL

```json
// All fields are required
[
    {
        "AudioStream": {
            "location": {
                "uri": "<URL of gRPC server typically https://example.com>"
            },
            "contentType": "audio/mulaw;rate=8000",
            "actionUrl": "<call back URL>",
            "metadata": [
                "any-value-you-want"
            ]
        }
    }
]
```
