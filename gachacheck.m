function flag = gachacheck(hand,turn,EP)
flag = 0;
hand = join(hand);
if count(hand,"3cost hozumi")
    c1 = count(hand,"1cost leo");
    c1other = count(hand,"1cost fairy")+count(hand,"1cost erosive");
    c2gob = count(hand,"2cost goblin");
    c2mid = count(hand,"2cost metatron")+count(hand,"2cost freyja");
    c2slade = count(hand,"2cost slade");
    c2merchant = count(hand,"2cost merchant");

    if c1>0 && c2gob>0 && c2mid>0 && c2slade+c2mid+c2merchant>1  %Leo 12123
        flag = 1;return;
    elseif c1>1 && c2gob+c2mid+c2slade+c2mid>1
        flag = 1;return;
    elseif c1>0 && c1+c1other>1 && c2gob+c2slade+c2mid+c2merchant>0 && c2slade>0    %Leo slade12121
        if c2gob+c2slade+c2merchant>0
            flag = 1;return;
        elseif c2slade>1
            flag = 1;return;
        else flag = 0;
        end
    elseif c1+c1other>1 && c2slade>1
        flag=1;return;
    end


    cost = turn;
    cards = 0;
    while flag == 0 && cards<4 && cost>=3 && turn>5
        if cards >=4 && cost>=3
            flag = 1;
            return;
        end
        if c2slade>0        %0cost slade
            c2slade = c2slade-1;
            cards = cards+1;

        elseif c1>0 && c2gob>0
            c2gob = c2gob-1;
            cards = cards+2;
            cost = cost-1;

        elseif c1>0&&c2mid>0    %不考虑哥布林抽卡了
            c1 = c1-1;
            c2mid = c2mid-1;
            cards = cards+2;
            cost = cost-1;

        elseif c1>0
            c1 = c1-1;
            cards = cards+1;
            cost = cost-1;

        elseif c1other >0
            c1other = c1other-1;
            cards = cards+1;
            cost = cost-1;

        elseif c2gob>0      %simplified logic
            cards = cards+1;
            c1 = c1+1;
            c2gob = c2gob -1;
            cost = cost-2;
        elseif c2mid+c2merchant>0
            cards = cards+1;
            cost = cost-2;
        else
            break;
        end
    end

end
end
