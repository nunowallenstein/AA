import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
#file reading
datasettrain=pd.read_csv('train.csv')
datasettest=pd.read_csv('test.csv')

X_train=datasettrain.iloc[:,:-1].values
Y_train=datasettrain.iloc[:,-1].values

X_test=datasettest.iloc[:,:-1].values
Y_test=datasettest.iloc[:,-1].values

#to normalize the data so that we have a faster convergence
from sklearn.preprocessing import StandardScaler
sc =StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)

#reducing the dimensionality of the problem
#(VERY USEFUL) check: print(pca), it returns the features with the highest relative variance, the features that have more impact on the output
from sklearn.decomposition import PCA
pca=PCA(n_components=2)
X_train=pca.fit_transform(X_train)
X_test=pca.transform(X_test)
explained_variance=pca.explained_variance_ratio_


##Classifiers
#Check this
#https://scikit-learn.org/stable/auto_examples/classification/plot_classification_probability.html 


#check in the options of the classifier to see if there is something to be optmized specially SVM

#There are more methods in scikit learn, if you want go there and pick one, i picked this four. Optimize and get the best two, with the best results. 

#Comment the one you dont want
from sklearn.neighbors import KNeighborsClassifier
#classifier = KNeighborsClassifier(n_neighbors=1,metric='minkowski',p=2)


from sklearn.linear_model import LogisticRegression
#classifier=LogisticRegression(solver='saga')


from sklearn.svm import SVC
#classifer = SVC(kernel='rbf')


from sklearn.ensemble import RandomForestClassifier
#classifier=RandomForestClassifier(n_estimators=9,criterion='entropy')
#thismethod sucks for this problem i think due to overfitting but i didnt explored all the options


classifier.fit(X_train,Y_train)


Y_pred=classifier.predict(X_test)
X_prob=classifier.predict_proba(X_test)



from sklearn.metrics import confusion_matrix
cm=confusion_matrix(Y_test,Y_pred)


from matplotlib.colors import ListedColormap
X_set, Y_set=X_train, Y_train
X1,X2=np.meshgrid(np.arange(start=X_set[:,0].min()-1,stop=X_set[:,0].max()+1,step=0.01),
      np.arange(start=X_set[:,1].min()-1,stop=X_set[:,0].max()+1,step=0.01))
plt.contourf(X1,X2,classifier.predict(np.array([X1.ravel(),X2.ravel()]).T).reshape(X1.shape),alpha=0.75,cmap=ListedColormap(('red','green')))
plt.xlim(X1.min(),X1.max())
plt.ylim(X2.min(),X2.max())
for i, j in enumerate(np.unique(Y_set)):
    plt.scatter(X_set[Y_set==j,0],X_set[Y_set==j,1],
                c=ListedColormap(('red','green'))(i),label=j)
    
plt.title('CHANGE THIS TITLE PROPERLY (Test set)')
plt.xlabel('PC1')
plt.ylabel('PC2')
plt.legend()

#ROC curve
import scikitplot as skplt
skplt.metrics.plot_roc(Y_test,X_prob)

#Printing the confusion matrix before the plots
print(cm)
plt.show()


