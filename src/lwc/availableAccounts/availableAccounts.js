import {LightningElement, track, wire} from 'lwc';

import getAvailableAccounts from "@salesforce/apex/AvailableAccountsController.getAvailableAccounts";
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class AvailableAccounts extends LightningElement {
    accounts;
    error;
    contactRecordId;
    accountRecordId;
    isInfoShown = false;
    isContact = false;

    @wire(getAvailableAccounts)
    wireAvailableAccounts({error, data}) {
        if (data) {
            this.accounts = data;
        } else {
            this.error = error;
            this.showErrorToast();
        }
    }

    handleOnSelect(event) {
        this.isInfoShown = true;

        if (this.accounts.some(account => account.name === event.detail.name)) {
            this.isContact = false;
            this.accountRecordId = event.detail.name;
        } else {
            this.isContact = true;
            this.contactRecordId = event.detail.name;
            this.accountRecordId = this.accounts.find(wrapper => wrapper.items.find(item => item.name === this.contactRecordId)).name;
        }
    }

    showErrorToast() {
        const evt = new ShowToastEvent({
            title: 'Error',
            message: 'No records found',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
}