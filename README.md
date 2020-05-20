# reliabilityverification

L'application Covid-19 se basera sur la bonne volonté des gens pour s'auto signaler ou signaler (pour le personnels soignants) des personnes infectées ou non.
Le problème est de savoir si ce signalement est fiable ou non.
Pour cela je propose un système de scoring du signalement. Plus le signalement à un score proche de 100 plus il est fiable. 
Par exemple un médecin déclarant un patient X contaminé aura une déclaration 100% fiable pour le système (le médecin et le personnel soignant sont considérés comme des signaleurs extrèmement fiables). 
A contrario un utilisateur Y se déclare infecté sur la base des symptômes qu'il ressent, sans s'être fait testé, aura un signalement avec un score plus faible.

### Execution
L'application peut être lancé en exécutant le fichier app.apk situé à la racine du projet, coller au préalable sur le téléphone ou émulateur avec ca signature app.apk.sha1.

OU

En clonant le repo et en exécutant le projet avec un ide accompagné d'un émulateur.

### Tests
L'application a été testé sur un Huawei P8 lite et sur un émulateur android API R Google Pixel 2.

La détection de text a été testé avec les images suivantes (placées ici https://github.com/fdecouv/s10_poc_reliability/blob/master/assets/images/):
![alt test-1](https://github.com/fdecouv/s10_poc_reliability/blob/master/assets/images/test-1.jpg?raw=true)

![alt test-2](https://github.com/fdecouv/s10_poc_reliability/blob/master/assets/images/test-2.jpg?raw=true)

![alt test-3](https://github.com/fdecouv/s10_poc_reliability/blob/master/assets/images/test-3.jpg?raw=true)

## Diagramme d'activité

![alt diagram](https://github.com/fdecouv/s10_poc_reliability/blob/master/assets/images/diagramme_activite_score_reliability_calcul.png)

## Fonctionnement

#### L'utilisateur est médecin
Il prouve qu'il est médecin en scannant un QRCode que seul les médecins et personnels soignants auront (on peut imaginer que c'est le gouvernement qui le leur est envoyé)

Ensuite il indique à l'application quel est le résultat du test du patient qu'il vient d'obtenir.

Il génère un QRCode qui contient les informations de ce résultat de test covid.

Le patient scan ce QRCode avec son application. 

L'application enregistre cette information qui est à 100% fiable (score de 100).

#### L'utilisateur n'est pas médecin
> Il a deux choix
>> **L'utilisateur possède un test**
>>
>> L'utilisateur entre le n° de série du test (on imagine que les fabricants de test on transmisent toutes ces informations au gouvernement).
>>
>> Le Sytème vérifie que le test existe bien.
>>
>> Une fois la vérification faite l'utilisateur indique le résultat de ce test
>>
>> Il a le choix de finaliser le signalement tout de suite ou de faire valider le résultat
>>
>>> **Il choisi de finaliser tout de suite le signalement**
>>>
>>>> Le signalement obtient un score de 75. (Il a prouvé qu'il été bien en possesion d'un test mais le résultat n'est pas vérifié)
>>>
>>> **Il choisi de faire vérifier sont test**
>>>
>>>> **Il upload alors le résultat dans l'application**
>>>>
>>>> L'application check le résultat (ici une détection du texte présent sur la photo, si le mot "positif" ou "négatif" est détecté alors la vérification est OK, sinon KO). 
>>>>
>>>> Si résultat OK, le signalement obtient un score de 100. (le test est vérifié et le résultat aussi). Sinon le signalement garde son score de 75.
>>>>
>>>> On peut imaginer de remplacer cette détection de texte par une detection d'image (plus cohérente avec un test sur lequel le résultat s'affiche dessus, comme un test de grossese).

>> **L'utilisateur ne possède pas de test**
>>
>>> Il est dirigé sur une vue où les symptômes du virus sont rappelés
>>>
>>> Après consultation des symptômes il est amené à valider ou non son signalement
>>>
>>> Ce signalement aura un score de 50. Rien ne prouve qu'il dit vrai.
