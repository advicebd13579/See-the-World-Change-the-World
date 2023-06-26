// Main file 
fn main() {
    println!("Let's See the World!");
    let continents = vec!["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America", "South America"];
    get_countries(continents);
}

// Get countries
fn get_countries(continents: &[&str]) {
    for continent in continents {
        match continent {
            "Africa" => {
                let countries: &[&str] = &["Algeria", "Angola", "Benin", "Botswana", "Burkina Faso"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "Antarctica" => {
                let countries: &[&str] = &["Argentina", "Australia", "Britain", "Chile"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "Asia" => {
                let countries: &[&str] = &["Afghanistan", "Bahrain", "China", "India", "Japan"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "Australia" => {
                let countries: &[&str] = &["Australia", "Fiji", "New Zealand", "Papua New Guinea"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "Europe" => {
                let countries: &[&str] = &["Austria", "Belgium", "France", "Germany", "Greece"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "North America" => {
                let countries: &[&str] = &["Canada", "Costa Rica", "Mexico", "United States"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            "South America" => {
                let countries: &[&str] = &["Argentina", "Bolivia", "Brazil", "Chile", "Colombia"];
                for country in countries { println!("{} - {}", continent, country); }
            }
            _ => continue
        }
    }
}