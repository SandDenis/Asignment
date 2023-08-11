# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

ruby 3.2.0

Create acc using {host}/users
{
    "user" : {
        "name" : "name",
        "email" : "email",
        "password" : "xxxxxx",
        "password_confirmation" : "xxxxxxx",
}
}

Login with {host}/users/sign_in
{
    "user" : {
        "email" : "email",
        "password" : "xxxxxx",
    }
}