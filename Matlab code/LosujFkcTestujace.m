function[Xwe,Ywe]=LosujFkcTestujace(M,numerPrzykladu) %M - jest to iloœæ argumentów, zwracamy wartoœci X i Y 
% czyli x i y odpowiedniej funkcji - 1 przyk³ad! trzeba wywo³aæ i po³¹czyæ Xwe i Ywe  dla wielu numerow przkladow - wtedy mamy ciagi uczace / testowe
x=[-10:0.01:10];
Xwe=0; Ywe=0;
%if numer przykladu ==1 -> przyklad 1 , jak 2 to drugi itd.

%funkcje testujace: 
y1=0.2*x.*x-x+0.4; %numer 1przykladu
y2=0.1*x.*x-0.5*x+0.2; %numer 2 przykladu itd 
y3=0.2*x.*x+x-0.3; 

%wybrany jako y
if numerPrzykladu==1 y=y1; end
if numerPrzykladu==2 y=y2; end
if numerPrzykladu==3 y=y3; end


ilePrzykl=size(y,2); % mamy iles przykladow - losujemy jeden z nich 
flaga=-1; 

for i=1:M
  while flaga<0
    los=ceil((ilePrzykl-1)*rand(1)+1); % losujemy przyklad, wiec od 1 do ilosci przykladow - w matlabie indeksowanie od 1!
    if isempty(find(Xwe==x(los)))==0||y(los)>1||y(los)<0 % dzieki warunkowi losowane sa caly czas inne wartosci, nie mozna wylosowac dwoch takich samych xów , y tak, bo i tak zawsze s¹ inne x, a jak to parabola to gdzies y bedzie taki sam dla innego x
        flaga=-1;
    else
        flaga=1;
    end
  end  
flaga=-1;
Xwe(i,:)=x(los)
Ywe(i,:)=y(los)
end

    