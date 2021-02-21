import {IPayload} from "./Error";

export interface GetUser {
    login: string;
    email: string;
    lastname: string;
    firstname: string;
}

export interface ILogin extends IPayload {
    token: string;
    user: GetUser;
}
