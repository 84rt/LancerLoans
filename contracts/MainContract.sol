// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;
import "./LoanOffer.sol";
import "./LoanLibrary.sol";
import "./LoanContract.sol";
import "./Action.sol";
import "./SimpleCredentialsVerifier.sol";

contract MainContract is LoanContract, SimpleCredentialsVerifier, Action {
    using LoanLibrary for LoanLibrary.Borrower;
    using LoanLibrary for LoanLibrary.Offer;
    using LoanLibrary for LoanLibrary.Agreement;
    LoanOffer public loanOffer;
    
    /** Processes borrower data to verify against open loan offers requirements. Success creates loan agreement.
    * @param borrowerAddress of borrower
    * @param borrowerData data
    */
    function startMatch(address borrowerAddress, LoanLibrary.Borrower memory borrowerData) public {
        LoanLibrary.Offer[] memory allLoanOffers = loanOffer.getLoanOffers();
        require(allLoanOffers.length > 0, "No loan offers available");
        for (uint256 i = 0; i < allLoanOffers.length; i++) {
            LoanLibrary.Offer memory currentOffer = allLoanOffers[i];
            // Replace mock functions with actual checks
            if (isEnabledToBorrow(borrowerAddress, currentOffer.minAmount, currentOffer.requiredSkillBadge)) {
                LoanLibrary.Lender memory newLender = LoanLibrary.Lender({
                    requirementIds: currentOffer.requirementIds,
                    lender: currentOffer.lender
                });

                LoanLibrary.Agreement memory createdLoanAgreement = createLoanAgreement(newLender, borrowerData, currentOffer);
                borrow(borrowerAddress, currentOffer.lender, createdLoanAgreement);
            }
        }
    }
}


