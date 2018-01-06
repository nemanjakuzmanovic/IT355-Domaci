# IT355-Domaci

Domaći zadak je urađen po uzoru na primer iz vežbanja. 
Web portlet aplikacija koja služi za booking letova.

Prvenstveno je potrebno dodati JAVA_HOME i JRE_HOME variable path, potom skinuti pluto 3.0. Nakon toga se uđe u bin folder i pokrene
startup.bat posle čega bi trebao tomcat da se pokrene. Idemo na link http://localhost:8080/pluto/portal/ i logujemo se sa 
username: pluto
password: pluto
Sada ulazimo u pluto admin, i na dnu strane uploadujemo fajl pod nazivom booking-portlet-mvc.war i idemo na deploy.
** Pre toga smo napravili portlet aplikaciju sa hibernateom i išli na Clean and Build, nakon čega se ovaj fajl sa ekstenzijom .war
i kreirao, i možemo ga naći u folderu target. **

Sada ponovo uđemo na http://localhost:8080/pluto/portal/ ponovo se logujemo, i konačno, trebalo bi u About Apache Pluto da nam se pojavi
naš novi portlet. Pritiskom na Start your Spring Travel experience pokrećemo aplikaciju za rezervisanje karata za letove aviona.

Napomena: 
Nisam znao kako da obračunam let pa je ostala računica kao u primeru vežbi da se po danu povećava cena, dakle, što je duža razlika između
letova to je skuplje. Ali, to se jako lako ispravi, ukoliko bi znali kako se zapravo cena karata obračunava.
