# Author: @sc232jm (Josh Mundray)

#!/bin/bash

# Load variables from file.sh
source files.sh

echo "Running Testing Script"

# Define the terminal output colours
GREEN="\033[0;32m"
RED="\033[0;31m"
WHITE="\033[0;37m"
WHITE_BOLD="\033[1;37m"

echo -e "${WHITE_BOLD}STARTING PROJECT BUILD${WHITE}"

# Run the make file and check to see if the build passed or failed
if make ; then
    # Notify the user that the build has passed
    echo -e "${GREEN}Build Passed${WHITE}"
else
    # If the build has failed, terminate the test
    echo -e "${RED}Build Failed${WHITE}"
    exit 1
fi

# Ensure the main file is executable
chmod +x maze
# Remove the previous test runs output logs
rm -r output
# Generate a new output directory
mkdir output

# Define the pass and count variable to provide statistics at the end of the test run
passCount=0
failCount=0

# Notify the user that the testing has started
echo -e "${WHITE_BOLD}STARTING PHASE 1${WHITE}"
# Generate a test folder to store the tests and save the variable contents to these files
mkdir tests
echo "Generating test files:"
echo "$test_no_start" > tests/test_no_start.txt
echo "$test_no_end" > tests/test_no_end.txt
echo "$test_multiple_starts" > tests/test_multiple_starts.txt
echo "$test_multiple_ends" > tests/test_multiple_ends.txt
echo "$test_inconsistent_size_row" > tests/test_inconsistent_size_row.txt
echo "$test_inconsistent_size_column" > tests/test_inconsistent_size_column.txt
echo "$test_too_small_row" > tests/test_too_small_row.txt
echo "$test_too_big_column" > tests/test_too_big_column.txt
echo "$test_too_big_row" > tests/test_too_big_row.txt
echo "$test_invalid_characters" > tests/test_invalid_characters.txt
echo "$test_valid_maze_1" > tests/test_valid_maze_1.txt
echo "$test_valid_maze_2" > tests/test_valid_maze_2.txt
echo "$test_valid_maze_3" > tests/test_valid_maze_3.txt
echo "$test_display_map_keys" > tests/test_display_map_keys.txt
echo "$test_bounds_maze" > tests/test_bounds_maze.txt

# Begin testing, prompting the user about the test 
echo -e "Test invalid maze #1 (No start)"
timeout 1.5s ./maze "tests/test_no_start.txt" > "./output/no_start"

if grep -q "Error: Loaded maze has no start" ./output/no_start;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
    
fi

echo "Test invalid maze #2 (No End)"
timeout 1.5s ./maze "tests/test_no_end.txt" > "./output/no_end"

if grep -q "Error: Loaded maze has no end" ./output/no_end;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi


echo "Test invalid maze #3 (Multiple Starts)"
timeout 1.5s ./maze "tests/test_multiple_starts.txt" > "./output/multiple_starts"

if grep -q "Error: Loaded maze has multiple starts" ./output/multiple_starts;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid maze #4 (Multiple Ends)"
timeout 1.5s ./maze "tests/test_multiple_ends.txt" > "./output/multiple_ends"

if grep -q "Error: Loaded maze has multiple ends" ./output/multiple_ends;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi


echo "Test invalid maze #5 (Inconsistent Sizing Row)"
timeout 1.5s ./maze "tests/test_inconsistent_size_row.txt" > "./output/inconsistent_size_row"

if grep -q "Error: Loaded maze has inconsistent sizing" ./output/inconsistent_size_row;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid maze #6 (Inconsistent Sizing Column)"
timeout 1.5s ./maze "tests/test_inconsistent_size_column.txt" > "./output/inconsistent_size_column"

if grep -q "Error: Loaded maze has inconsistent sizing" ./output/inconsistent_size_column;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid maze #7 (Too small row)"
timeout 1.5s ./maze "tests/test_too_small_row.txt" > "./output/test_too_small_row"

if grep -q "Error: Loaded maze is too small" ./output/test_too_small_row;
then
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid maze #8 (Too big row)"
timeout 1.5s ./maze "tests/test_too_big_row.txt" > "./output/too_big_row"

if grep -q "Error: Loaded maze is too big" ./output/too_big_row;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi


echo "Test invalid maze #9 (Too big column)"
timeout 1.5s ./maze "tests/test_too_big_column.txt" > "./output/too_big_column"

