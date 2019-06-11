# Sentiment Analysis of Clickstream Metrics

By observing the way users interact with a web application, we can analyze their behavior and gain insights into their experience. A clear, smooth interaction provokes joy or at the least contentedness; while a confusing, complex one causes frustration. In this project we utilize user clickstream data from an (anonymous) web application to build a model for sentiment analysis. The model will generate a result per session that indicates whether the user was frustrated with their experience or not. This model could be used by UX designers to help improve the user journey and by senior leadership to quantify the overall satisfaction with their product.

## Repo Guide

This repo includes the code required to reproduce the results obtained in the accompanying paper. We intentionally left out the labeled and unlabeled datasets as they contain confidential information. 

**Data Extraction**
* SampleLogging.js - Sample click handler code that logs an event to the data warehouse
* QueryWarehouse.py - Contains the code that queries the data warehouse for click metrics
* DataExtraction.ipynb - Jupyter notebook that correlates labels from customer feedback with unlabeled click metrics
* DataExtraction.html - HTML version of the notebook for ease of access, please open the HTML in a browser

**Data Preprocessing**
* MetricAnalytics.ipynb - Jupyter notebook that takes care of the data preprocessing steps
* MetricAnalytics.html - HTML version of the notebook for ease of access, please open the HTML in a browser

**Learning and Inference**
* Oracle and Baseline
  * OracleBaselineModels.ipynb - Jupyter notebook with the Oracle and Baseline model code
  * OracleBaselineModels.html - HTML version of the notebook for ease of access, please open the HTML in a browser
* BatchSelectionRun.m - Runs the model on a batch of unlabeled data (for self-learning)
* GenerateNN_Model.m - Generates a neural network function
* GenerateNN_data.m - Loads the data from csv, encodes strings, orders features
* main_Function.m - Defines the workflow for the self-learning methodology
* Plots.m - Helper for plotting evaluation graphs
* ReadUnlabeledBatchData.m - Helper for reading the unlabeled data .csv
