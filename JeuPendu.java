package classes;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JeuPendu {
    private String motSecret;
    private char[] motActuel;
    private List<Character> lettresProposees;
    private int essaisRestants;

    private static String[] mots = {"PENDU", "JAVA", "ELEPHANT", "ORDINATEUR", "PROGRAMME", "INTERNET", "BANANE", "TOMATE", "VOITURE", "MONTAGNE"};

    public JeuPendu() {
        Random rand = new Random();
        motSecret = mots[rand.nextInt(mots.length)];
        motActuel = new char[motSecret.length()];
        for (int i = 0; i < motActuel.length; i++) {
            motActuel[i] = '_';
        }
        lettresProposees = new ArrayList<>();
        essaisRestants = 6;
    }

    public String getMotActuel() {
        return new String(motActuel);
    }

    public List<Character> getLettresProposees() {
        return lettresProposees;
    }

    public int getEssaisRestants() {
        return essaisRestants;
    }

    public boolean estGagne() {
        return motSecret.equals(new String(motActuel));
    }

    public boolean estPerdu() {
        return essaisRestants <= 0;
    }

    public void proposerLettre(char lettre) {
        lettre = Character.toUpperCase(lettre);
        if (lettresProposees.contains(lettre)) return;

        lettresProposees.add(lettre);

        boolean trouve = false;
        for (int i = 0; i < motSecret.length(); i++) {
            if (motSecret.charAt(i) == lettre) {
                motActuel[i] = lettre;
                trouve = true;
            }
        }

        if (!trouve) {
            essaisRestants--;
        }
    }
}
