// Spoke Calculator based on Spoke Calculation formula found in many Wheelbuilding books.

// Angles in radians.

function spokeLengthCalculator(erd, pcd, centerToFlange, crossPattern, numberSpokes, spokeHoleDiameter) {
    const rimRadius = erd / 2;
    const flangeRadius = pcd / 2;

    const spokeLength = Math.sqrt((rimRadius ** 2) + (flangeRadius ** 2) + (centerToFlange ** 2) - (2 * rimRadius * flangeRadius * Math.cos((4 * Math.PI * crossPattern) / numberSpokes))) - ( spokeHoleDiameter / 2);

    return spokeLength;
}

console.log(spokeLengthCalculator(600, 50, 35, 2, 28, 2.6), "expect 285.9240");