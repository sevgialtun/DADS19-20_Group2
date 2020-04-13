void growFilter() {

  for (int j=1; j<Ybol-1; j++)
  {
    for (int i=1; i<Xbol-1; i++)
    {
      int newi = i;
      int newj = j;
      filterList.clear();

      for (int k = newi - 1; k < newi + 2; k++) {
        for (int l = newj - 1; l < newj + 2; l++) {
          if ( abs(k - newi) + abs(l - newj) != 0) {
            int newValue = 0;
            newValue = matrix[k][l];
            filterList.append(newValue);
            println(filterList);
          }
        }
      }
      // çevredeki hücrelerden 5 tanesi aynı renkteyse, o renge dönüş
    }
  }
}
