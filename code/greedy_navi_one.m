function [R,T,N] = greedy_navi_one(G1,EdgeTable,t,a)

T=[];
s=size(G1.Nodes);
N=[];

for b=1:1:75
    if b~=a
        if a>s(1)||b>s(1)
            %continue
            for c=t+1:1:32424
                if (EdgeTable(c,1)==a&&EdgeTable(c,2)==b)||(EdgeTable(c,1)==b&&EdgeTable(c,2)==a)
                    T=[T EdgeTable(c,3)];
                    N=[N 1];
                    break
                end
            end
        else
            p=shortestpath(G1,a,b);
            n=numel(p);
            if n==0
                %continue
                for d=t+1:1:32424
                    if (EdgeTable(d,1)==a&&EdgeTable(d,2)==b)||(EdgeTable(d,1)==b&&EdgeTable(d,2)==a)
                        T=[T EdgeTable(d,3)];
                        N=[N 1];
                        break
                    end
                end
            else
                for i=t+1:1:32424
                    if (EdgeTable(i,1)==p(1)&&EdgeTable(i,2)==p(2))||(EdgeTable(i,1)==p(2)&&EdgeTable(i,2)==p(1))
                        if n==2
                            T=[T EdgeTable(i,3)];
                            N=[N n-1];
                            break
                        else
                            for j=i+1:1:32424
                                if (EdgeTable(j,1)==p(3)&&EdgeTable(j,2)==p(2))||(EdgeTable(j,1)==p(2)&&EdgeTable(j,2)==p(3))
                                    if n==3
                                        T=[T EdgeTable(j,3)];
                                        N=[N n-1];
                                        break
                                    else
                                        for k=j+1:1:32424
                                            if (EdgeTable(k,1)==p(3)&&EdgeTable(k,2)==p(4))||(EdgeTable(k,1)==p(4)&&EdgeTable(k,2)==p(3))
                                                if n==4
                                                    T=[T EdgeTable(k,3)];
                                                    N=[N n-1];
                                                    break
                                                else
                                                    for l=k+1:1:32324
                                                        if (EdgeTable(l,1)==p(5)&&EdgeTable(l,2)==p(4))||(EdgeTable(l,1)==p(4)&&EdgeTable(l,2)==p(5))
                                                            if n==5
                                                                T=[T EdgeTable(l,3)];
                                                                N=[N n-1];
                                                                break
                                                            else
                                                                for x=l+1:1:32324
                                                                    if (EdgeTable(x,1)==p(5)&&EdgeTable(x,2)==p(6))||(EdgeTable(x,1)==p(6)&&EdgeTable(x,2)==p(5))
                                                                        if n==6
                                                                            T=[T EdgeTable(x,3)];
                                                                            N=[N n-1];
                                                                            break
                                                                        else
                                                                            for y=x+1:1:32324
                                                                                if (EdgeTable(y,1)==p(7)&&EdgeTable(y,2)==p(6))||(EdgeTable(y,1)==p(6)&&EdgeTable(y,2)==p(7))
                                                                                    if n==7
                                                                                        T=[T EdgeTable(y,3)];
                                                                                        N=[N n-1];
                                                                                        break
                                                                                    else
                                                                                        for z=y+1:1:32324
                                                                                            if (EdgeTable(z,1)==p(7)&&EdgeTable(z,2)==p(8))||(EdgeTable(z,1)==p(8)&&EdgeTable(z,2)==p(7))
                                                                                                T=[T EdgeTable(z,3)];
                                                                                                N=[N n-1];
                                                                                                break
                                                                                            end
                                                                                        end
                                                                                        break
                                                                                    end
                                                                                end
                                                                            end
                                                                            break
                                                                        end
                                                                    end
                                                                end
                                                                break
                                                            end
                                                        end
                                                    end
                                                    break
                                                end
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                            break
                        end
                    end
                end
            end
        end
    else
        continue
    end
end
R=numel(T);
T=T-EdgeTable(t,3);
T=mean(T);
N=mean(N);