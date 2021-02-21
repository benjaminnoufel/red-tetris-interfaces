import {GetUser} from "./User";

export interface IRoom {
    id: number;
    name: string;
    description: string;
    password: string;
    limited_player: number;
    open: boolean;
    difficulty: string;
    created_by: number | GetUser;
    limited_time: Date;
    createdAt: Date;
    updatedAt: Date;
}

export interface ISetRoom extends Omit<IRoom, "id" | "createdAt" | "updatedAt" | "limited_time" | "created_by"> {
    limited_time: number;
    created_by: number;
}

export interface ListRoom extends IRoom, GetUser {}

export interface ICreateRoom extends Omit<IRoom, "id" | "createdAt" | "updatedAt" | "open" | "createdBy"> {}
