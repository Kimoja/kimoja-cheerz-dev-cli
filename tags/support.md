<gtags support> 

<tags anonymize anonyme suppression compte>

 ## Anonymiser/supprimer un compte
```ruby
# Deux solutions

# La première, en monkey patchant le service d'anonymisation
# Sur la prod cheerz
user = User.find_by(email: "nynoush@hotmail.fr")

module Gdpr
    module Anonymize
    extend self
        def perform(user)
            Gdpr::AnonymizeCheerzJob.perform_later(user.id)
            EmarsysAPI::DeleteUsersJob.perform_later([user.id])
            BatchAPI::DeleteUsersJob.perform_later([user.id])
            Gdpr::DeleteUserPhotosJob.perform_later(user.id)
            Gdpr::Konnektor::AnonymizeUserJob.perform_later(user.id, user.email)
            { accepted: true, orders_not_delivered: [] }
        end
    end
end
Gdpr::Anonymize.perform(user)

# La deuxième, fixer le problème de commande non délivré sur Konnektor
# Sur cheerz prod, récupérer la/les commmandes non délivrée
user = User.find_by(email: "nynoush@hotmail.fr")
undelivered_orders = user.paid_orders.filter { |paid_order| !Orders::ValidatorService.delivered?(paid_order) }.pluck(:number)

# Sur konnktor prod, création des DeliveryEvent manquant
order = order = Order["Number"]
OrderStatusService.new(order).send(:"valid_packages").map do |package| 
  next if (package.delivery_events.pluck(:tag) & DeliveryEvent::DELIVERED).any?)
  package.delivery_events.create!(
    source: package.printer_tag,
    tag: :package_delivered,
    happened_at: package.package_batch.closed_at,
    message: "Manual fix",
  )
end
```

</tags>

<tags payout paiement>

 ## Problème calcule paiement
https://cheerz0.atlassian.net/wiki/spaces/TECH/pages/1772257330/Support+Cheerz+Gestion+des+commandes+en+erreur+order+with+problems

En date du 6 fev 2022, il reste un problème de calcul des montants d’orders dans cheerz. Nous avons pas encore trouvé l’origin du problème. Il faut donc, dans cas refaire les calcule à la mano. Voici un petit script qui fait le job. vous pouvez lancer ce script. Cela permettra de débloquer la commande le temps que nous reprenions les recherches.
```ruby
def fix_payment(orders)
  orders.each do |order|
    unless order.valid_total?
      total_cents = order.successful_transaction.payment.amount.cents
        order.update(
          total_cents: total_cents,
          shipping_total_cents: total_cents - (order.product_processes.sum(:total_cents) + order.promo_total_cents)
          )
    end
      OrderExporterService.send_to_print(order.id, force_export: true)
      OrderExporterService.send_email(order.id)
  rescue
  end
end

fix_payment(Order.with_problem);
```

</tags>

<tags generic>

 ## Problème générique
```ruby

def fix_orders_with_problems(orders)
  orders.each do |order|
    begin
      OrderExporterService.send_to_print(order.id, force_export: true)
      OrderExporterService.send_email(order.id)
      puts "Exported order: #{order.id}"
    rescue => e
      puts e.message
      puts e.backtrace
      puts "Error order: #{order.id}"
    end
  end
end

fix_orders_with_problems(Order.with_problem)


["Make a Wish Photo Album ",
 "Make a Wish Photo Album ",
 "Wall-hanging calendar - A4 portrait",
 "Photo Album 2022",
 "Make a Wish Photo Album ",
 "Make a Wish Photo Album ",
 "Make a Wish Photo Album ",
 "Make a Wish Photo Album ",
 "Landscape calendar - A4 landscape",
 "Landscape calendar - A4 landscape",
 "Gift card",
 "Gift card",
 "Square 10x10cm",
 "Gift card",
 "Gift card",
 "Baby Memory Box",
 "Square 10x10cm"]


 ppr = user.product_processes.select { |po| po.product&.name == "Baby Memory Box" }

sc = ppr.subscription_codes.first
subscription_code = ::Orders::SubscriptionCode.find_by!(code: sc.code) 

ps = ::Orders::ProductSubscription.find_by(user: user)
```

</tags>

</gtags>