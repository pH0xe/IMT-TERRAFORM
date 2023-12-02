# IMT Terraform 
- Justine Barthelme
- Matteo Ordrenneau
- Julien Reig

Seule les partie 1 et 2 ont été réalisées. La partie 3 n'a pas été réalisée.

# Partie 1: Docker

## 1.1. Lancer le projet 
1. Ce rendre dans le dossier de la partie 1:
    ```bash
    cd partie1
    ```
2. Initialiser le projet terraform:
    ```bash
    terraform init
    ```
3. Lancer le projet terraform:
    ```bash
    terraform apply
    ```

## 1.2. Acceder aux sites
- Vote : http://localhost:5000
- Resultats : http://localhost:5001

## 1.3. Lancer le projet avec les seeds 
Pour avoir des votes généré automatiquement
1. Ce rendre dans le dossier de la partie 1:
    ```bash
    cd partie1
    ```
2. Initialiser le projet terraform:
    ```bash
    terraform init
    ```
3. Lancer le projet terraform:
    ```bash
    terraform apply -var 'seed=true'
    ```

# Partie 2: Google Cloud Platform

## 1.1. Lancer le projet
1. Ce rendre dans le dossier de la partie 2:
    ```bash
    cd partie2
    ```
2. Créé un projet sur GCP et activer les services Kubernetes
3. Télécharger le fichier de configuration de votre compte de service
4. Renommer le fichier `private.auto.tfvars.example` en `private.auto.tfvars`
5. Renseigner les 2 variables
6. Il est possible de changer la région dans le fichier `terraform.tfvars`
7. Initialiser le projet
    ```bash
    terraform init
    ```
8. Lancer le projet
    ```bash
    terraform apply
    ```
9. Acceder au site via les addresses des 2 ingress créé. (Il est probable qu'il faille attendre quelques minutes après la création des ingress pour que les sites deviennent accessible)