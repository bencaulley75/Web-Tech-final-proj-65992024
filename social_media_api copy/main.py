import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
import flask
from flask import jsonify, request, json, Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
# Use a service account
cred = credentials.Certificate("key.json")
firebase_admin.initialize_app(cred)

# Get a reference to the Firestore database
db = firestore.client()
profile_ref = db.collection("profile")


# Registering student profile
@app.route('/register_student_profile', methods=['POST'])
def register_student_profile():
    # Parse the request body
    data = json.loads(request.data)

    # Validating the request body
    if not data:
        return jsonify({'error': 'Missing fields'}), 400

    # Checking if there is duplicate entry
    # profile_ref = db.collection('profile')
    # query = profile_ref.where('student_id', '==', data['student_id']).get()
    # if query:
    #     return jsonify({'error': 'This Student Has Already Been Registered!'}),200

    # Add the voter to the database
    profile_ref.add(data)

    # Return success response
    return jsonify({'message': 'Student account registered successfully'}), 200



# Updating a registered voter's information
@app.route('/update_student_profile', methods=['PATCH'])
def update_student_profile():
    # Parse the request body
    data = json.loads(request.data)

    # Check if student_id, email, and name are in the request body
    if 'student_id' not in data or 'email' not in data or 'name' not in data:
        return jsonify({'error': 'Error: student_id, email, or name not in request body'}), 400

    name = data.get('name')
    email = data.get('email')
    student_id = request.args.get('student_id')
    date_of_birth = data.get('date_of_birth')
    year_group = data.get('year_group')
    major = data.get('major')
    best_movie = data.get('best_movie')
    best_food = data.get('best_food')
    campus_residence = data.get('campus_residence')

    # Get the student's record from Firebase
    profile_ref = db.collection('profile').where('student_id', '==', student_id)
    student = profile_ref.get()

    if len(student)>0:
        # Update the record with the new data
        studentData = student[0]
        studentData.reference.update(request.get_json())


        # Return success response
        return jsonify({'message': 'Student profile updated successfully'}), 200
    else:
        return jsonify({'error': 'Student profile not found'}), 404

#
# Retrieving a registered voter by ID
@app.route('/get_student_profile/<student_id>', methods=['GET'])
def get_student_profile(student_id):
    # Find the student by ID
    profile_ref = db.collection('profile')
    registered_students = profile_ref.get()

    for student in registered_students:
        student_data = student.to_dict()
        if student_data['student_id'] == student_id:
            # Return the student information
            return jsonify(student_data), 200

    # If voter is not found, return error response
    return jsonify({'error': 'Student Profile not found'}), 404



#
# Run the app
if __name__ == '__main__':
    app.run(debug=True)
#
#
#
