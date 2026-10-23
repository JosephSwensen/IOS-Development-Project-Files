/*:
## Exercise - Fake Types

 Code that talks to a server is slow to work with, and its answer changes every time. A fake type conforms to the same protocol as the real one, but it returns a value you choose. Developers swap a fake in while they build, so they aren't calling a real server on every run.
 */


protocol ExchangeRateService {
    func dollarsPerEuro() -> Double
}

struct LiveExchangeRateService: ExchangeRateService {
    func dollarsPerEuro() -> Double {
        print("Calling the bank's server...")
        return Double.random(in: 1.05...1.15)
    }
}

struct PriceConverter {
    let rateService: ExchangeRateService

    func euroPriceText(forDollars dollars: Double) -> String {
        let euros = dollars / rateService.dollarsPerEuro()
        return "€\(Int(euros))"
    }
}

let liveConverter = PriceConverter(rateService: LiveExchangeRateService())
print(liveConverter.euroPriceText(forDollars: 50))


//:  Write a struct called `FakeExchangeRateService` that conforms to `ExchangeRateService`. Give it a property called `rateToReturn` of type `Double`, and have `dollarsPerEuro()` return it.
struct FakeExchangeRateService: ExchangeRateService {
    let rateToReturn: Double

    func dollarsPerEuro() -> Double {
        return rateToReturn
    }
}





//:  You're working on how prices look, and you don't want to call the bank on every run. Create a constant called `workingConverter` that is a `PriceConverter` using a `FakeExchangeRateService` with a `rateToReturn` of `2.0`. Before you run it, write in a comment what `euroPriceText(forDollars: 10)` will return. Then print it and check your prediction.


// Prediction: €5 because 10 / 2.0 is 5.
let workingConverter = PriceConverter(rateService: FakeExchangeRateService(rateToReturn: 2.0))
print(workingConverter.euroPriceText(forDollars: 10))


//:  Using fakes, print the euro price for $100 at a rate of `4.0`, and for $9 at a rate of `2.0`. Predict each one in a comment first.


// $100 at 4: €25
// $9 at 2: €4
let fourDollarConverter = PriceConverter(rateService: FakeExchangeRateService(rateToReturn: 4.0))
print(fourDollarConverter.euroPriceText(forDollars: 100))
print(workingConverter.euroPriceText(forDollars: 9))


//:  $9 at a rate of `2.0` is 4.5 euros. In a comment, explain why the price text doesn't show "€4.5". (Hint: look at what `euroPriceText(forDollars:)` does with `euros` before it builds the text.)


// Answer: Int(euros) converts 4.5 to 4 before the price string is created.


/*:
 [Previous](@previous)  |  page 7 of 8  |  [Next: App Exercise - Building With a Fake Sensor](@next)
 */
