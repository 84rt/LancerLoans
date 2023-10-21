// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;
import "./Action.sol";
import "./LoanLibrary.sol";

contract LoanOffer is Action {
    using LoanLibrary for LoanLibrary.Offer;

    LoanLibrary.Offer[] public loanOffers;

    function addLoanOffer(LoanLibrary.Offer memory _loanOffer) public {
        loanOffers.push(_loanOffer);
        deposit(_loanOffer.lender, _loanOffer.loanOfferAmount);
    }
    
    function removeLoanOffer() external {
        loanOffers.pop();
    }

    function getLoanOffers() external view returns (LoanLibrary.Offer[] memory){
        return loanOffers;
    }
}