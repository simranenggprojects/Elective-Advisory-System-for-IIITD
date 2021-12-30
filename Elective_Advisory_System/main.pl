% starting
start:-
    reconsult('C:/Users/hp/Desktop/SUBJECTS/AI/Assignment/Assignment 1/Elective_Advisory_System/elective.pl'),nl,
    reconsult('C:/Users/hp/Desktop/SUBJECTS/AI/Assignment/Assignment 1/Elective_Advisory_System/temp.pl'),nl,
    advise.

%starting welcome note
advise:-
    write('----------------------------------------------------------------------------------------------'),nl,
    write('Welcome to Avvisare: Elective Advisory System'),nl,
    write('----------------------------------------------------------------------------------------------'),nl,
    write('Are you confused about which all electives to take as per career you want to pursue in future?'),nl,
    write('If yes, you are at right place, I will help you out.'),nl,
    write('If no, nevertheless I would help you to validate your electives choice.'),nl,nl,
    write('By the way, My name is Avvisare. What\'s your name? (Nickname will also work) '),
    read(Name),nl,
    format('Hi, ~w. Let\'s together explore the choices for electives.',[Name]),nl,
    write('What\'s the specialization that you have planned for?'),nl,
    write('-> Artificial Intelligence'),nl,
    write('-> Data Engineering'),nl,
    write('-> Information Security'),nl,
    write('-> Without Specialization'),nl,
    read(Spl),
    specialization(Spl).

% to clear all temporary data from temp.pl data file
clear:-
    abolish(interest/2),
    tell('C:/Users/hp/Desktop/SUBJECTS/AI/Assignment/Assignment 1/Elective_Advisory_System/temp.pl'),
    told.


% Prompts for the level of interest in particular domain
prompt_interest_levels(Interest, Title):-
    write("Level of interest in "),
    write(Title),
    write(" "),
    read(Interest_Level),
    assert(interest(Interest, Interest_Level)). % assert means store into memory

% simple display for parameters for interest
interest_instructions:-
    nl,
    write("Great, now you have to answer a few questions concerning yourself."),nl,
    write("Kindly respond with numbers from 0 to 5:"),nl,nl,
    write("0 - No interest"),nl,
    write("1 - Low interest"),nl,
    write("2 - Medium interest"),nl,
    write("3 - High interest"),nl,
    write("4 - Very high interest"),nl,
    write("5 - This comes in my dreams and I love it beyond moon and stars."),nl,nl.

% to display line
display_line:-
    format('~n To get the list electives that you can take.
 Type should_take(X) as next command.
 I really hope that the suggestions are valuable. ~n').

% set of questions to be asked if specialisation is
% Artificial Intelligence
ai_menu:-
    clear,
    prompt_interest_levels('ML', "developing supervised and unsupervised ML models?"),
    prompt_interest_levels('AI', "logic, reasoning, and knowledge representation?"),
    prompt_interest_levels('GA', "designing of algorithms and checking correctness?"),
    prompt_interest_levels('DMG', "looking into data and catching insights?"),
    prompt_interest_levels('NLP', "processing of natural language text and processing it?"),
    prompt_interest_levels('DL', "deep learning?"),
    save.

% set of questions to be asked if specialisation is
% Data Engineering
de_menu:-
    clear,
    prompt_interest_levels('ML', "developing models that can solve supervised and unsupervised ML task?"),
    prompt_interest_levels('DBSI', "databases and their internals?"),
    prompt_interest_levels('GA', "designing of algorithms and checking correctness?"),
    prompt_interest_levels('DMG', "looking into data and catching insights?"),
    prompt_interest_levels('NLP', "processing of natural language text and processing it?"),
    prompt_interest_levels('DW', "collecting and managing data from varied sources to provide meaningful business insights.?"),
    save.

% set of questions to be asked if specialisation is
% Information Security
is_menu:-
    clear,
    prompt_interest_levels('TMC', "knowing about theoretical aspects of cryptograhic algorithms like the one that secures Zoom?"),
    prompt_interest_levels('NSC', "computer networks and network security?"),
    prompt_interest_levels('AC', "knowing practical aspects of cryptographic algorithms?"),
    prompt_interest_levels('SE', "software vulnerabilities, access control primitives?"),
    save.

% set of questions to be asked if it is
% Without Specialization
ws_menu:-
    clear,
    prompt_interest_levels('ML', "developing supervised and unsupervised ML models?"),
    prompt_interest_levels('AI', "logic, reasoning, and knowledge representation?"),
    prompt_interest_levels('GA', "designing of algorithms and checking correctness?"),
    prompt_interest_levels('TMC', "knowing about cryptograhic algorithms like the one that secures Zoom?"),
    prompt_interest_levels('DMG', "looking into data and catching insights?"),
    prompt_interest_levels('NLP', "processing of natural language text and processing it?"),
    prompt_interest_levels('DL', "deep learning?"),
    prompt_interest_levels('DBSI', "databases and their internals?"),
    prompt_interest_levels('DW', "collecting and managing data from varied sources to provide meaningful business insights.?"),
    save.


% to save the new temporary info for use by inference engine
save:-
    tell('C:/Users/hp/Desktop/SUBJECTS/AI/Assignment/Assignment 1/Elective_Advisory_System/temp.pl'),
    listing(interest),
    told.


specialization('Artificial Intelligence'):-
    interest_instructions,
    ai_menu,
    display_line.

specialization('Data Engineering'):-
    interest_instructions,
    de_menu,
    display_line.

specialization('Information Security'):-
    interest_instructions,
    is_menu,
    display_line.

specialization('Without Specialization'):-
    interest_instructions,
    ws_menu,
    display_line.















