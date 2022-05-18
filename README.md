# ML_Learning_App
The Machine Learning App Final Project For Yuyu(Ruby) Chen, Dakota Fan and Yuchen Jiang

## Overview of the project 

Our project aims to build a machine learning app specifically for students who will be taking the Machine Learning in Public Health taught by Professor Yang Feng. This app will incorporate the lecture notes, lab contents, weekly quiz, and visualization of classification, regression and other relavent content in an interactive way. The ultimate goal of this project is to enrich the learning experience of the students and assist instructors in teaching Machine Learning using R. 

Our end user will be the master/PhD students who will be taking GPHGU 2338 - Machine Learning in Public Health, and the instructors who will be utilizing this application for teaching purposes. Most students come from a public health background with limited experience with statistical training or programming experience. Further development of this application could be shared by the academic community for teaching and learning purposes. 

## User Research Plan 

Machine learning is always a hard topic to learn, especially for those who are not familiar with statistics and programming. Creating an application for students to freely explore the course materials, visualize the performance of different models, and learn to code using R will be beneficial for both students and instructors. In the early stage, our team aimed to understand our stakeholder’s needs and expectations as well as the students’ preference for different learning methods(notes, formula, interactive graph). 

We will deploy a combination of online surveys and questionnaires, and focus groups. We will first invite our stakeholders as well as our users(Professor Yang Feng and the TA for this class) to attend our focus group. For 2 hours, roughly 3-4 participants will be brought together to discuss their expectations for the ML app(modules/functionality/usability need to be incorporated into the application). A modulator will be present to guide and maintain the group’s focus. Their verbal and written feedback will be recorded and collected for future analysis and reference.

Then we will distribute our survey through University email to students who are or have previously enrolled in the GPHGU 2338 - Machine Learning in Public Health. These questionnaires will contain ratings, multiple-choice, and open-ended questions, such as: 

How much prior knowledge in machine learning/ R programming do you have?
How many hours do you spent on the course materials/homework/quiz?
Rate your confidence level in the following areas: (Linear Regression, Logistic Regression, LDA, QDA, Qualitative Variables, Anova etc.)
What are some suggestions for the current lab/lecture/Quiz format?
Do you prefer reading notes/formula or visualizing graphs?
Rate the difficulty level of the lecture/lab/quiz
…
These questionnaires will give us a first idea of our end users’ programming and experience background, the difficulty level of current materials, suggestions for how to optimize teaching experience through our application, and problems they encountered that have not been addressed by the current lab format. 

## User Testing 

* Our Research Questions 

For our student users: 
How easily and successfully do users get started with launching the app on the site? 
Does the starting point of clicking on the sub-topic make any difference in whether users will continue to explore the whole app or not? Do the background color, text style, font, text layout make any difference in whether users are successful in completing all the tasks on the website? Do these factors, as mentioned earlier, affect the time users spend on each sub-topic of the lecture content? 
What paths do users take to complete the learning?
How well does the site support the paths and goals of the users? That is, how closely does the organization and flow of the site match users’ expectations? 
What obstacles do users encounter on the way to completing the learning? Are the definitions and instructions helpful? 
What questions do users ask as they play with the datasets and simulations? 
How do users feel about how long it takes them to complete the learning process, both the perceived time and the number of steps? 


For professors, teaching assistants and graders:
How do TAs and professors think of the application in general for teaching and learning? Is it accessible and straightforward? Or does it even make their pedagogy more complicated and confusing? 
How will TAs and professors collect the quiz results, and evaluate students’ performance? 
Are TAs and professors confidently/comfortably using this app as a supplementary tool for teaching?

* User Profile (characteristics of target participants for the test):

Our end-users will be the graduate students (master/PhD) taking GPHGU 2338.
The desired number of participants will be around 12 to 15, which should be the size of a TA session. 

* Test Environment Description of location and Setup:

The participants will be brought into a “lab” environment to run through a series of tasks. Participants work on a mobile device while being observed in the same room. During the study, participants are given tasks and asked to perform them with a moderator sitting next to them.

* Moderator Role: 

Our team members will sit in the room with the participant while conducting the session. We will introduce tasks as appropriate, present/lecture on the Shiny app usage, and conduct the generative interviews. Because this study is exploratory to some extent, we may ask random follow-up questions to further investigate the participant’s behaviors, perceptions, and expectations. We will also take detailed notes and audio/video recordings for the entire test session.

* Report Contents:

We will deliver a final report on my research to illustrate my research questions and research findings. 
Briefly summarize the background of the study, including the goals, methodology, logistics, and participant characteristics
Presents findings for the original questions to investigate
Show quantitative data analysis and results and discusses specifics as appropriate to the questions and the data
Discusses the implications of the research finds
Provides further recommendations
Suggests future/follow-on research 


## Prototyping round 1

After constructing the basic skeleton of our project(markdown, learn R, visualization and quiz session), we wished to gather feedback and suggestions of our first round prototype from our recruited participants.

This round of usability testing might help with yielding the information we will use to uncover app design bottlenecks, pain points, and opportunities. The goal of these usability test questions is to have a casual conversation with participants rather than following a formal question-and-answer format. A casual conversation will help the usability test flow naturally and put participants at ease. The more at ease they are, the better the chances of them sharing their honest opinions.

My participants got tested on the qualitative variables exercise, which is an inserted mini-program consisting of an interactive drag-and-drop bucket list and a flowchart to demonstrate various data types. 

When they opened the webpage, the first thing they did was to play with the drag-and-drop bucket list, rather than closing reading the flowchart to get an overview of standard classifications of variables. Two of my participants even totally ignore the flowchart at the top of the webpage. They suggested that we could add some instructions and guidelines along with the flowchart so that users might better understand what role the flowchart plays.

After having a look at the flowchart, users found that the explanation of “ordinal variables” was confusing. Specifically, the example underneath is “agreement with a tax proposal—agree/neutral/disagree,” which is ambiguous. Agree and disagree sound like a pair of dummy variables. We might replace “agree/neutral/disagree” with a scale of “1/2/3.” This could be more explicit and straightforward.

As for my question, “How do you use the drag-and-drop feature?” they said they would have a try and play around with the feature to figure out how it works. Instead of reading guidelines or listening to others’ directions, they preferred exploring this feature by themselves. In general, they all agreed that the interactive drag-and-drop feature is appealing and improved their learning experience.

The drag-and-drop part of this inserted mini-program is used the most while the flowchart is used the least. Users easily get attracted by some interactive features. However, my test participants reflected that the three scenarios we provided were not inclusive as they only covered nominal variables. Users might hope to see some cases and scenarios that contain ordinal variables.

As for the interface in general, my test participants said they liked it very much. It’s fluid, concise, and easy to use. They had a good experience navigating the website. Some users suggested that the drop-and-drop exercise part was a bit small. The texts could be more prominent. But the overall layout of information and features was okay. 


