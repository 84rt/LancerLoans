// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

library LoanLibrary {
   struct Lender {
        uint64[] requirementIds; //to be mapped research connection
        address lender; // Vault Address create vault
    }

    struct Borrower {
        bool requirementsMet; //result of the validation query as parameter
        address borrower;
    }

    struct Agreement {
        address lenderAddress; //ok address vault
        address borrowerAddress; //ok same as back
        uint256 currentRepaymentAmount; // borrow + interests
        uint256 principalBorrowAmount; //borrow amount
        uint256 interestRate; // ok
        uint256 repayByTimestamp; // due date
        uint256 createdDate; // date of tx
        Lender lenderData; // ??
        Borrower borrowerData; // ??
    }

    struct Offer {
        uint64[] requirementIds;
        uint256 loanOfferAmount;
        uint256 interestRate;
        address lender;
    }
}