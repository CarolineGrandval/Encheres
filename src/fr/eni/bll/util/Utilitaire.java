package fr.eni.bll.util;
import fr.eni.bll.UtilisateurManager;

public class Utilitaire {


    /**
     * Cette méthode vérifie que le pseudo choisi par l'utilisateur ne contient que des caractères alphanumériques
     * @param pseudo
     * @return
     */
    public Boolean pseudoValidation(String pseudo) {
        Boolean alphanum =  pseudo.matches("(\\w|-|_)+");;
        return alphanum;
    }

    /**
     * On impose des règles sur le mot de passe
     * (?=.*[0-9]) un chiffre doit apparaître au moins une fois
     * (?=.*[a-z]) une lettre minuscule doit apparaître au moins une fois
     * (?=.*[A-Z]) une lettre majuscule doit apparaître au moins une fois
     * (?=\\S+$) aucun espace n'est autorisé dans toute la chaîne
     * .{8,} au moins 8 caractères
     * @param motDePasse
     */
    public boolean passwordValidation(String motDePasse) {
        String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}";
        Boolean result =  motDePasse.matches(pattern);
        return result;
    }

    /**
     * On impose des règles sur l'email : structure a@a.a
     * @param email
     */
    public boolean emailValidation(String email) {
        String pattern = "^[a-zA-Z0-9\\p{P}]*@[a-zA-Z0-9\\p{P}]*\\.[a-zA-Z0-9\\p{P}]*$";
        Boolean result =  email.matches(pattern);
        return result;
    }

    /**
     * On impose des règles sur le numéro de téléphone : format +nombre
     * @param telephone
     */
    public boolean telValidation(String telephone) {
        String pattern = "^\\+[\\p{N}]*$";
        Boolean result =  telephone.matches(pattern);
        return result;
    }
}
