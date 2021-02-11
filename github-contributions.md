Latest record from the dataset:




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>org</th>
      <th>repo</th>
      <th>type</th>
      <th>identifier</th>
      <th>subidentifier</th>
      <th>date</th>
      <th>author</th>
      <th>owner</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7843</th>
      <td>apache</td>
      <td>ozone</td>
      <td>PR_COMMENTED</td>
      <td>1766</td>
      <td>NaN</td>
      <td>2021-02-11 04:27:15+00:00</td>
      <td>bharatviswa504</td>
      <td>bharatviswa504</td>
    </tr>
  </tbody>
</table>
</div>



# Github Contributions per user



    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-367-e98195505eab> in <module>
    ----> 1 c = contributions[["identifier","author","type","own"]].groupby(["author","type","own"]).count() \
          2    .reset_index().rename(columns={"identifier":"contributions"})
          3 #contributions per user
          4 c[~c.own][["author","contributions"]].groupby("author").sum().sort_values("contributions",ascending=False).head(10)


    /usr/lib/python3.9/site-packages/pandas/core/frame.py in __getitem__(self, key)
       3028             if is_iterator(key):
       3029                 key = list(key)
    -> 3030             indexer = self.loc._get_listlike_indexer(key, axis=1, raise_missing=True)[1]
       3031 
       3032         # take() does not accept boolean indexers


    /usr/lib/python3.9/site-packages/pandas/core/indexing.py in _get_listlike_indexer(self, key, axis, raise_missing)
       1264             keyarr, indexer, new_indexer = ax._reindex_non_unique(keyarr)
       1265 
    -> 1266         self._validate_read_indexer(keyarr, indexer, axis, raise_missing=raise_missing)
       1267         return keyarr, indexer
       1268 


    /usr/lib/python3.9/site-packages/pandas/core/indexing.py in _validate_read_indexer(self, key, indexer, axis, raise_missing)
       1314             if raise_missing:
       1315                 not_found = list(set(key) - set(ax))
    -> 1316                 raise KeyError(f"{not_found} not in index")
       1317 
       1318             not_found = key[missing_mask]


    KeyError: "['own'] not in index"


## Contributors per participations in PRs which are not created by self (helping PRs)


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    <ipython-input-368-29e68a92cbac> in <module>
    ----> 1 c = contributions[~contributions.own][["identifier","author"]].groupby(["identifier","author"]).count() \
          2    .reset_index().groupby("author").count()
          3 c.sort_values("identifier",ascending=False).head(20)


    /usr/lib/python3.9/site-packages/pandas/core/generic.py in __getattr__(self, name)
       5460             if self._info_axis._can_hold_identifiers_and_holds_name(name):
       5461                 return self[name]
    -> 5462             return object.__getattribute__(self, name)
       5463 
       5464     def __setattr__(self, name: str, value) -> None:


    AttributeError: 'DataFrame' object has no attribute 'own'


## Contributors per participations in any PRs




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>identifier</th>
    </tr>
    <tr>
      <th>author</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>adoroszlai</th>
      <td>359</td>
    </tr>
    <tr>
      <th>elek</th>
      <td>291</td>
    </tr>
    <tr>
      <th>bharatviswa504</th>
      <td>157</td>
    </tr>
    <tr>
      <th>xiaoyuyao</th>
      <td>140</td>
    </tr>
    <tr>
      <th>bshashikant</th>
      <td>106</td>
    </tr>
    <tr>
      <th>amaliujia</th>
      <td>102</td>
    </tr>
    <tr>
      <th>avijayanhwx</th>
      <td>93</td>
    </tr>
    <tr>
      <th>GlenGeng</th>
      <td>84</td>
    </tr>
    <tr>
      <th>ChenSammi</th>
      <td>81</td>
    </tr>
    <tr>
      <th>codecov-commenter</th>
      <td>76</td>
    </tr>
    <tr>
      <th>linyiqun</th>
      <td>69</td>
    </tr>
    <tr>
      <th>vivekratnavel</th>
      <td>69</td>
    </tr>
    <tr>
      <th>maobaolong</th>
      <td>66</td>
    </tr>
    <tr>
      <th>github-actions</th>
      <td>62</td>
    </tr>
    <tr>
      <th>runzhiwang</th>
      <td>61</td>
    </tr>
    <tr>
      <th>ayushtkn</th>
      <td>51</td>
    </tr>
    <tr>
      <th>captainzmc</th>
      <td>48</td>
    </tr>
    <tr>
      <th>arp7</th>
      <td>47</td>
    </tr>
    <tr>
      <th>mukul1987</th>
      <td>47</td>
    </tr>
    <tr>
      <th>smengcl</th>
      <td>45</td>
    </tr>
  </tbody>
</table>
</div>



