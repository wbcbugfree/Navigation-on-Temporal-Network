function [max_D] = find_maxD(EdgeTable)

timestamp = find_time(EdgeTable);
D=[];

for i=1:1:numel(timestamp)
    P=[];
    j=timestamp(i);
    EdgeTable1=table([EdgeTable(1:j,1) EdgeTable(1:j,2)], EdgeTable(1:j,4));
    EdgeTable1.Properties.VariableNames{1} = 'EndNodes';
    EdgeTable1.Properties.VariableNames{2} = 'Weight';
    G1=graph(EdgeTable1);
    G1=simplify(G1,'sum');
    G1.Edges.Weight=-G1.Edges.Weight+max(G1.Edges.Weight)+1;
    s=size(G1.Nodes);
    for k=1:1:s(1)
        for l=1:1:s(1)
            P=[P numel(shortestpath(G1,k,l))];
        end
    end
    D=[D max(P)];
end
max_D=max(D);