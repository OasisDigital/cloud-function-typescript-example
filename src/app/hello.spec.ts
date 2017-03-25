import { expect } from 'chai';

import { helloFn } from './hello';

describe('Hello function', () => {
  it('returns hello world', () => {
    expect(helloFn()).to.eql('hello, world, the answer is 42');
  });
});
