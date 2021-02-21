import {MutableRefObject} from "react";

export type ForwardRef<T> = ((instance: T | null) => void) | MutableRefObject<T | null> | null;
