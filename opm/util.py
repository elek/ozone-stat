import matplotlib.pyplot as plt

def create_pivot(df, timecolumn, valuecolumn, agg="mean"):
    m = df[[valuecolumn]].groupby([df[timecolumn].dt.strftime('%Y').rename("year"),df[timecolumn].dt.strftime('%m') \
                                  .rename("month")]).agg({valuecolumn:agg}) \
        .reset_index()
    result = m.pivot(index="year",columns="month",values=valuecolumn).fillna(0)
    return result


def create_mosaic(df, color):
    plt.figure(figsize=(14,11))
    im = plt.imshow(df, cmap=color)
    plt.yticks(range(len(df)),df.index.values)
    plt.xticks(range(12), ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"])
    plt.colorbar(im, fraction=0.012)
    for i in range(len(df.index)):
        for j in range(len(df.columns)):
            plt.text(j,i, df.iloc[i,j], size=14, va="center", ha="center", color=[0.9,0.9,0.9])


