import requests

#endpoint = "https://httpbin.org/anything"
endpoint = "http://localhost:8000/api"

get_response = requests.get(endpoint)    # HTTP request

print(f"RAW TEXT:\n{get_response.text}\n")    # print raw response

# HTTP Request -> HTML
# REST API HTTP Request -> JSON
# JSON ~ Python Dict
print(f"JSON:\n{get_response.json()}\n")
print(f"STATUS CODE:\n{get_response.status_code}\n")
print(get_response.json()['message'])