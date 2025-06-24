import platform
import subprocess
import os
import sys

def make_executable(path):
    """Set execute permission on a file (Unix only)."""
    try:
        subprocess.run(["chmod", "+x", path], check=True)
        print(f"[INFO] Made script executable: {path}")
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Failed to make script executable: {e}")
        sys.exit(1)

def run_script(command, shell=False):
    """Run a script and print its output live."""
    try:
        process = subprocess.Popen(command, shell=shell, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        for line in process.stdout:
            print(line, end='')
        process.wait()
        if process.returncode != 0:
            raise subprocess.CalledProcessError(process.returncode, command)
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Script execution failed with exit code {e.returncode}")
        sys.exit(e.returncode)

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    system = platform.system()
    print(f"[INFO] Detected OS: {system}")

    if system == "Windows":
        script_path = os.path.join(script_dir, "enable_tethering.bat")
        print(f"[INFO] Running: {script_path}")
        run_script(["cmd", "/c", script_path])

    elif system in ("Linux", "Darwin"):
        script_path = os.path.join(script_dir, "enable_tethering.sh")
        make_executable(script_path)
        print(f"[INFO] Running: {script_path}")
        run_script(["bash", script_path])

    else:
        print(f"[ERROR] Unsupported OS: {system}")
        sys.exit(1)

if __name__ == "__main__":
    main()
