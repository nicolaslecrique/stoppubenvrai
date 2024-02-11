from ast import Pass
import os
import secrets
from time import timezone
from firebase_admin import storage
from firebase_admin import credentials
import firebase_admin
from datetime import date, datetime, tzinfo, timezone
from config import bucket_name

# Initialize Firebase Admin SDK
cred = credentials.Certificate("secrets/firebaseAdminServiceAccount.json")  # Path to your service account key file
firebase_admin.initialize_app(cred, {
    # 'storageBucket': 'your-storage-bucket-url'  # Your Firebase Storage bucket URL
})

bucket = storage.bucket(bucket_name)

def download_files_after_date(destination_folder: str, min_date: datetime):
    # Convert date to Firebase Storage format
    date_string = min_date.strftime("%Y-%m-%d")
    
    blobs = bucket.list_blobs()
    recent_blobs = [b for b in blobs if b.time_created > min_date]

    for blob in recent_blobs:

        blob_name: str = blob.name
        split = blob_name.split('/')
        file_dir = "/".join(split[:-1])
        file_name=split[-1]
        dest_dir = os.path.join(destination_folder, file_dir)
        if not os.path.exists(dest_dir):
            os.makedirs(dest_dir)

        destination_file = os.path.join(dest_dir, file_name)
        if not os.path.exists(destination_file):
            blob.download_to_filename(destination_file)
        else:
            print(f'{destination_file} already exists')


if __name__ == "__main__":
    destination_folder = "generated/uploaded_images"
    
    min_date = datetime(2024, 1, 1, tzinfo=timezone.utc)
    
    # Call the function to download files uploaded after the specified date
    download_files_after_date(destination_folder, min_date)
