function [hand,dnum] = playcard(hand,deck,dnum,turn)
ind = contains(hand,"3cost draw2");
a = find(ind,1);
ind2 = contains(hand,"2cost merchant");
b = find(ind2,1);
ind3 = contains(hand,"2cost paradise");
c = find(ind3,1);
if ~isempty(a) && (turn >=3)
    hand(a)="3cost played draw2 ";
    hand = [hand,deck(dnum+1:dnum+2),"1cost fairy"];
    dnum = dnum+2;
elseif ~isempty(c)
    hand(c)="2cost played paradise ";
    hand = [hand,"3cost hozumi"];
elseif ~isempty(b) && (turn >=2)
        hand(b)="2cost played merchant ";
        hand = [hand,deck(dnum+1)];
        dnum = dnum+1;
% elseif turn >=4
%     ind = contains(hand,"2cost goblin");  %不考虑打哥布
%     
end
end

