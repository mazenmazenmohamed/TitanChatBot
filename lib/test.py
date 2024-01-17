import requests
Base ="http://127.0.0.1:5000"
q=input()
response = requests.get(url=Base+"/hash/%s"%(q))
result =response.json()['answer']
print(result)





