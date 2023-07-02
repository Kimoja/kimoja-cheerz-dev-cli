<tags feat/jojo4 bla fjfdez>

<jira_description>

{panel:bgColor=#deebff}
Contexte : la custo est finalisée le client veut passer au panier.
{panel}

{panel:bgColor=#e3fcef}
*En tant qu’utilisateur, je veux pouvoir être informé si j’ai oublié de personnaliser certaines parties de mon produit, notamment la pochette, afin d’avoir un produit physique de qualité .*

Lorsque l’utilisateur clic sur le panier : 

1/ les alertes standards et communes à tous les produits se déclenchent sur les prints  (pas d’impact)

* prints vides
* photos non recadrées

2/ Si sur la pochette aucun elements de personnalisation (textes, autres….) n’a été renseignés alors un message bloquant se déclenche dans une pop up, empêchant l’utilisateur de passer au panier avec le CTA “je modifie” ramenant l’utilisateur a la custo : 

[https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=663-25929&t=IpnfgpE5fTkLug8G-0|https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=663-25929&t=IpnfgpE5fTkLug8G-0|smart-link] 

trad anglais : [https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=805-23833&t=IpnfgpE5fTkLug8G-0|https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=805-23833&t=IpnfgpE5fTkLug8G-0|smart-link] 

 3/ Si la pochette à au moins 1 element de personnalisation non renseigné (texte, autre….)  alors un message non bloquant se déclenche, mais permettant quand meme à l’utilisateur de passer au panier avec :

* le CTA supplémentaire “J’AI FINI” pour passer au panier   

* le CTA “je modifie” ramenant l’utilisateur a la custo  

[https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=663-25928&t=IpnfgpE5fTkLug8G-0|https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=663-25928&t=IpnfgpE5fTkLug8G-0|smart-link] 

trad anglais : [https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=805-23832&t=IpnfgpE5fTkLug8G-0|https://www.figma.com/file/hVv5YvhAZdHC2uZ7Emo0a2/Grande-Attention-%F0%9F%92%8C?type=design&node-id=805-23832&t=IpnfgpE5fTkLug8G-0|smart-link] 

Ordonnancement des messages dans la pop up d’alerte : les message concernant la pochette (enveloppe) doivent être remontés en premier dans la hiérarchie des différents messages affichés.
{panel}

</jira_description>

<pr_title>Feat: Jojo4 bla fjfdez - EVOL-2606</pr_title>

<pr_description>

PR description

</pr_description>

</tags>

