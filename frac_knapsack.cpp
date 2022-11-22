#include <bits/stdc++.h>

using namespace std;

struct Item {
  int value,weight;
  Item(int value,int weight){
    this -> value = value;
    this -> weight = weight;
  }
};

 static bool cmp(pair<double,Item> a,pair<double,Item>b){
    return a.first > b.first;
  };

double fractionalKnapsack(int w,Item arr[],int n){
  vector<pair<double,Item>> v;
  for(int i=0;i<n;i++){
    double perUnitValue = (1.0 * arr[i].value) / arr[i].weight;
    pair<double,Item> p = make_pair(perUnitValue,arr[i]);
    v.push_back(p);
  }
  sort(v.begin(),v.end(),cmp);
  double totalVal = 0;
  for(int i=0;i<n;i++){
    if(v[i].second.weight > w){
      totalVal += w*v[i].first;
      w=0;
    }
    else{
      totalVal+=v[i].second.value;
      w -= v[i].second.weight;
    }
  }
  return totalVal;
};

int main(){
  int w = 50;
  Item arr[] = {{60,10},{100,20},{120,30}};
  int n = sizeof(arr)/sizeof(arr[0]);
  cout<<fractionalKnapsack(w,arr,n)<<endl;
  return 0;
}
