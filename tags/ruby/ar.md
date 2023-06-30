<gtags ar active_record ActiveRecord>

<tags find unique sole>
 
## find_sole_by, sole
Let’s look at another example of #sole. This behaves like #first, but instead of just extracting the first result, it extracts the unique result matching said constraints.
```ruby
APIKey.where(key: key, user_id: user.id).sole
user.api_keys.find_sole_by(key: key)

# => ActiveRecord::RecordNotFound      (if no matching API Key)
# => #<APIKey ...>                     (if one API Key)
# => ActiveRecord::SoleRecordExceeded  (if more than one API Key)
```

</tags>

<tags update attibutes update_attributes>
 
## update_attributes
Updates all the attributes from the passed-in Hash and saves the record. If the object is invalid, the saving will fail and false will be returned
```ruby
@user.update_attributes(:status => 'active')
```

</tags>

<tags join association relation not null not_null>
 
## associated
checks for the presence of the association, while missing checks for the absence of an object
```ruby
@account.users.where.associated(:contact)
```

</tags>

<tags eager_load preload load includes include>
 
## Eager loading
```ruby
# Différent types d'eager_loading
# - `preload` charge les données d'association dans une requête séparée
# - `includes` charge les données d'association dans une requête séparée seulement si il y'a pas de filtres sur l'association
# - `includes` charge les données d'association dans la même requête 
# 
# /!\ Les trois peuvent avoir des performances en base différentes, et aussi un cout en terme de bande passante.
# Lien https://www.bigbinary.com/blog/preload-vs-eager-load-vs-joins-vs-includes

# Exemple de chargement de relation sur un record déjà chargé 
# /!\ Prend un tableau de record en paramètre et non pas une ActiveRecord::Relation 
# Voir https://github.com/cheerz/cheerz/blob/821c49b055121e5a982069ea5fc521f7d33791eb/app/models/orders/product_process.rb#L337
ActiveRecord::Associations::Preloader.new(records: [self.product_process], associations: %i[product subscription_article]).call

# On peut donc aussi eager_load des relations spécifiques en filtrant sur le tableau...:
product_processes = Orders::ProductProcess.where(...).to_a
subscribed_product_processes = product_processes.select { |record| record.requires_subscription? }
ActiveRecord::Associations::Preloader.new(records: subscribed_product_processes, associations: %i[subscription_article]).call

# On peut même utiliser des scopes pour rester dry !
scope :for_api, -> { eager_load(:author).preload(:variants) }
```

</tags>

<tags relation has_one one has_many many belongs_to>
 
## Relationships
Doc: https://guides.rubyonrails.org/association_basics.html

- bekongs_to: Le model à la clé étrangère
- has_one: la relation à la clé étrangère
- has_many: la relation à la clé étrangère
- has_one :through: Relation sur plusieurs niveau de profondeur
- has_many :through: Relation ManyToMany, en spécifiant le model intermédiaire
- has_and_belongs_to_many: Relation ManyToMany, sans spécifier le model intermédiaire (magie !)
```ruby
# has_many :through 
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments # Relation NtoN, via through
end

# has_and_belongs_to_many, via la table intermédiaire assemblies_parts 
class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end
```

</tags>

<tags relation polymorphic polymorphisme>
 
## Polymorphic
```ruby
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true 
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable # On indique ici quel colonne permet de lié employee
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable  # On indique ici quel colonne permet de lié pictures
end
```

</tags>

<tags relation config dependent inverse_of>
 
## Config relationship
```ruby
 has_one :credit_product, # Le nom de la relation 
    foreign_key: :credit_product_id, # Défini le nom de la clé étrangère si la convention ne le permet pas
    # Permet de définir la relation inverse du model, pour éviter que rails ne charge la relation, ex: model.relation.model (relation.model ne sera pas rechargé)
    # A spécifier desur des relations :through ou que la convention de naming est pas respecté/able
    inverse_of: :credit_product, 
    # Si la convention de naming peut pas être respécté, ex: belongs_to :author, class_name: "Patron"
    class_name: "Orders::SubscriptionTemplate",
    # Contrôle ce qui arrive à l'objet associé lorsque son propriétaire est détruit, voir https://guides.rubyonrails.org/association_basics.html#options-for-has-one-dependent
    dependent: :restrict_with_exception
```

</tags>

<tags enum>
 
## Enum
Créé des méthodes du noms des valeurs énumérés, en base les valeurs sont les entiers dans l'ex (peut être des strings ou autres)

```ruby
enum status: { active: 0, archived: 1 }

conversation.active! # passe le status à 0 en base
conversation.active? # => true
conversation.status  # => "active"
conversation.archived! # passe le status à 1 en base
```

</tags>

<tags validation validates validate valid>
 
## Validations
https://guides.rubyonrails.org/active_record_validations.html#inclusion
```ruby
validates :typology,
    inclusion: { in: ["subscription"], message: "must be subscription with subscription_template_id" }, # Enum de valeurs possible et msg erreurs associé
    if: -> { subscription_template_id.present? } # seulement appliqué si true
```

</tags>