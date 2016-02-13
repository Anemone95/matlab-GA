function [minObj,x]=GATSP(N,attach,NIND)
    % Author:         Anemone
    % Filename:       GATSP.m
    % Last modified:  2015-08-31 15:26
    % E-mail:         x565178035@126.com

    MAXGEN=200; %遗传代数
    if nargin<3
        NIND=100; %初始种群数
    end
    Pc=0.9;     %重组几率
    Pm=0.2;     %变异几率
    GGAP=0.9;   %自然选择概率

    Chrom=InitPop(NIND,N);
    gen=0;
    history=[];
    h=waitbar(0,'Evolving....');
    while gen<MAXGEN
        ObjV=PathLength(attach,Chrom);
    %    min(ObjV)
        FitnV=Fitness(ObjV);
        SelCh=Select(Chrom,FitnV,GGAP);     %选择
        SelCh=Recombin(SelCh,Pc);           %重组
        SelCh=Mutate(SelCh,Pm);             %变异
        SelCh=Reverse(SelCh,attach);        %反转
        Chrom=Reins(Chrom,SelCh,ObjV);      %混合产生新种群
        history=[history min(ObjV)];
        gen=gen+1;
        waitbar(gen/MAXGEN,h,sprintf('Now Generation:%d',gen));
        if gen>30
            if sum(diff(history(end-30:end)))==0
                break
            end
        end
    end
    close(h)

    ObjV=PathLength(attach,Chrom);
    plot(history)
    title('Fitness curve','fontsize',12);
    xlabel('Evolutionary generation','fontsize',12);ylabel('Option','fontsize',12);
    % axis([0,MAXGEN,0,1])

    [minObj,minInd]=min(ObjV);
    x=Chrom(minInd,:);

end

