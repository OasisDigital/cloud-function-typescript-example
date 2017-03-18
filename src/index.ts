import { Request, Response } from 'express';

import { helloFn } from './app/hello';

export function hello(req: Request, res: Response) {
    try {
        const result = helloFn();
        res.status(200);
        res.send(result);
    } catch (err) {
        res.status(500);
        res.send(err);
    }
};
