# ODE-TO-SYSTEMATIC-PATIENCE
ΕΡΓΑΣΙΑ ΕΞΑΜΗΝΟΥ - ΜΟΥΣΙΚΗ ΠΛΗΡΟΦΟΡΙΚΗ


Δ.Π.Μ.Σ.
“ΤΕΧΝΕΣ ΚΑΙ ΤΕΧΝΟΛΟΓΙΕΣ ΤΟΥ ΗΧΟΥ”

ΕΞΑΜΗΝΟ : A!
ΜΑΘΗΜΑ : ΜΟΥΣΙΚΗ ΠΛΗΡΟΦΟΡΙΚΗ 
ΔΙΔΑΣΚΩΝ : ΙΩΑΝΝΗΣ ΖΑΝΝΟΣ


“ODE TO SYSTEMATIC PATIENCE”
ΕΡΓΑΣΙΑ ΕΞΑΜΗΝΟΥ ΤΟΥ ΦΟΙΤΗΤΗ ΤΣΑΚΥΡΙΔΗ ΔΗΜΗΤΡΙΟΥ


Στόχος ήταν η πραγματοποίηση μιας μουσικής σύνθεσης στο πρωτόγνωρο για μένα περιβάλλον του super collider, αξιοποιώντας παράλληλα κάποιες από τις λειτουργίες για την παραγωγή και τον έλεγχο του ήχου, κυρίως με τη χρήση του ποντικιού.
Η σύνθεση είναι μια διασκευή και ηχητικός πειραματισμός,  πάνω στην πασίγνωστη μελωδία του ύμνου της χαράς της 9ης συμφωνίας του L.V.Beethoven. 


ΒΗΜΑΤΑ - ΠΕΡΙΓΡΑΦΗ ΚΩΔΙΚΑ :

Α) ΣΥΝΘΕΤΗΤΕΣ
Για την παραγωγή του ήχου έγινε χρήση συνθετητών των οποίων οι κώδικες ανακτήθηκαν από την ιστοσελίδα sccode. Ακολουθεί η αναλυτική περιγραφή, καθώς και αναφορές στις όποιες αλλαγές των παραμέτρων τους :

“ \violin ” : 
 Ο συνθετητής για την κύρια μελωδία της σύνθεσης. Ο ήχος του παραπέμπει σε ήχο βιολιού.
   -  Έγιναν αλλαγές στις μεταβλητές του envelope για να ανταποκρίνεται καλύτερα στις ανάγκες της σύνθεσης.  
  - Έγινε προσθήκη του UGen “MouseX” για τον έλεγχο της στερεοφωνίας του, μέσω της οριζόντιας κίνησης του ποντικιού
  - Η έξοδος του γίνεται από το κανάλι 55 για προσθήκη εφέ  πριν τη γενική έξοδο.

“ \violin2 “  :
Αντίγραφο του παραπάνω συνθετητή ο οποίος θα παίξει σαν δεύτερο βιολί μια οκτάβα ψηλότερα.
-  Το  “ΜouseΧ” όμως είναι ρυθμισμένο για να ελέγχει τη στερεοφωνία αντίθετα. Σε συνδυασμό με αυτό, η έξοδος γίνεται μόνο από ένα κανάλι , με συνέπεια ο ήχος να ακούγεται δυνατότερα όταν μετακινούμε το ποντίκι προς τα δεξιά, και σιγανότερα (έως καθόλου) προς τα αριστερά.
-  Η έξοδος γίνεται από το κανάλι 1.

“ \sawSynth “  :
O συνθετητής που χρησιμοποιήθηκε για την αρμονική συνοδεία της μελωδίας. 
 -  Η έξοδός του γίνεται από το κανάλι 55 μαζί με τη μελωδία.
 -  Δεύτερη έξοδός του γίνεται και από το κανάλι 00, στερεοφωνικά είναι πάντα στο κέντρο , όμως  περνάει από χαμηλοδιαβατό φίλτρο το οποίο ελέγχουμε με την κάθετη κίνηση του ποντικιού  μέσω “MouseY”

“ \prophet5pwmstrings “  :
O συνθετητής για το βάσιμο της αρμονίας.
-  Έγιναν αλλαγές στα lfowidth και envelope για τη μορφοποίηση του ήχου.
-  Η έξοδος του γίνεται από το κανάλι 55 και η αντίθετη στερεοφωνία του ελέγχεται επίσης από την οριζόντια κίνηση του ποντικιού μέσω “ΜouseΧ”.


