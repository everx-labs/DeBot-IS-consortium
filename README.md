# DeBot-IS-consortium
DeBot Interface Specifications (IS) Consortium. IS a place where community defines interfaces every DeBot browser should support.

### Application Rules:

Each new interface must create a folder, which has a readme.md desciption of an interface, example of its implementaion in both Solidity and C++ placed in an "examples" sub folder.

### Interface submission proccess:

* You should create a specifications proposal, discuss it. 
* After the discussion is over and proposal is accepted you should submit examples in both Solidity and C++. 
* Only proposals with examples will be published.

### Supported browsers:

* If you implemented a DeBot browser we will be happy to list it. Please let us know.
* Your browser should clearly state interfaces which it supports (by version number as stated in this repository).


### Run examples

#### Setup

```shell
npm install --global everdev
npx everdev sol update
npx everdev tonos-cli update
npx everdev network default se
npx everdev signer default coder
npx everdev signer add giver 172af540e43a524763dd53b26a066d472a97c4de37d5498170564510608250c3
npx everdev network giver se 0:b5e9240fc2d2f1ff8cbb1d1dee7fb7cae155e5f6320e585fcc685698994a19a5 --signer giver
```

```shell
cd mkdir tmp && cd tmp
```

#### Run

Compile, deploy and run examples

**in cli-browser `everos-cli`**

```shell
src=../AddressInput/examples bash ../script/debot-run.sh
src=../AmountInput/examples bash ../script/debot-run.sh
src=../Base64/examples bash ../script/debot-run.sh
src=../ConfirmInput/examples bash ../script/debot-run.sh
src=../Hex/examples bash ../script/debot-run.sh
src=../Json/examples bash ../script/debot-run.sh
src=../Menu/examples bash ../script/debot-run.sh
src=../Network/examples bash ../script/debot-run.sh
src=../NumberInput/examples bash ../script/debot-run.sh
src=../Terminal/examples bash ../script/debot-run.sh
src=../UserInfo/examples bash ../script/debot-run.sh
```

Interface not implemented in cli-browser

**in web-browser**
```shell
src=../CountryInput/examples bash ../script/debot-run.sh 
src=../DateTimeInput/examples bash ../script/debot-run.sh
src=../EncryptionBoxInput/examples bash ../script/debot-run.sh
src=../Media/examples bash ../script/debot-run.sh
src=../QRCode/examples bash ../script/debot-run.sh
src=../Sdk/examples bash ../script/debot-run.sh
src=../SigningBoxInput/examples bash ../script/debot-run.sh
```
