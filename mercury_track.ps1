# PowerShell script to track Mercury using a webcam via OpenCV in Python

# Define the Python code to track Mercury using OpenCV
$pythonCode = @"
import cv2

# Load the pre-trained Haar cascade for object detection
cascade_path = 'path/to/haarcascade.xml'
face_cascade = cv2.CascadeClassifier(cascade_path)

# Create a VideoCapture object to access the webcam
video_capture = cv2.VideoCapture(0)

while True:
    # Read a frame from the webcam
    ret, frame = video_capture.read()

    # Convert the frame to grayscale for object detection
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detect objects using the Haar cascade
    objects = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    # Draw bounding boxes around the detected objects
    for (x, y, w, h) in objects:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)

    # Display the resulting frame
    cv2.imshow('Object Tracking', frame)

    # Wait for the 'q' key to exit the program
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the VideoCapture and close the window
video_capture.release()
cv2.destroyAllWindows()
"@

# Save the Python code to a .py file
$pythonScriptPath = "C:\Path\to\tracking_script.py"
$pythonCode | Set-Content -Path $pythonScriptPath

# Run the Python script using PowerShell
& python $pythonScriptPath
