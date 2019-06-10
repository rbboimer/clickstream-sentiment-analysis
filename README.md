# Sentiment Analysis of Clickstream Metrics

By observing the way users interact with a web application, we can analyze their behavior and gain insights into their experience. A clear, smooth interaction provokes joy or at the least contentedness; while a confusing, complex one causes frustration. In this project we utilize user clickstream data from an (anonymous) web application to build a model for sentiment analysis. The model will generate a result per session that indicates whether the user was frustrated with their experience or not. This model could be used by UX designers to help improve the user journey and by senior leadership to quantify the overall satisfaction with their product.

## Repo Guide

This repo includes the code required to reproduce the results obtained in the accompanying paper. We intentionally left out the labeled and unlabeled datasets as they contain confidential information. 

**Data Extraction**
* SampleLogging.js - Sample click handler code that logs an event to the data warehouse
* QueryWarehouse.py - Contains the code that queries the data warehouse for click metrics
* DataExtraction.ipynb - Jupyter notebook that correlates labels from customer feedback with unlabeled click metrics
* DataExtraction.html - HTML version of the notebook for ease of access, please open the HTML in a browswer

**Data Preprocessing**
* MetricAnalytics.ipynb - Jupyter notebook that takes care of the data preprocessing steps

**Learning and Inference**
* 
