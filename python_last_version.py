import subprocess

def read_python_version():
    with open("python.version", "r") as file:
        return file.read().strip()

def download_python_installer(version):
    url = f"https://www.python.org/ftp/python/{version}/python-{version}-amd64.exe"
    subprocess.run(["curl", "-O", url])

if __name__ == "__main__":
    version = read_python_version()
    if version:
        download_python_installer(version)
    else:
        print("Failed to read Python version from file.")
