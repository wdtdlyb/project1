import {api, LightningElement} from 'lwc';

export default class AvailableAccountsSummary extends LightningElement {
    @api isContact;

    _accountId
    @api
    set accountId(value) {
        this._accountId = value;
    }
    get accountId() {
        return this._accountId;
    }

    _contactId
    @api
    set contactId(value) {
        this._contactId = value;
    }
    get contactId() {
        return this._contactId;
    }
}