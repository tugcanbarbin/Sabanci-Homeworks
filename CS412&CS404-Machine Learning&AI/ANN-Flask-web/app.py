#!/usr/bin/env python
# coding: utf-8

# In[70]:


import numpy as np
from flask import Flask, render_template, request
from tensorflow.keras.models import load_model


# In[71]:


app = Flask(__name__)
model = load_model('mymodel')


# In[ ]:


@app.route('/')
def home():
    return render_template('index2.html')
@app.route('/predict', methods=['POST'])
def predict():
    int_features= [item for item in request.form.values()]
    int_features = int_features[:-1]
    int_features = [int(item) for item in int_features]
    final_features = (np.array(int_features))
    final_features = np.array([np.insert(final_features,0,160)])
    prediction = model.predict(final_features)
    return render_template('index2.html', predicted_value = 'Estimated value of a car that this person will choose is: '+ str(prediction))


if __name__ == "__main__":
    app.run(debug=True,use_reloader=False, port=4996)

