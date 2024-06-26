#!/usr/bin/env bash

# Define the tests that will be used
test_no_start="#####
#   #
#  E#
#   #
#####"

test_no_end="#####
#   #
#   #
#S  #
#####"

test_multiple_starts="#####
#S  #
#  E#
#S  #
#####"

test_multiple_ends="#####
#E  #
#  E#
#S  #
#####"

test_inconsistent_size_row="#####
#   E#
#  #
#S  #
#####"

test_inconsistent_size_column="#####
#   E#
#   #
#S  #
#####
#"

test_too_small_row="######
#S  E#
#####"

test_too_big_row="#####################################################################################################
#                                                                                                   #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########   #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #   #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #   #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #   #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #   #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #   #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #   #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #   #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #   #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########   #
#                                                                                                   #
#####################################################################################################"

test_too_big_column="####################################################################################################
#                                                                                                  #
#                                                                                                  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
#  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #  ####  #  #
#  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #        #  #
#  ##########  ##########  ##########  ##########  ##########  ##########  ##########  ##########  #
#                                                                                                  #
#                                                                                                  #
####################################################################################################"

test_valid_maze_1="#####
#   #
#  E#
#S  #
#####"

# Maze 2, 3 and display map extracted from minerva
test_valid_maze_2="#####  ########
#S            #
#  #########  #
#  #       #  #
#  #  ###  #  #
#  #  #E#  #  #
#  #### ###  # 
#            # 
###############"

test_valid_maze_3="##########
#S        
#  ####   
#     #   
#  E  #   
##########"


test_bounds_maze="#####
#   #
#  E#
#S  #
# ###"


test_display_map="#####  ########
#S            #
#  #########  #
#  #       #  #
#  #  ###  #  #
#  #  #E#  #  #
#  #### ###  # 
#            # 
###############"

test_invalid_characters="#####
#h  #
#  E#
#S 😂#
#####"

test_input_valid="w
W
s
S
d
D
a
A"

test_input_invalid="p
1
#
😂

"

test_input_wall="a
a"

test_display_map_keys="d
s
s
m"

test_input_solve="w
d
d"

test_input_bounds="s
s
s"
