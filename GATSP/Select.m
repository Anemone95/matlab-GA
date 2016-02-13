function SelCh=Select(Chrom,FitnV,GGAP)
    %��Ⱥ ��Ӧֵ ѡ����� ��ѡ�����
    NIND=size(Chrom,1);
    NSel=max(floor(NIND*GGAP+0.5),2);
    Chrlx=Sus(FitnV,NSel);
    SelCh=Chrom(Chrlx,:);
end

function NewChrlx=Sus(FitnV,NSel)
    %��Ӧֵ ��Ŀ
    %��ѡ����
    [Nind,ans_]=size(FitnV);
    cumfit=cumsum(FitnV);
    trials=cumfit(Nind)/NSel*(rand+(0:NSel-1)');
    Mf=cumfit(:,ones(1,NSel));
    Mt=trials(:,ones(1,Nind))';
    [NewChrlx,ans_]=find(Mt<Mf&[zeros(1,NSel);Mf(1:Nind-1,:)]<=Mt);
    [ans_,shuf]=sort(rand(NSel,1));
    NewChrlx=NewChrlx(shuf);
end

