# qcow2_2_img_Convertor

A simple, interactive Windows Batch script utility to create, convert, and compress QEMU hard drive images (`.img` and `.qcow2`) for emulators like Xemu.

---

## Features

* **Interactive Menu:** Easily switch between creating new images, converting QCOW2 to RAW, or compressing RAW back to QCOW2.
* **Path & Space Handling:** Built with robust variable expansion to safely process file paths containing spaces or quotes.
* **Automatic Extension Enforcement:** Automatically appends `.img` or `.qcow2` if you forget to type the file extension, preventing generic RAW file bugs.
* **Clean Fallbacks:** Safe to run from any directory once QEMU is added to your system environment variables.

---

## Prerequisites

Before running the script, ensure that QEMU is added to your system's `PATH` variable:

1. Open the Windows Start Menu, type `env`, and select **Edit the system environment variables**.
2. Click **Environment Variables...** at the bottom right.
3. Under **System variables**, select `Path` and click **Edit...**.
4. Click **New** and add the path to your QEMU installation directory (e.g., `C:\Program Files\qemu`).
5. Click **OK** on all windows to save the changes.

---

## Usage

1. Download `qcow2-img Convertor.cmd` and place it in any folder you prefer.
2. Double-click to run the script.
3. Select your desired option from the menu:
   * **1** – Create a new image (RAW or QCOW2)
   * **2** – Convert QCOW2 to RAW (`.img`)
   * **3** – Convert/Compress RAW (`.img`) to QCOW2
4. Follow the on-screen prompts to specify your file paths and sizes.
