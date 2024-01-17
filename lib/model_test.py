from flask import Flask,jsonify
from flask_restful import Api,Resource
app=Flask(__name__)

api = Api(app)
from transformers import pipeline

question_answerer = pipeline("question-answering", model='distilbert-base-cased-distilled-squad')

context = " my name is Mazen , i live in maadi , I am 22 years old "

q=""
class HelloWorld (Resource):
      def get(self, name):
          q=name
          print(q)
          result = question_answerer(question=q, context=context)
          print(result)
          return result
      def post(self,name):
          q=name
          return {"post":"succeeded"}
   
api.add_resource(HelloWorld, "/hash/<string:name>")  

app.run()  
if __name__ == "__main__":
    app.run(debug=True)