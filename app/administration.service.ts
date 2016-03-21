/**
 * Created by Tony Sykes on 25-Jan-2016.
 */
import {Injectable} from 'angular2/core';
import {Http} from 'angular2/http';
import 'rxjs/add/operator/map';
import {Headers} from "angular2/http";
import {RequestOptions} from "angular2/http";

@Injectable()
export class AdministrationService {
    constructor (private _http: Http) {}

    // TODO fix this hard code up
    private urlEntityService:string = 'https://magellan.ammatech.com.au/rest/Assure_Dev/EntityService';

    getEntity(){

        let headers: Headers = new Headers();
        headers.append('Accept', 'text/json');

        let requestOptions: RequestOptions = new RequestOptions();
        requestOptions.headers = headers;

        return this._http.get(this.urlEntityService, requestOptions)
            .map(res => res.json()); //console.log(res)); //

    }

}


