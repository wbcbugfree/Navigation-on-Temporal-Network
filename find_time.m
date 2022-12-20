function [timestamp] = find_time(EdgeTable)

timestamp=[];
uni_time=unique(EdgeTable(:,3));
s=size(EdgeTable);

for i=1:1:numel(uni_time)
    for j=1:1:s(1)
        if uni_time(i)==EdgeTable(j,3)
            time=j;
        end
    end
    timestamp=[timestamp time];
end