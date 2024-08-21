// test/app.test.js
import request from 'supertest';
import {expect} from 'chai';
import app from '../app.js';

describe('GET /', () => {
  it('should return Hello World message', async () => {
    const response = await request(app)
      .get('/')
      .expect('Content-Type', /json/)
      .expect(200);

    expect(response.body).to.deep.equal({ message: 'Hello World' });
  });
});
