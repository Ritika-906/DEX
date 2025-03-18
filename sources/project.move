module MyModule::SimpleDEX {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Function to deposit tokens into the DEX.
    public fun deposit(user: &signer, amount: u64) {
        let deposit_amount = coin::withdraw<AptosCoin>(user, amount);
        coin::deposit<AptosCoin>(signer::address_of(user), deposit_amount);
    }

    /// Function to swap tokens between two users.
    public fun swap(from: &signer, to: address, amount: u64) {
        let transfer_amount = coin::withdraw<AptosCoin>(from, amount);
        coin::deposit<AptosCoin>(to, transfer_amount);
    }
}
