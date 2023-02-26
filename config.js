module.exports = {
    token: 'ghp_token',
    repositories: ['DjordyKoert/renovate-20609'],

    hostRules: [
        {
            hostType: 'gitlab',
            matchHost: 'gitlab.ysp.cloud',
            token: 'gl_token',
        }
    ],

};
