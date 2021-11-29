from unittest import TestCase
from server import app
from model import connect_to_db, db, Birthday
from flask import session
import pdb

class FlaskTests(TestCase):
	def setUp(self):
		self.client = app.test_client()	
		# Show Flask errors that happen during tests
		app.config['TESTING'] = True
		connect_to_db(app, "postgresql:///testevents")
		# Create tables and add sample data
		db.create_all()
		self.test_login()
		# self.example_data()


	def test_some_flask_route(self):
		"""Some non-database test..."""

		result = self.client.get("/")
		self.assertEqual(result.status_code, 200)
		self.assertIn('<h1>Test</h1>', result.data)

	# def example_data():
	# 	Birthday.query.delete()
	# 	# Add sample employees and departments
	# 	birth = Birthday(email="arya@gmail.com",name="arya",gender = "male",relation = "son",phone_number = "7324062323",birth_date ="2013-01-21")


	# 	db.session.add_all(birth)
	# 	db.session.commit()


	# def test_index(self):
	#     """Test homepage page."""
	#     pdb.set_trace()
	#     result = self.client.get("/birthday")
	#     self.assertIn(result.status_code,200)




	def test_login(self):
		"""Test login page."""
		pdb.set_trace()
		# headers = {content_type ='multipart/form-data'},
		result = self.client.post("/login",
		data={"user_id": "rachel", "password": "123"},
		follow_redirects=True,content_type='multipart/form-data',)
		self.assertIn(b"You are a valued user", result.data)



