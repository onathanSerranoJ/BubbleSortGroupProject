# BubbleSortGroupProject
A LC-3 Group Project for our CIS-11 Assembly Course at Moreno Valley College. Team members include Jonathan Serrano, Kaitlyn Osgood, and Savion Morgan Cooper. 

TABLE OF CONTENTS:
----------------------------------------------------------------------------------------------------------------------------------------------------
- GENERAL INFO
- TECHNOLOGIES
- SETUP

GENERAL INFO
----------------------------------------------------------------------------------------------------------------------------------------------------
  This project was created with LC-3 assembly programming langauge to sort eight values in incrementing order using the bubble sort method. The program allows the user to input in a total of 8 values that fall within the range of 0-100. If an input falls outside of these bounds such as character input or attempt to input a negative value, the console will generate an error message telling the user to input a value that falls within range. Partial values will also generate an error message as program only allows for whole integer values. 
    The code was created to fulfill the requirements requested in the assignment consisting of two or more subroutines (GET_INPUT, SORT, and DISPLAY), conditional and iterative branching, PUSH-POP operations on stack, save-restor operations, use of a pointer, ASCII conversion, explanatory comments, and rigorous testing.  
  Our documention for this project is designed to be utilized as an application to sell this program to a medical company. Our code slightly differs from the flowchart in documentation as adjustments had to be made once we realized that the code wasn't working according to the ideas created on the flow chart.

TECHNOLOGIES
----------------------------------------------------------------------------------------------------------------------------------------------------
-LC3 EDIT
-LC3 SIMULATOR

SETUP
----------------------------------------------------------------------------------------------------------------------------------------------------
## 1. DOWNLOADING THE LC‑3 SIMULATOR

You have two main options for running LC‑3 assembly code:

### Option A: LC‑3 Simulator (Desktop Application) – Recommended

Step 1: Download the Simulator**
- Go to the official LC‑3 homepage:  
  `https://highered.mheducation.com/sites/0072467509/student_view0/lc-3_simulator.html`
- Download the version for your operating system:
  - Windows: `LC3Win.zip`
  - macOS / Linux: Java version `LC3Java.zip`

Step 2: Install the Simulator**
- Windows: Extract `LC3Win.zip` and run `LC3Win.exe`
- macOS / Linux: 
  - Extract `LC3Java.zip`
  - Make sure you have Java installed (check with `java -version` in terminal)
  - Run: `java -jar LC3Java.jar`

### Option B: LC‑3 Web Simulator (No Installation)
- Go to: `https://lc3sim.github.io/web/` or `https://wchargin.com/lc3web/`
- Works in any browser – good for quick testing, but feature-limited

## 2. GETTING THE BUBBLE SORT CODE

Clone this repository (if using Git)
```bash
git clone https://github.com/YOUR_USERNAME/BubbleSortGroupProject.git
cd BubbleSortGroupProject


Extract the zip file and open the program.

### Step 2: Open the Assembly File

1. In the LC‑3 Simulator, click **File → Open**
2. Change file type to `*.asm` (Assembly files)
3. Select `bubblesort.asm`
4. Click **Assemble** (or press `F5` on your keyboard)
You should see: `"Assembly completed successfully"` at the bottom


## Step 3: Set the Starting Point

The program starts at memory address `x3000`.
- Look for a box labeled **"Set PC"** or **"PC"**
- Type: `x3000`
- Press Enter

### Step 4: Run the Program
Click the 'Run' button (or press `F5`)

Information should start to fill out in the console window next to the simulator.

### Step 5: Enter the 8 Numbers

When prompted, type each number and press **Enter**:
2 3 6 8 11 17 21

**Rules:**
- Numbers must be between **0 and 100**
- No decimals or letters
- If you type an invalid number, the program will ask you to re-enter

