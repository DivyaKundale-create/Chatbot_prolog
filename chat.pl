
   chatbot :-

     read_word_list(Input), chatbot(Input),!.% ! mean cut
chatbot([bye]):-
    write('Goodbye.I hope I help you'),nl,!.

chatbot(Input) :-
    pattern(S, R),%S=stimulus R=Response
    match(S, Dict, Input),%match it with input ,storing matches for placeholder in dict
    match(R, Dict, Output),
    reply(Output),
    !, chatbot.

match([N|Pattern], Dict, T) :-
    integer(N), lookup(N, Dict, LT),
    append(LT, RT, T),
    match(Pattern, Dict, RT).

%word
match([Word | Pattern], Dict, [Word | Target]) :-
    atom(Word), match(Pattern, Dict, Target).
match([], _Dict, []).

%1,2,3,.. are numbered placeholder
pattern([ok,1,2],[yes,'.']).
pattern([good,morning,1],[good, morning,have, a, nice,day,'.']).
pattern([i,am,1],[hey,1,nice,to,meet,you,'.']).
pattern([thank,you,2],[welcome,'.','.']).
pattern([are,you,chatbot,1],[yes,i,am,chatbot]).
pattern([ you,have,emotions,1],[no,i,do,not,have,emotions,'.']).
pattern([i,got,2],[congratulation,for,2]).

pattern([hii,1],[hello,'.']).
pattern([do,you,know,1,2],[if,its,personal,or,not,in,my,dictionary,then,i,dont,know,'.']).
pattern([sure,1],[you,are,confident,person,'.']).
pattern([1,want,2],[okay,take,efforts,for,2,'.',you,will,achieve,it,'.']).

pattern([what,is,1],[google,1,you,get,answer]).
pattern([1,play,3,video,2],[search,on,youtube,1,3,you,can, see,video]).

pattern([okay,1,2],[yes,'.']).
pattern([hello,1],[hii,'.']).
pattern([1,sorry,2],[dont,be,apologize]).
pattern([okay,1,2],[yes,'.']).
pattern([1,leave,in,3],[ok,where,3,is,'?']).
pattern([1,like,2],[great,'.']).
pattern([how,are,you,1],[i,am,good,
                    and,you,'?']).
pattern([5,4,help,6],[how,can,i,help,you,'?']).
pattern([no,4,3],[its ,alright,'.']).
pattern([yes , 4,3],[you,are,positive,person,'.']).
pattern([me,too],[thats,good]).

pattern([1],[please,go,on,'.']).

reply([Head | Tail]) :-
    write(Head), write(' '), reply(Tail).
reply([]) :- nl.

%used to store matches between stimulus and input
lookup(Key, [(Key, Value) | _Dict], Value).
lookup(Key, [(Key1, _Val1) | Dictionary], Value) :-
    Key \= Key1, lookup(Key, Dictionary, Value).


read_word_list(Ws) :-
   read_line_to_codes(user_input, Code),   %read next line of input from stream  %library(readutil)

    atom_codes(A, Code),                   %convert bet atom and listof characters(integer denoting characters)

    tokenize_atom(A, Ws).                  % writeln(Ws). %break text in into words,number,puctuation marks








