clear;
fclose('all');
fid = fopen("gachasentei.txt","w");
flag = zeros(10000,1);
for i = 1:10000
    flag(i) = get(fid);
end
disp(flag(end-9:end)'); %check fullused flag
disp("gacha rate:");
disp(sum(flag)/length(flag));
fclose('all');


function flag = get(fid)
deck = ["1cost leo","1cost leo","1cost leo",...
    "1cost erosive","1cost erosive",...
    "1cost breeze","1cost breeze","1cost breeze",...
    "2cost goblin","2cost goblin","2cost goblin",...
    "2cost metatron","2cost metatron","2cost metatron",...
    "2cost freyja","2cost freyja","2cost freyja",...
    "2cost paradise","2cost paradise",...
    "2cost merchant","2cost merchant","2cost merchant",...
    "2cost slade","2cost slade","2cost slade",...
    "3cost draw2","3cost draw2","3cost draw2",...
    "3cost hozumi","3cost hozumi","3cost hozumi",...
    "3cost tamlin","3cost tamlin",...
    "5cost wardens",...
    "6cost cosmosfang","6cost cosmosfang","6cost cosmosfang",...
    "8cost enforcer","8cost enforcer","8cost enforcer"
    ];
% Although Rayne, Divine Smith is constantly used for otk, you could refer
% it as a merchant.
drawindex = randperm(40);

newdeck = deck(drawindex);
%Sente
EP = 0;
dnum = 3;   %drawn cards no.
turn = 0;
fairy = 0;
flag = 0;
hand = newdeck(1:dnum);
c6 = contains(hand,"6cost cosmosfang");
c6n = sum(count(hand,"6cost cosmosfang"));
if c6n
    newdeck(c6) = newdeck(end-c6n+1:end);   %simplified of drawing the same cosmos
    hand = newdeck(1:dnum);
end
for i = 1:6
    turn = turn + 1;
    dnum = dnum + 1;  %draw card
    hand = [hand,turn,newdeck(dnum)];
    if turn>4
        flag = gachacheck(hand,turn,0);   % 0 for senkou
        if flag
            fprintf(fid,'\r\n %s\r\n',"gacha!");
            fprintf(fid,join(hand));
%             disp('gacha!');
            return;
        elseif turn == 6
            fprintf(fid,'\r\n %s\r\n',"lose!");
            fprintf(fid,join(hand));
%             disp('lose!')
        end
    end
    if ~flag
        [hand,dnum] = playcard(hand,newdeck,dnum,turn);
    end
end
end