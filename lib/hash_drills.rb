def shopping_list
{
    :sweets => ["soda", "candy", "potato chips"],
    :protein => {
        :meat => ["chicken", "fish", "steak"],
        :other => ["eggs", "nuts","beans"]
    },
    :dairy => ["milk", "yogurt", "cheese"],
    :fruits => ["bananas", "oranges", "apples", "grapes"],
    :vegetables => ["cabbage", "broccoli", "tomatoes", "carrots"],
    :grains => ["crackers", "rice", "bread", "pasta", "cereal"]
}
end

# Write methods and implementation here based on README instructions and tests

def vegetarian_ingredients
    vegie_hash = shopping_list
    vegie_hash[:protein].delete(:meat)
    vegie_hash[:protein][:other].shift
    vegie_hash
end

def ketogenic_ingredients
    keto_hash = shopping_list
    keto_hash[:dairy].delete("milk")
    keto_hash[:dairy].delete("yogurt")
    keto_hash.reject! {|k, v| [:sweets, :fruits, :grains].include? k}
    keto_hash
end

def mediterranean_ingredients
    med_hash  = shopping_list
    med_hash[:protein][:meat].reverse!.shift
    med_hash[:protein][:other] = "nuts"
    med_hash[:dairy].shift
    med_hash.reject! {|k,v| [:sweets].include? k}
    med_hash
end

def vegan_ingredients
    vegetarian_ingredients.reject {|k,v| [:dairy].include? k}
end

def remove_allergens(hash)
    allergens_free_hash = hash
    allergens_free_hash[:protein][:other] = "beans"
    allergens_free_hash
end