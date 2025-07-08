# Problems Faced

## Outputs Not Visible
- The outputs from the Terraform configuration were not visible. 
    - **Root Cause**: They were defined at the module level and not at the root module level.

## Tags Allocation
- Tags were not getting allocated to the backend VM instance as expected.
    - **Root Cause**: The tags key and values were not created.

## API Not Available
- The backend API was not accessible.
    - **Root Cause**: The repository was not cloned, and `pip` was not installed.

## Major Issue: Flask-CORS Not Installed
- **Error**: Encountered the `externally-managed-environment` error due to Debian/Ubuntu's protection of the system Python environment (following PEP 668).
    - **Details**:
        - System Python does not allow `pip install` unless a virtual environment is used or the protection is overridden.
    - **Resolution Attempt**:
        - Created a virtual environment, but the issue persisted because the repository was not cloned.

## SSH Key Invalid
- **Error**: SSH key was reported as invalid.
    - **Root Cause**: The target folder for the Git repository was not provided during the cloning process.
    - **Next Steps**: Further investigation needed to understand the underlying reason.

## Frontend Issues
1. **`index.html` Keeps Downloading**:
    - The `index.html` file was being downloaded instead of being displayed in the browser.
2. **Empty `index.html`**:
    - The `index.html` file appeared empty.
    - **Observation**: The issue resolved itself when the browser's network tab was opened.