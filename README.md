# Correction TD-02

Chaque question nécessitant du code a été répondue avec un nouveau contrat pour que vous aillez l'évolution du code au fur et à mesure.
Si vous exécutez ```forge test``` il est normal qu'un des tests ne fonctionne pas, il sert à donner un exemple pour la question concernée.

##### Questions:
 - Quel est le chemin (nom du fichier) du smart contract ? Réponse: ```src/Counter.sol```.
 - Quel est le chemin du fichier de test ? Réponse: ```test/Counter.t.sol```.
 - Quelle est la spécificité de la variable "number" à la ligne 5 ? C'est un nombre positif allant de 0 à (2^256)-1. Elle est publique, c'est à dire qu'elle est lisible par les autres smart contracts.
 - Que fait la fonction setUp ? La fonction setUp est appelée avant chaque tests (les fonctions dont le nom commence par test). Ici, elle déploie un nouveau contrat (```counter = new Counter();```) puis met la valeur de number à 0.
 - Que fait la fonction testIncrement() ? Elle incrémente le compteur.
 - Que fait la fonction testSetNumber ? Pourquoi prend elle un paramètre ? La fonction testSetNumber teste la fonction "setNumber" du contrat. Elle prend une valeur ``x`` en entrée qui est inconnue avant le lancement du test pour forcer l'utilisateur à coder le test sans constantes. Son usage principal est pour l'utilisation de "fuzzers" mais cela ne fait pas l'objet de ce cours.