Β) ΑΚΟΛΟΥΘΙΕΣ - PBINDS
-  Όλες οι ακολουθίες αναπαριστούν νότες του δυτικού τονικού συστήματος και είναι προγραμματισμένες να παίζουν σε συνεχή επανάληψη. Ο χρήστης μπορεί να δώσει τέλος στη σύνθεση όποτε αυτός επιθυμεί.
-  Προγραμματίστηκαν αντιστοίχως οι διάρκειες και οι εντάσεις των φθόγγων.
-  Οι ακολουθίες των συνθετητών  \violin είναι όμοιες, με διαφορά μόνο στην οκτάβα τους.
-  Η ακολουθία του συνθετητή  \sawSynth παίζει συγχορδίες με ρύθμιση strum.
-  Το τέμπο του κομματιού ορίζεται στα 60 bpm . 



Γ) ΤΕΛΙΚΕΣ ΡΥΘΜΙΣΕΙΣ, ΕΞΟΔΟΙ, ΕΦΕ
-  2 Ugen FreeVerb για αντηχήσεις : Μεγάλη αντήχηση για το σολιστικό violin2,  μικρότερη για τους υπόλοιπους συνθετητές του καναλιού 55. 
-  Γενικό χαμηλοδιαβατό φίλτρο για όλους τους συνθετητές του καναλιού 55, το οποίο ελέγχεται με την κάθετη κίνηση του ποντικιού με  “MouseY”.
-  Η κάθετη κίνηση του ποντικιού επίσης επηρεάζει την ένταση του συνθετητή violin2, ο οποίος δεν περνάει από το γενικό φίλτρο. 
-  Ελάττωση της γενικής έντασης του server προς αποφυγή υπερφόρτωσης στην έξοδο.
-  Προσθήκη του αρχείου wav “JOY24” στην προσωρινή μνήμη. Πρόκειται για μια αυθεντική ηχογράφηση του ύμνου της χαράς, επεξεργασμένη για να μπορεί να επαναλαμβάνεται σε συνεχή επανάληψη, ακολουθώντας το τέμπο και την τονικότητα της εργασίας. 

- Ακολουθούν ενδεικτικά τα play controls των ακολουθιών. Μπορούμε να επιλέξουμε αυτές που θέλουμε ν ακουστούν, και να πειραματιστούμε όσο θέλουμε με τις αλλαγές στον ήχο που προκαλούν οι κινήσεις του ποντικιού. Καθώς και με το συνδυασμό του ήχου του super collider με αυτόν του φυσικού ήχου της ορχήστρας. 

Μια ενδεικτική ηχογράφηση της σύνθεσης υπάρχει στον σύνδεσμο : https://drive.google.com/file/d/1xg3ErHz84I15Qt7o9yo18Oj5TaarEeVs/view?usp=sharing
Στο ηχογραφημένο δείγμα, οι ακολουθείες ενεργοποιήθηκαν ανα 2, και στην τελευταια επαναληψη προστέθηκε και το wav με την πραγματική ορχήστρα. 




ΕΠΙΛΟΓΟΣ
Αν και το super collider είναι ένα ισχυρό εργαλείο για δημιουργία και εκτέλεση αλγοριθμικών συνθέσεων, οι δυνατότητες δε σταματούν εκεί. Με την παρούσα εργασία αξιοποίησα όσα αποκόμισα από το μάθημα, ξεχωρίζοντας παράλληλα τις λειτουργίες που θα μπορούσαν να συνδυαστούν με το υπάρχον μουσικό υπόβαθρο μου, σε ένα ενδιαφέρον ηχητικό αποτέλεσμα. 
Αυτό αποτελεί κίνητρο για μια ακόμη μεγαλύτερη εμβάθυνση και πειραματισμό στο μέλλον.  


ΠΗΓΕΣ :
 - A Gentle Introduction to SuperCollider 
by Bruno Ruviaro 
- Σημειώσεις και παραπομπές του μαθήματος του εξαμήνου
- Instructional videos του Eli Fieldsteel
- Ιστοσελίδα www.sccode.org
