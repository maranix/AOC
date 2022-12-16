fn main() {
    let mut groups: Vec<usize> = include_str!("day1.prod")
        .split("\n\n")
        .map(|g| {
            return g.lines().flat_map(str::parse::<usize>).sum();
        })
        .collect();

    groups.sort_by(|a, b| b.cmp(a));

    let max = groups.first().unwrap();
    let top_three: usize = groups.iter().take(3).sum();

    println!("{:?}", max);
    println!("{:?}", top_three);
}