if grep -q "Error: Loaded maze is too big" ./output/too_big_column;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid maze #10 (Invalid characters)"
timeout 1.5s ./maze "tests/test_invalid_characters.txt" > "./output/invalid_characters"

if grep -q "Error: Loaded maze contains invalid characters" ./output/invalid_characters;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test valid maze #1"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" > "./output/valid_maze_1" 

if grep -q "Success: Maze loaded with no errors" ./output/valid_maze_1;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test valid maze #2"
timeout 1.5s ./maze "tests/test_valid_maze_2.txt" > "./output/valid_maze_2"

if grep -q "Success: Maze loaded with no errors" ./output/valid_maze_2;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test valid maze #3"
timeout 1.5s ./maze "tests/test_valid_maze_3.txt" > "./output/valid_maze_3"

if grep -q "Success: Maze loaded with no errors" ./output/valid_maze_3;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test invalid path"
timeout 1.5s ./maze "tests/invalid_path.txt" > "./output/invalid_path"

if grep -q "Error: The specified path is invalid" ./output/invalid_path;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test no path"
timeout 1.5s ./maze > "./output/no_path"

if grep -q "Error: The specified path is invalid" ./output/no_path;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test multiple paths"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" "tests/test_invalid_path.txt"> "./output/multiple_paths"

if grep -q "Success: Maze loaded with no errors" ./output/multiple_paths;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi


# Notify the user that phase 2 of testing has started
echo -e "${WHITE_BOLD}STARTING PHASE 2${WHITE}"
echo "Generating input files"
# Generate an input directory and store the variable contents of the files
mkdir inputs
echo "$test_input_wall" > inputs/test_input_wall.txt
echo "$test_input_solve" > inputs/test_input_solve.txt
echo "$test_input_valid" > inputs/test_input_valid.txt
echo "$test_input_invalid" > inputs/test_input_invalid.txt
echo "$test_input_bounds" > inputs/test_input_bounds.txt

echo "Testing Valid Input"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" < inputs/test_input_valid.txt > "./output/input_valid"

wCount=$(grep -c "You've moved forward a square" ./output/input_valid)
sCount=$(grep -c "You've moved backwards a square" ./output/input_valid)
aCount=$(grep -c "You've moved left a square" ./output/input_valid)
dCount=$(grep -c "You've moved right a square" ./output/input_valid)

if [[ "$wCount" == "2" && "$aCount" == "2" && "$sCount" == "2" && "$dCount" == "2" ]];
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test Invalid Input"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" < inputs/test_input_invalid.txt > "./output/input_invalid"

count=$(grep -c "Error: Invalid Input" ./output/input_invalid)
if [[ "$count" == "5" ]];
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test Wall Mechanic"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" < inputs/test_input_wall.txt > "./output/input_wall"
wallCount=$(grep -c "You can't pass through walls!" ./output/input_wall)
if [[ "$wallCount" == "2" ]];
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Test Bounds Mechanic"
timeout 1.5s ./maze "tests/test_bounds_maze.txt" < inputs/test_input_bounds.txt > "./output/bounds"
boundsCount=$(grep -c "You can't exceed the bounds of the maze!" ./output/bounds)
if [[ "$boundsCount" == "2" ]];
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

echo "Testing map display mechanic"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" < tests/test_display_map_keys.txt > "./output/display_map"

if grep -q "# S X   # " ./output/display_map;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi


echo "Test Solvable"
timeout 1.5s ./maze "tests/test_valid_maze_1.txt" < inputs/test_input_solve.txt > "./output/input_solve"
if grep -q "Success: Maze Solved!" ./output/input_solve;
then 
    echo -e "${GREEN}PASS${WHITE}"
    ((passCount+=1))
else
    echo -e "${RED}FAIL${WHITE}"
    ((failCount+=1))
fi

# Calculate the statistics to display to the user
totalTests=$(($passCount+$failCount))
passRate=$(($passCount/$totalTests))

# Dervied from ChatGPT
percentageRate=$(echo "scale=2; $passCount*100 / $totalTests" | bc)

# Output the results of the testing
echo -e "${WHITE_BOLD}RESULTS${WHITE}"
printf "Total Tests: %s\nPass Count: %s\nFail Count: %s\nPass Rate: %s\n" $totalTests $passCount $failCount "$percentageRate%"

# Wait for 5 seconds before removing the test folders, keeping the output folders for further review
sleep 5
echo -e "${WHITE_BOLD}CLEANING UP${WHITE}"
rm -r tests
rm -r inputs
make clean
# Exit cleanly
exit 0
