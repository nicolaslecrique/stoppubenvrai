import os
from firebase_admin import storage
from firebase_admin import credentials
import firebase_admin
from datetime import datetime

# Initialize Firebase Admin SDK
cred = credentials.Certificate("secrets/firebaseAdminServiceAccount.json")  # Path to your service account key file
firebase_admin.initialize_app(cred, {
    # 'storageBucket': 'your-storage-bucket-url'  # Your Firebase Storage bucket URL
})

bucket = storage.bucket()

def download_files_after_date(destination_folder: str, date: datetime):
    # Convert date to Firebase Storage format
    date_string = date.strftime("%Y-%m-%d")
    
    # List all files in Firebase Storage bucket
    blobs = bucket.list_blobs()

    for blob in blobs:
        # Check if the file was uploaded after the specified date
        if blob.time_created.date() > date:
            # Create destination folder if it doesn't exist
            if not os.path.exists(destination_folder):
                os.makedirs(destination_folder)
            
            # Download the file
            destination_file = os.path.join(destination_folder, blob.name)
            blob.download_to_filename(destination_file)
            print(f"Downloaded {blob.name} to {destination_file}")

# Example usage
if __name__ == "__main__":
    # Specify the destination folder where files will be downloaded
    destination_folder = "downloaded_files"
    
    # Specify the date after which files should be downloaded
    date = datetime(2024, 1, 1)  # Example: January 1, 2024
    
    # Call the function to download files uploaded after the specified date
    download_files_after_date(destination_folder, date)
