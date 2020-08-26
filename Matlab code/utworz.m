function[waga1, waga2] = utworz(wejscia, warstwa1, warstwa2, pPrzedzialu, kPrzedzialu)
waga1=(kPrzedzialu-pPrzedzialu)*rand(wejscia+1,warstwa1)+pPrzedzialu;
waga2=(kPrzedzialu-pPrzedzialu)*rand(warstwa1+1,warstwa2)+pPrzedzialu;
%inicjalizacja, wejscia+1 z powodu biasa, 
%w wadze2 warstwa1+1 dla biasa, bo wejscie w warstwie drugiej jest wyjsciem
%z warstwy pierwszej
end