# Bus factor (number of contributors responsible for the 50% of the prs)

## Contributors until the half of the all contributions




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>author</th>
      <th>identifier</th>
      <th>cs</th>
      <th>ratio</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>adoroszlai</td>
      <td>129</td>
      <td>129</td>
      <td>13.976165</td>
    </tr>
    <tr>
      <th>1</th>
      <td>elek</td>
      <td>81</td>
      <td>210</td>
      <td>8.775731</td>
    </tr>
    <tr>
      <th>2</th>
      <td>GlenGeng</td>
      <td>48</td>
      <td>258</td>
      <td>5.200433</td>
    </tr>
    <tr>
      <th>3</th>
      <td>bharatviswa504</td>
      <td>46</td>
      <td>304</td>
      <td>4.983749</td>
    </tr>
    <tr>
      <th>4</th>
      <td>maobaolong</td>
      <td>37</td>
      <td>341</td>
      <td>4.008667</td>
    </tr>
    <tr>
      <th>5</th>
      <td>amaliujia</td>
      <td>35</td>
      <td>376</td>
      <td>3.791983</td>
    </tr>
    <tr>
      <th>6</th>
      <td>runzhiwang</td>
      <td>32</td>
      <td>408</td>
      <td>3.466956</td>
    </tr>
    <tr>
      <th>7</th>
      <td>captainzmc</td>
      <td>29</td>
      <td>437</td>
      <td>3.141928</td>
    </tr>
  </tbody>
</table>
</div>



## Pony number (bus factor)




    9



## Dev power (All the contributions in the ration of the top contributor)




    7.155038759689924




    
![png](github-contributions_files/github-contributions_17_0.png)
    


## People with created PRs > reviewed/commented PRS


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    <ipython-input-374-c8b18b1ad4d0> in <module>
          1 created = contributions[contributions.type == "PR_CREATED"][["author","identifier"]].groupby("author").count().rename(columns={"identifier":"created"})
    ----> 2 helped = contributions[~contributions.own][["identifier"]].groupby([contributions.author,contributions.identifier]).sum().rename(columns={"identifier":"helped"}) \
          3   .reset_index().groupby(["author"]).count().drop(columns=["identifier"])
          4 merged = pd.merge(helped,created, left_index=True, right_index=True)
          5 


    /usr/lib/python3.9/site-packages/pandas/core/generic.py in __getattr__(self, name)
       5460             if self._info_axis._can_hold_identifiers_and_holds_name(name):
       5461                 return self[name]
    -> 5462             return object.__getattribute__(self, name)
       5463 
       5464     def __setattr__(self, name: str, value) -> None:


    AttributeError: 'DataFrame' object has no attribute 'own'



    
![png](github-contributions_files/github-contributions_20_0.png)
    


# Number of individual contributors per month

Number of different Github users who either created PR, commented PR, added review to a PR

Note: only events from apache/hadoop-ozone repository are included. Earlier PRs/comments are not here.




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>author</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2020-06</td>
      <td>48</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2020-07</td>
      <td>46</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2020-08</td>
      <td>39</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2020-09</td>
      <td>45</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2020-10</td>
      <td>40</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2020-11</td>
      <td>47</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2020-12</td>
      <td>42</td>
    </tr>
    <tr>
      <th>7</th>
      <td>2021-01</td>
      <td>47</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2021-02</td>
      <td>35</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](github-contributions_files/github-contributions_24_0.png)
    


# Number of PRs closed/created per month

    /usr/lib/python3.9/site-packages/pandas/core/arrays/datetimes.py:1101: UserWarning: Converting to PeriodArray/Index representation will drop timezone information.
      warnings.warn(



    
![png](github-contributions_files/github-contributions_27_0.png)
    


## Monthly comments

    /usr/lib/python3.9/site-packages/pandas/core/arrays/datetimes.py:1101: UserWarning: Converting to PeriodArray/Index representation will drop timezone information.
      warnings.warn(





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>identifier</th>
    </tr>
    <tr>
      <th>date</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2020-06</th>
      <td>562</td>
    </tr>
    <tr>
      <th>2020-07</th>
      <td>411</td>
    </tr>
    <tr>
      <th>2020-08</th>
      <td>306</td>
    </tr>
    <tr>
      <th>2020-09</th>
      <td>330</td>
    </tr>
    <tr>
      <th>2020-10</th>
      <td>200</td>
    </tr>
    <tr>
      <th>2020-11</th>
      <td>298</td>
    </tr>
    <tr>
      <th>2020-12</th>
      <td>315</td>
    </tr>
    <tr>
      <th>2021-01</th>
      <td>355</td>
    </tr>
    <tr>
      <th>2021-02</th>
      <td>198</td>
    </tr>
  </tbody>
</table>
</div>


