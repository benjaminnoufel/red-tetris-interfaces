export interface UsersGroups {
    id: number;
    name: string;
}

export interface UsersSkills {
    id: number;
    name: string;
    level: number;
}

export interface CursusUserInfo {
    id: number;
    login: string;
    url: string;
}

export interface CursusInfo {
    id: number;
    created_at: Date;
    name: string;
    slug: string;
}

export interface CursusUsers {
    grade: string;
    level: number;
    skills: UsersSkills[];
    blackholed_at: Date | null;
    id: number;
    begin_at: Date;
    end_at: Date;
    cursus_id: number;
    has_coalition: boolean;
    user: CursusUserInfo;
    cursus: CursusInfo;
}

export interface Users {
    "id": number;
    "email": string;
    "login": string;
    "first_name": string;
    "last_name": string;
    "usual_first_name": string | null;
    "url": string;
    "phone": string;
    "displayname": string;
    "usual_full_name": string;
    "image_url": string;
    "staff?": boolean;
    "correction_point": number;
    "pool_month": string;
    "pool_year": string;
    "location": string | null;
    "wallet": number;
    "anonymize_date": Date;
    "groups": UsersGroups[];
    "cursus_users": CursusUsers[];
}
