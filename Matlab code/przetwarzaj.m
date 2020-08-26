function[wyjscie1,wyjscie2]=przetwarzaj(waga1,waga2,sygWejsc,beta)

sygWejscBias=[-1;sygWejsc];
%dodanie biasu jako -1, zgodnosc wymiarow macierzy przy mnozeniu, bo w
%utworz uwzgledniono miejsca na bias
wyjscieSumator1=waga1'*sygWejscBias;
%mnozymy dla jednego neutronu !wagi! wszystkich wejsc * wszystkie wejscia i
%finalnie mamy w kazdym wierszu wynik mnozenia dla kazdego z neuronow 
wyjscie1=1./(1+exp(-beta*wyjscieSumator1));
%funkcja progowa 1./ - dzielenie tablicowe - 1 to duza macierz
%1,1,1;1,1,1... i dzielimy przez to co obliczona funkcja, kazdy element
%przez kazdy element np macierz [1 2;3 4] -> 1./a daje [1 0.5;0.333 0.25]


%to samo ponizej
wyjscieSumator1Bias=[-1;wyjscie1];
wyjscieSumator2=waga2'*wyjscieSumator1Bias;
wyjscie2=1./(1+exp(-beta*wyjscieSumator2));
end

%wektor wejsciowy jest wymiarów ilosci inicjowanych wejsc w funkcji utworz,
%czyli o 1 mniej niz utworzone macierze wag ( tam zostaly uwzglednione
%dodatkowe miejsca na biasy, ale my wiemy tylko o tym, ze mamy np.3 wejscia,
%wiec podajemy po prostu macierz [3x1] -> 3 wejscia