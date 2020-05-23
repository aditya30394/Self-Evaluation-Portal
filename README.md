# Self Evaluation Portal
**Application Link** : https://shielded-caverns-97668.herokuapp.com/

### Application Demo
[![Application Demo](https://raw.githubusercontent.com/aditya30394/Self-Evaluation-Portal-CSCE625/master/homepage.JPG)](https://vimeo.com/305544529)

## Summary
The motivation behind the CSCE 625 Self Evaluation project is to help students in assessing their
preparation for the graduate-level Artificial Intelligence course. This project can assist students in
understanding the course prerequisites. By using this evaluation portal, the students can make an
informed decision as to whether they are sufficiently prepared to register for the class.

The requirements for the project were provided by Dr. Duncan Walker, Professor, Texas A&M
University. The key stakeholders of this project are prospective students, teaching assistants, and
the course instructors.

As this was a legacy application, a majority of the work dealt with enhancing existing features or
implementing architecture/design fixes. The key customer requirements were:
1. Implementing Multiple-Choice Questions(MCQs)
2. Supporting Mathematical equations in questions
3. Automating grading/evaluation
4. Setting up a password recovery system

Through this project, all the above requirements were met. The portal now supports
Multiple-Choice Questions on top of the basic “Short Answer” questions. The feature to support
Mathematical equations in Questions/Answers was done using the MathJax library. Automatic
grading has been implemented for both MCQ and Short Answer questions in the Quiz module. In
addition, the instructors now have the opportunity to reset “Lost Password”s.

Initial code is taken as it is from this repo - https://github.com/wagerpascal/team_froyo 

## Features
**Instructors**:
1. Can login and add/edit/update questions and topics
2. Can choose between a multiple-choice question or short answer type question
3. Can add math in the questions
4. Can recover passwords

**Students**:
1. Can take the quiz and evaluate their performance using the feedback and remarks generated at the end
2. Can select the topics they want be tested on
3. Can go through the questions like flashcards


## BDD/TDD process
We followed the development process which was introduced in the class itself where we wrote
cucumber tests which were used as acceptance tests and RSpec tests which were used for function
level testing. Since most of our features required making modifications to the existing product,
many times we just had to add extra tests pertaining to our changes instead of writing the new
feature/Rspec files from the start. However, many tests were missing, so during the course of
development, we added a lot of new tests. We targeted about 1-2 user stories per iteration that
allowed to make sure that we thoroughly test the features before deployment instead of adding tests
towards the end to increase coverage.

## Configuration Management Approach
To make sure that our production environment is clean, we used branch protection rules. We
decided that no one should be allowed to directly push changes to “master” and hence we created
rules that required developers to have their changes reviewed by at least two other developers. As a
result, each developer would raise a pull request and upon being reviewed by two other developers,
the changes will automatically get merged with the master branch. This process really helped us and
most of the time our production environment was in a deployable state. None of the developers
faced any major merge conflict issue too. We had a total of over 45 branches (some have been
deleted) and 4 releases - one for each iteration.

## Issues with Production releases
Heroku does allow automatic deployment where we can specify our production branch and upon
every merge/commit to that branch, Heroku will run some automatic scripts and deploy our latest
changes. However, this feature never worked for us. We pointed the automatic deployment to our
“master” branch, which we tried to keep clean, but the automation script always failed. We did
spend some time to see the issue but it appeared to come because of the ruby version that we were
using. Unfortunately, one of our team members had to always deploy changes manually because of
this one time we thought that our latest changes have been deployed but during the demo to our
customer, the latest changes were missing. We showed our development changes during that time
which was working fine. Had this automatic deployment worked, we could have avoided this
manual deployment.

## Issues with AWS, Cloud9 and Github
We didn’t face any issues with the Development environments.
However, the production instance in Heroku doesn’t provide a free SMTP service. Hence, we had to
perform a workaround to support the Password Recovery feature.

## Development Tools and Ruby Gems
The inline mathematical notation feature was implemented using the javascript library Mathjax. The
choice of this library was made considering its LaTeX markup and its extensive documentation.
The partial check for “Short Answer” questions was done using the fuzzy-string-match Ruby gem.
We used SimpleCov to generate the coverage report of our Ruby code. SimpleCov provided a
simple method for generating test coverage reports.

## Important Links

1. Final Customer Interview : https://vimeo.com/304276474
2. Application Demo : https://vimeo.com/305544529
3. Pivotal tracker : https://www.pivotaltracker.com/n/projects/2200809
4. Heroku App : https://shielded-caverns-97668.herokuapp.com/

## Challenges faced
1. Even though addition of equations looked straightforward using the open-source library called MathJax, getting it to work correctly took us some time. We faced problems displaying equations during navigation between the questions.
2. As Heroku doesn’t provide a free SMTP service, we came up with a workaround to support password recovery.
3. The automatic deployment feature of Heroku never worked for us and we always had to perform manual deployment.


### Customer Interview
[![Customer Interview](https://raw.githubusercontent.com/aditya30394/Self-Evaluation-Portal-CSCE625/master/homepage.JPG)](https://vimeo.com/304276474)

