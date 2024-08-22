# CS<sup>2</sup>

Created by Michael Hwang, Lucas Pao, and Alison Xin for CS50's final project.

## Overview

The full title of the project is *CSCS: Computer Science Course Scheduler*, which we've stylistically abbreviated as CS<sup>2</sup>.
We intended to provide all the information one would need to create a plan for taking courses in the Computer Science department, no matter one's grade or field of interest within CS.
Included in the website is a schedule generator, a course catalog searcher, a pre-requirement searcher, and a future classes searcher.

## Running the Project

1. From GitHub, download a `.zip` of all the files in this repository.
2. Log into the CS50 IDE. Execute `cd` in terminal to make sure you're in the home directory.
3. Execute `mkdir cscs`.
4. Extract all files from the GitHub repo into `/cscs`.
5. Execute `cd cscs`.
6. Confirm that all files are properly extracted using `ls`. You should see `data/`, `static/`, and `templates/`.
7. Execute `flask run` to launch the website.

## Pages

### Scheduler

Generates a schedule of CS Courses that takes into account the user's interests (via survey and by asking for "must-include" courses) and prior experience (in the form of "courses already taken or self-studied"). Any course that appears in the schedule must be preceded by its prerequisites.

### Searcher:

Functions as a course catalog, allowing the user to search for specific courses amongst the entire list of available CS courses. The user's input query can be a course number, Fall/Spring, or a keyword. The program outputs a table listing all the courses that satsify the query.

#### Example 1:

    Input: 50
    Output: (all the courses that have a course number of 50)
        COMPSCI	50	Fall    Introduction to Computer Science

#### Example 2:

    Input: "Data"
    Output: (all the courses that have "data" in the course title)
        COMPSCI	10	    Spring	Elements of Data Science
        COMPSCI	109A	Fall	Data Science 1: Introduction to Data Science
        COMPSCI	109B	Spring	Data Science 2: Advanced Topics in Data Science
        COMPSCI	124	    Spring	Data Structures and Algorithms
        COMPSCI	165	    Fall	Data Systems
        COMPSCI	265	    Spring	Big Data Systems
        COMPSCI	271	    Spring	Topics in Data Visualization
        COMPSCI	320 	Fall	Data Systems Design
        COMPSCI	325	    Spring	Communicating with Machines About Data
        COMPSCI	345	    Spring	Datacenter networking
        COMPSCI	378	    Spring	Sketching Algorithms for Massive Data
        COMPSCI	380	    Spring	Algorithms for Social Data

#### Example 3:

    Input: "Fall"
    Output: (all the courses that are offered in the fall)

### Prereq Finder:

This feature allows a user to find all the pre-requisites necessary for a specific CS course.
The user inputs a course number, like 124, and the program outputs a table listing all the courses that are required before that course (CS124).

    Input: 124
    Output: (all the courses required to take before taking CS124)
        COMPSCI	20	Spring	Discrete Mathematics for Computer Science
        COMPSCI	50	Fall	Introduction to Computer Science
        COMPSCI	51	Spring	Abstraction and Design in Computation
        COMPSCI	121	Fall	Introduction to Theoretical Computer Science

### CSMapper

The opposite of Prereq Finder, allowing the user to find all the courses that one can take directly after a specific course.
The user inputs a course number, like 51, and the program outputs a table listing all the courses that have that course (CS51) as a direct prerequisite.

    Input: 51
    Output: (all the courses that have CS51 as a direct prerequisite)
        COMPSCI	121	    Fall	Introduction to Theoretical Computer Science
        COMPSCI	124	    Spring	Data Structures and Algorithms
        COMPSCI	152	    Spring	Programming Languages
        COMPSCI	153	    Fall	Compilers
        COMPSCI	175	    Spring	Computer Graphics
        COMPSCI	181	    Spring	Machine Learning
        COMPSCI	205	    Spring	Computing Foundations for Computational Science
        COMPSCI	280R    Fall	Curricular Design for Computer Science: Computational Linguistics and Natural-language Processing

### Concentrationer

This feature allows a user to find the concentration requirements that a certain course meets.
The user inputs a course number, and the program outputs messages displaying which concentration requirements that course meets and which ones that course does not meet.

    Input: 50
    Output: (all of the concentration requirements that CS50 meets)
        CS50 satisfies requirement 2: Basic Software
        CS50 does not satisfy requirement 3: Theory
        CS50 satisfies requirement 4: Technical Elective
        CS50 does not satisfy requirement 5: Breadth Requirement

## Other Features

#### Course Descriptions:

From every page that displays a table of courses, each course title links to additional course information.

#### Register and Login / Your Schedule

Users can create accounts and login to save their most recently created schedules, which can be accessed in "Your Schedule" page.