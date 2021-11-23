import pytest

# from jsonconfig.get import get_schema 

# import jsonschema

import json

import requests

import time


class TestPythonAPIS():

	def setup(self):

		"""
		Basic setup to be provided for test cases

		"""
		pass

	# def test_get_response(self):

	# 	"""
	# 	Testing get request data 

	# 	params:None

	# 	"""
	# 	get_data=requests.get('http://localhost:3000/users')

	# 	jsonschema.validate(get_data.json(),get_schema)

	# 	assert get_data.status_code == 200


	def test_post_response(self):

		"""
		Testing post request data 

		params:None

		"""

		get_data=requests.post('http://localhost:5000/addbirthday',data = {"email":"arya@gmail.com","name":"arya","gender":"male","relation":"son","gender":"male","phone_number":"7324062323","birth_date":"2013-01-21"})

		assert get_data.status_code == 200

	