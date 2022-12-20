function [Reach,Time,Num] = greedy_navi_all(EdgeTable)

timestamp = find_time(EdgeTable);
Reach=[];
Time=[];
Num=[];

for i=1:1:numel(timestamp)
    j=timestamp(i);
    EdgeTable1=table([EdgeTable(1:j,1) EdgeTable(1:j,2)], EdgeTable(1:j,4));
    EdgeTable1.Properties.VariableNames{1} = 'EndNodes';
    EdgeTable1.Properties.VariableNames{2} = 'Weight';
    G1=graph(EdgeTable1);
    G1=simplify(G1,'sum');
    G1.Edges.Weight=-G1.Edges.Weight+max(G1.Edges.Weight)+1;
    [R,T,N] = greedy_navi_one(G1,EdgeTable,j,51);
    Reach=[Reach R];
    if ~isnan(T)
        Time=[Time T];
    else
        Time=[Time 0];
    end
    if ~isnan(T)
        Num=[Num N];
    else
        Num=[Num 1];
    end
end