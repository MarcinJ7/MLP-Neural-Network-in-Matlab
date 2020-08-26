function[WejSort,WyjSort]=sortowanie(Wejscia,Wyjscia)  

[WejSort,INDEX]=sort(Wejscia); % indeks czytamy tak : jest to macierz, ktora wskazuje elementy(wiersze konkretnej kolumny) tablicy wejsciowej ktore po wstawieniu na to miejsce dadza macierz posortowana 

for i=1:3 % mamy zawsze 3 funkcjie nieliniowe, sortujemy 
WyjSort(:,i)=Wyjscia(INDEX(:,i),i)
end
