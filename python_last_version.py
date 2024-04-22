import requests

def check_python_version():
    base_url = "https://www.python.org/ftp/python/"
    
    # Loop through minor versions until the last existing 3.x.0 version is found
    major_version = 3
    minor_version = 5
    while True:
        minor_version += 1
        version_url = f"checking {base_url}3.{minor_version}.0/python-3.{minor_version}.0-amd64.exe"
        print(version_url)
        response = requests.head(f"{version_url}python-3.{minor_version}.0-amd64.exe")
        if response.status_code != 200:
            # If the URL doesn't exist, the last existing 3.x.0 version is found
            minor_version -= 1
            break
    
    # Loop through patch versions to find the latest patch version
    patch_version = 0
    while True:
        patch_version += 1
        version_url = f"{base_url}3.{minor_version}.{patch_version}/"
        response = requests.head(f"{version_url}python-3.{minor_version}.{patch_version}-amd64.exe")
        if response.status_code != 200:
            # If the URL doesn't exist, the last existing patch version is found
            patch_version -= 1
            break
    
    latest_version = f"3.{minor_version}.{patch_version}"
    print(f"The latest Python version is: {latest_version}")

if __name__ == "__main__":
    check_python_version()