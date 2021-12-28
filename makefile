# scqzctiwgfqw is philanatoken account. This is the contract token
# najyvfjutxhg is the issuer  ( nidhal account )
# lxcycumxofee is the account i want to transfer money to ( katharina account )

# mainnet: -u https://eos.greymass.com

compile:
	eosio-cpp -abigen src/philanatoken.cpp -I include/
unlockWallet:
	cleos wallet unlock --password PW5KSvwSJejQzjSGKeTdgq8NtJtEyvrgHe4x2evD2mbiCDQa9CZB1

deployToken:
	cleos set contract philanatoken . -p philanatoken@active

deployTokenOnTestnet:
	cleos -u https://api.testnet.eos.io set contract scqzctiwgfqw . -p scqzctiwgfqw@active

createToken:
	cleos push action philanatoken create '[ "nidhal", "1000000000.0000 PHI"]' -p philanatoken@active

createTokenOnTestnet:
	cleos -u https://api.testnet.eos.io push action scqzctiwgfqw create '[ "najyvfjutxhg", "1000000000.0000 PHI"]' -p scqzctiwgfqw@active

issueToken:
	cleos push action philanatoken issue '[ "nidhal", "100.0000 PHI", "memo" ]' -p nidhal@active

issueTokenOnTestnet:
	cleos -u https://api.testnet.eos.io push action scqzctiwgfqw issue '[ "najyvfjutxhg", "100.0000 PHI", "memo" ]' -p najyvfjutxhg@active

transferToken:
	cleos push action philanatoken transfer '[ "nidhal", "katharina", "10.0000 PHI", "m" ]' -p nidhal@active

transferTokenOnTestnet:
	cleos -u https://api.testnet.eos.io push action scqzctiwgfqw transfer '[ "najyvfjutxhg", "lxcycumxofee", "10.0000 PHI", "m" ]' -p najyvfjutxhg@active

checkBalance:
	cleos get currency balance philanatoken katharina PHI

checkBalanceOnTestnet:
	cleos -u https://api.testnet.eos.io get currency balance scqzctiwgfqw najyvfjutxhg PHI