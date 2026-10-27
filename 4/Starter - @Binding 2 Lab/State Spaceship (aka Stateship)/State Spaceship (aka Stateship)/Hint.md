# Hints

Try each step on your own first. Use these if you get stuck.

## Hint for Step 1: the ship's shared values

These belong to the whole ship, so `SpaceshipScreen` owns them:

```swift
@State var shipHeading = ""
@State var availablePower = 10
```

## Hint for Step 2: passing a binding to a station

In the child view, declare the property with no starting value:

```swift
@Binding var shipHeading: String
```

In the parent, pass it in with `$`:

```swift
HelmStation(shipHeading: $shipHeading)
```

## Hint for Step 4: the Shield stepper

The shield's own power level belongs to `ShieldStation`, so it is `@State`.
The ship's power belongs to `SpaceshipScreen`, so it is `@Binding`.

```swift
onIncrement: {
    if availablePower > 0 {
        shieldPower += 1
        availablePower -= 1
    }
}, onDecrement: {
    if shieldPower > 0 {
        shieldPower -= 1
        availablePower += 1
    }
}
```

## Hint for Step 5: the Weapons button

```swift
Button("Power Weapons Up/Down") {
    if weaponsOnline {
        weaponsOnline = false
        availablePower += 3
    } else if availablePower >= 3 {
        weaponsOnline = true
        availablePower -= 3
    }
}
```

## Hint for Step 7: disabling a station

Once `inChair` lives in the station, you can use it on any control:

```swift
.disabled(!inChair)
```
