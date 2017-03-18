import { Request, Response } from 'express';

import { hello } from './index';

// These fakes are a long way from semantically or mechanically meeting the same
// interface as the express request and response, so we just force them with a
// typecast for a quick run harness.

// I think there is better testing machinery available that produces the correct
// types also to avoid this.

const fakeReq = <Request>{};

const fakeResponse = <Response>{
  send: (x: string) => console.log('output', x),
  status: (x: number) => console.log('status', x)
};

hello(fakeReq, fakeResponse);
