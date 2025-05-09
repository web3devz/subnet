// SPDX-License-Identifier: MIT

/**

Developed and Deployed By:

███╗   ██╗███████╗████████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ███╗   ███╗ █████╗ ██╗  ██╗███████╗██████╗     ██████╗ ██████╗ ███╗   ███╗
████╗  ██║██╔════╝╚══██╔══╝██║ ██╔╝██║█S███╗  ██║██╔════╝ ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝██╔══██╗   ██╔════╝██╔═══██╗████╗ ████║
██╔██╗ ██║█████╗     ██║   █████╔╝ ██║██╔██╗ ██║██║  ███╗██╔████╔██║███████║█████╔╝ █████╗  ██████╔╝   ██║     ██║   ██║██╔████╔██║
██║╚██╗██║██╔══╝     ██║   ██╔═██╗ ██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗   ██║     ██║   ██║██║╚██╔╝██║
██║ ╚████║██║        ██║   ██║  ██╗██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗██║  ██║██╗╚██████╗╚██████╔╝██║ ╚═╝ ██║
╚═╝  ╚═══╝╚═╝        ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝

For more information visit us on : https://www.nftkingmaker.com/


                                                                                                                                   */
                                                                                                                                   
pragma solidity ^0.8.2;

import "@openzeppelin/[email protected]/token/ERC20/ERC20.sol";
import "@openzeppelin/[email protected]/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/[email protected]/security/Pausable.sol";
import "@openzeppelin/[email protected]/access/Ownable.sol";
import "@openzeppelin/[email protected]/token/ERC20/extensions/draft-ERC20Permit.sol";

interface sotmcontract{
    
    function balanceOf(address owner) external view returns (uint256 balance);
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

}




contract Ammo is ERC20, ERC20Burnable, Pausable, Ownable, ERC20Permit {
    constructor() ERC20("Ammo", "AMMO") ERC20Permit("AMMO") {
                   
 }

mapping (address => uint) public arr;


    
    //this function sets a value to a specific address
    //the data is saved to myMap on the block chain 
    function set1() internal {
        // Update the value at this address
        arr[msg.sender] = block.timestamp;
    }

    function remove() internal  {
    delete arr[msg.sender];
    
    }

    //this function gets a value from a specific address in the map
    //If a value was not set the function will return the default value of 0.
    function get1() internal view returns (uint) {
        return arr[msg.sender];
    }
    
    mapping (address => bool) public arr1;


    
    //this function sets a value to a specific address
    //the data is saved to myMap on the block chain 
    function set() internal {
        // Update the value at this address
        arr1[msg.sender] = true;
    }
    
    function remove1() internal {
    delete arr1[msg.sender];
    
    }
    
        function timenow() public view returns(uint) {
        return block.timestamp;
} 
    
    //this function gets a value from a specific address in the map
    //If a value was not set the function will return the default value of 0.
    function get() internal view returns (bool) {
        return arr1[msg.sender];
    }
    uint256 mintprice= 0.06 ether;

    address www= 0xE7191C896d59A9c39965E16C5184c44172Ec9CF9;
    bool public rewardisActive = true;
    bool private purchaseactive = false;
    sotmcontract sotm= sotmcontract(www);
    mapping (uint256 => uint256) public tokenid;
    uint256 start=block.timestamp+86400;
    uint256 public rewardyoucanclaim;
    uint constant multiplier = 10**18;


mapping (uint256 => bool) public dotokenexist;


    
    //this function sets a value to a specific address
    //the data is saved to myMap on the block chain 
    function settoken(uint idd1) internal {
        // Update the value at this address
        dotokenexist[idd1] = true;
    }
    
    function removetoken(uint idd2) internal {
    delete dotokenexist[idd2];
    
    }
    
    //this function gets a value from a specific address in the map
    //If a value was not set the function will return the default value of 0.
    function gettoken(uint idd3) public view returns (bool) {
        return dotokenexist[idd3];
    }
    
    mapping (uint => uint) public dotokenexist1;


    
    //this function sets a value to a specific address
    //the data is saved to myMap on the block chain 
    function settokentime(uint idd4) internal {
        // Update the value at this address
        dotokenexist1[idd4] = block.timestamp;
    }
    
    function removetokentime(uint idd5) internal {
    delete dotokenexist1[idd5];
    
    }
    
    //this function gets a value from a specific address in the map
    //If a value was not set the function will return the default value of 0.
    function gettokentime(uint idd6) public view returns (uint) {
        return dotokenexist1[idd6];
    }
    



 
  
   function setsotmcontractaddr(address sotmcontractaddr) public {
    www = sotmcontractaddr;
 }
 
 function setRarity(uint256[] memory rarity, uint256 start1) public onlyOwner {
        for (uint256 i = 0; i < rarity.length ; i++){
            tokenid[rarity[i]] = i+start1;
    }}


    function contains(uint256 _tokenid) internal view returns (uint256){
        return tokenid[_tokenid];
    }
 
// Declaring state variable  

      
// Function to add data 
// in dynamic array






     function ActivateRewards() public onlyOwner {
        rewardisActive = !rewardisActive;
        start=block.timestamp+86400;
    }
    
    function setmintprice(uint256 _mintprice) public onlyOwner {
        mintprice = _mintprice;
    }
    
  
    
    
    function ActiatePurchase() external onlyOwner {
        purchaseactive = !purchaseactive;
    } 
    
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
    
  
     
    function SOTMBALANCeE() internal view returns (uint256 balance){
        return balance = sotm.balanceOf(msg.sender);
        
    }
    
    
  
    
     function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b - 1) / b can overflow on addition, so we distribute.
        return a / b + (a % b == 0 ? 0 : 1);}
        
        
        
        function claimablereward(address _address) external view returns (uint256){
         uint256 size= sotm.balanceOf(_address);
                 uint256 rewardclaim;

          for (uint256 i=0;i<size; i++)
          {
              
         uint256 currentids= sotm.tokenOfOwnerByIndex(_address, i);
         uint256 currentidsrari=getrarity(currentids);
         bool a= gettoken(currentids);

         
         if (a==true){
            uint256 lasttime=  gettokentime(currentids);
            uint256 unclaimeddays= block.timestamp-lasttime;
            unclaimeddays= unclaimeddays / 86400;
                                   if(unclaimeddays>0){

                         if (currentidsrari==0){
                                unclaimeddays= unclaimeddays*20;
                            rewardclaim = rewardclaim + unclaimeddays;
                                
                                
                        }

         
                         if (currentidsrari<=49 && currentidsrari>0){
                                unclaimeddays= unclaimeddays*38;
                            rewardclaim = rewardclaim + unclaimeddays;
                                
                                
                        }
                         if (currentidsrari<=250 && currentidsrari>=50){
                                unclaimeddays= unclaimeddays*30;
                            rewardclaim = rewardclaim + unclaimeddays;
                        }
                         if (currentidsrari<=750 && currentidsrari>=251){
                            unclaimeddays= unclaimeddays*25;
                            rewardclaim = rewardclaim + unclaimeddays;
                        }  
                         if (currentidsrari<=1500 && currentidsrari>=751){
                            unclaimeddays= unclaimeddays*21;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=2500 && currentidsrari>=1501){
                            unclaimeddays= unclaimeddays*18;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=3500 && currentidsrari>=2501){
                            unclaimeddays= unclaimeddays*15;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=5000 && currentidsrari>=3501){
                                unclaimeddays= unclaimeddays*12;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }
                         if (currentidsrari<=6500 && currentidsrari>=5001){
                            unclaimeddays= unclaimeddays*11;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }
                         if (currentidsrari<=7499 && currentidsrari>=6501){
                            unclaimeddays= unclaimeddays*10;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }}
                        }
            else {
                uint256 unclaimeddays= block.timestamp-start;
                unclaimeddays= unclaimeddays/86400;
                 if (currentidsrari==0){
                                unclaimeddays= unclaimeddays*20;
                            rewardclaim = rewardclaim + unclaimeddays;
                                
                                
                        }
               if (currentidsrari<=49 && currentidsrari>0){
                                unclaimeddays= unclaimeddays*38;
                            rewardclaim = rewardclaim + unclaimeddays;
                                
                        }
                         if (currentidsrari<=250 && currentidsrari>=50){
                                unclaimeddays= unclaimeddays*30;
                            rewardclaim = rewardclaim + unclaimeddays;
                        }
                         if (currentidsrari<=750 && currentidsrari>=251){
                            unclaimeddays= unclaimeddays*25;
                            rewardclaim = rewardclaim + unclaimeddays;
                        }  
                         if (currentidsrari<=1500 && currentidsrari>=751){
                            unclaimeddays= unclaimeddays*21;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=2500 && currentidsrari>=1501){
                            unclaimeddays= unclaimeddays*18;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=3500 && currentidsrari>=2501){
                            unclaimeddays= unclaimeddays*15;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }  
                         if (currentidsrari<=5000 && currentidsrari>=3501){
                                unclaimeddays= unclaimeddays*12;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }
                         if (currentidsrari<=6500 && currentidsrari>=5001){
                            unclaimeddays= unclaimeddays*11;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }
                         if (currentidsrari<=7499 && currentidsrari>=6501){
                            unclaimeddays= unclaimeddays*10;
                            rewardclaim = rewardclaim + unclaimeddays;
                             
                         }
                        
            
          
    }
                    return  rewardclaim;
    }
    }

    function SOTMTOKENBYINDEXe(address _address) internal {
         uint size= SOTMBALANCeE();
          for (uint256 i=0;i<size; i++)
          {
              
         uint256 currentids= sotm.tokenOfOwnerByIndex(_address, i);
         uint256 currentidsrari=getrarity(currentids);
         bool a= gettoken(currentids);
         
         if (a==true){
            uint256 lasttime=  gettokentime(currentids);
            uint256 unclaimeddays= block.timestamp-lasttime;
            unclaimeddays= unclaimeddays / 86400;
                                   if(unclaimeddays>0){

                                        if (currentidsrari==0){
                                unclaimeddays= unclaimeddays*20;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;
                                
                                
                        }

         
                         if (currentidsrari<=49 && currentidsrari>0){
                                unclaimeddays= unclaimeddays*38;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;
                                
                                
                        }
                         if (currentidsrari<=250 && currentidsrari>=50){
                                unclaimeddays= unclaimeddays*30;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;                        
                        }
                         if (currentidsrari<=750 && currentidsrari>=251){
                            unclaimeddays= unclaimeddays*25;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;                            
                        }  
                         if (currentidsrari<=1500 && currentidsrari>=751){
                            unclaimeddays= unclaimeddays*21;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=2500 && currentidsrari>=1501){
                            unclaimeddays= unclaimeddays*18;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=3500 && currentidsrari>=2501){
                            unclaimeddays= unclaimeddays*15;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=5000 && currentidsrari>=3501){
                                unclaimeddays= unclaimeddays*12;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }
                         if (currentidsrari<=6500 && currentidsrari>=5001){
                            unclaimeddays= unclaimeddays*11;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }
                         if (currentidsrari<=7499 && currentidsrari>=6501){
                            unclaimeddays= unclaimeddays*10;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }}
                            removetoken(currentids);
                            removetokentime(currentids);
                            settoken(currentids);
                            settokentime(currentids);
                        }
            else {
                uint256 unclaimeddays= block.timestamp-start;
                unclaimeddays= unclaimeddays/86400;
                 if (currentidsrari==0){
                                unclaimeddays= unclaimeddays*20;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;
                                
                                
                        }
               if (currentidsrari<=49 && currentidsrari>0){
                                unclaimeddays= unclaimeddays*38;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;
                                
                                
                        }
                         if (currentidsrari<=250 && currentidsrari>=50){
                                unclaimeddays= unclaimeddays*30;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;                        
                        }
                         if (currentidsrari<=750 && currentidsrari>=251){
                            unclaimeddays= unclaimeddays*25;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;                            
                        }  
                         if (currentidsrari<=1500 && currentidsrari>=751){
                            unclaimeddays= unclaimeddays*21;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=2500 && currentidsrari>=1501){
                            unclaimeddays= unclaimeddays*18;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=3500 && currentidsrari>=2501){
                            unclaimeddays= unclaimeddays*15;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }  
                         if (currentidsrari<=5000 && currentidsrari>=3501){
                                unclaimeddays= unclaimeddays*12;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }
                         if (currentidsrari<=6500 && currentidsrari>=5001){
                            unclaimeddays= unclaimeddays*11;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }
                         if (currentidsrari<=7499 && currentidsrari>=6501){
                            unclaimeddays= unclaimeddays*10;
                            rewardyoucanclaim = rewardyoucanclaim + unclaimeddays;   
                             
                         }
            
                            
                            settoken(currentids);
                            settokentime(currentids);
                            
                        
            
          
    }
    }
    }
      function SOTMBALANCE(address _account) external view returns (uint256 balance){
        return balance = sotm.balanceOf(_account);
    }
    
    function getrarity(uint256 idtoken) internal view returns (uint256 rari){
        return rari = tokenid[idtoken] ;
    }


    function SOTMTOKENBYINDEX(uint256 index, address _account) external view returns (uint256 tokenId){
         uint256   tokeniid= sotm.tokenOfOwnerByIndex(_account, index);
                
        return  tokenId= tokenid[tokeniid];
    }
    





    
    function claimreward(address _adddress) public  {
        require(SOTMBALANCeE() != 0, 'NO SOTM FOUND');
        require (rewardisActive== true, "Rewards are paused");
        {
            bool a= get();
            SOTMTOKENBYINDEXe(_adddress);
            if (a == true)
            {
              uint256 lasttime=  get1();
              lasttime= lasttime+86400;
              require (lasttime<= block.timestamp, "Already Claimed");{
                  rewardyoucanclaim = rewardyoucanclaim*1000000000000000000;
                uint256 amount= rewardyoucanclaim;
                    remove1();
                    remove();
                    set();
                    set1();
                    rewardyoucanclaim=0;
                    _mint(_adddress, amount );
                    }

              }
              else {
             bool a1= get();
                require (a1==false, "Already claimed");
{                    
                    rewardyoucanclaim = rewardyoucanclaim*1000000000000000000;
                      uint256 amount= rewardyoucanclaim;
                    set();
                    set1();
                    rewardyoucanclaim=0;
                    require(amount>0, "You can't claim right now");

                    _mint(_adddress, amount );
                }}
                                        



    }
    }

    

            
  
    function buy(uint256 numberOfTokens) public payable {
        require(purchaseactive== true, "Purchase is not active");
        require(mintprice*numberOfTokens>=msg.value, "Incorrect value sent");
        {
            numberOfTokens= numberOfTokens*multiplier;
        
        _mint(msg.sender, numberOfTokens);
    }
    }

    function withdrawAll() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
    
    function mint(address to, uint256 amount) public onlyOwner {
        amount=amount*multiplier;
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./draft-IERC20Permit.sol";
import "../ERC20.sol";
import "../../../utils/cryptography/draft-EIP712.sol";
import "../../../utils/cryptography/ECDSA.sol";
import "../../../utils/Counters.sol";

/**
 * @dev Implementation of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on `{IERC20-approve}`, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 *
 * _Available since v3.4._
 */
abstract contract ERC20Permit is ERC20, IERC20Permit, EIP712 {
    using Counters for Counters.Counter;

    mapping(address => Counters.Counter) private _nonces;

    // solhint-disable-next-line var-name-mixedcase
    bytes32 private immutable _PERMIT_TYPEHASH =
        keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

    /**
     * @dev Initializes the {EIP712} domain separator using the `name` parameter, and setting `version` to `"1"`.
     *
     * It's a good idea to use the same `name` that is defined as the ERC20 token name.
     */
    constructor(string memory name) EIP712(name, "1") {}

    /**
     * @dev See {IERC20Permit-permit}.
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public virtual override {
        require(block.timestamp <= deadline, "ERC20Permit: expired deadline");

        bytes32 structHash = keccak256(abi.encode(_PERMIT_TYPEHASH, owner, spender, value, _useNonce(owner), deadline));

        bytes32 hash = _hashTypedDataV4(structHash);

        address signer = ECDSA.recover(hash, v, r, s);
        require(signer == owner, "ERC20Permit: invalid signature");

        _approve(owner, spender, value);
    }

    /**
     * @dev See {IERC20Permit-nonces}.
     */
    function nonces(address owner) public view virtual override returns (uint256) {
        return _nonces[owner].current();
    }

    /**
     * @dev See {IERC20Permit-DOMAIN_SEPARATOR}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view override returns (bytes32) {
        return _domainSeparatorV4();
    }

    /**
     * @dev "Consume a nonce": return the current value and increment.
     *
     * _Available since v4.1._
     */
    function _useNonce(address owner) internal virtual returns (uint256 current) {
        Counters.Counter storage nonce = _nonces[owner];
        current = nonce.current();
        nonce.increment();
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/Context.sol";

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/Context.sol";

/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
abstract contract Pausable is Context {
    /**
     * @dev Emitted when the pause is triggered by `account`.
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    constructor() {
        _paused = false;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        require(!paused(), "Pausable: paused");
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        require(paused(), "Pausable: not paused");
        _;
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../ERC20.sol";
import "../../../utils/Context.sol";

/**
 * @dev Extension of {ERC20} that allows token holders to destroy both their own
 * tokens and those that they have an allowance for, in a way that can be
 * recognized off-chain (via event analysis).
 */
abstract contract ERC20Burnable is Context, ERC20 {
    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     * See {ERC20-_burn} and {ERC20-allowance}.
     *
     * Requirements:
     *
     * - the caller must have allowance for ``accounts``'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) public virtual {
        uint256 currentAllowance = allowance(account, _msgSender());
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        unchecked {
            _approve(account, _msgSender(), currentAllowance - amount);
        }
        _burn(account, amount);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./extensions/IERC20Metadata.sol";
import "../../utils/Context.sol";

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);

        _afterTokenTransfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Counters
 * @author Matt Condon (@shrugs)
 * @dev Provides counters that can only be incremented, decremented or reset. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 *
 * Include with `using Counters for Counters.Counter;`
 */
library Counters {
    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        unchecked {
            counter._value += 1;
        }
    }

    function decrement(Counter storage counter) internal {
        uint256 value = counter._value;
        require(value > 0, "Counter: decrement overflow");
        unchecked {
            counter._value = value - 1;
        }
    }

    function reset(Counter storage counter) internal {
        counter._value = 0;
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Elliptic Curve Digital Signature Algorithm (ECDSA) operations.
 *
 * These functions can be used to verify that a message was signed by the holder
 * of the private keys of a given address.
 */
library ECDSA {
    enum RecoverError {
        NoError,
        InvalidSignature,
        InvalidSignatureLength,
        InvalidSignatureS,
        InvalidSignatureV
    }

    function _throwError(RecoverError error) private pure {
        if (error == RecoverError.NoError) {
            return; // no error: do nothing
        } else if (error == RecoverError.InvalidSignature) {
            revert("ECDSA: invalid signature");
        } else if (error == RecoverError.InvalidSignatureLength) {
            revert("ECDSA: invalid signature length");
        } else if (error == RecoverError.InvalidSignatureS) {
            revert("ECDSA: invalid signature 's' value");
        } else if (error == RecoverError.InvalidSignatureV) {
            revert("ECDSA: invalid signature 'v' value");
        }
    }

    /**
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature` or error string. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {toEthSignedMessageHash} on it.
     *
     * Documentation for signature generation:
     * - with https://web3js.readthedocs.io/en/v1.3.4/web3-eth-accounts.html#sign[Web3.js]
     * - with https://docs.ethers.io/v5/api/signer/#Signer-signMessage[ethers]
     *
     * _Available since v4.3._
     */
    function tryRecover(bytes32 hash, bytes memory signature) internal pure returns (address, RecoverError) {
        // Check the signature length
        // - case 65: r,s,v signature (standard)
        // - case 64: r,vs signature (cf https://eips.ethereum.org/EIPS/eip-2098) _Available since v4.1._
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            // ecrecover takes the signature parameters, and the only way to get them
            // currently is to use assembly.
            assembly {
                r := mload(add(signature, 0x20))
                s := mload(add(signature, 0x40))
                v := byte(0, mload(add(signature, 0x60)))
            }
            return tryRecover(hash, v, r, s);
        } else if (signature.length == 64) {
            bytes32 r;
            bytes32 vs;
            // ecrecover takes the signature parameters, and the only way to get them
            // currently is to use assembly.
            assembly {
                r := mload(add(signature, 0x20))
                vs := mload(add(signature, 0x40))
            }
            return tryRecover(hash, r, vs);
        } else {
            return (address(0), RecoverError.InvalidSignatureLength);
        }
    }

    /**
     * @dev Returns the address that signed a hashed message (`hash`) with
     * `signature`. This address can then be used for verification purposes.
     *
     * The `ecrecover` EVM opcode allows for malleable (non-unique) signatures:
     * this function rejects them by requiring the `s` value to be in the lower
     * half order, and the `v` value to be either 27 or 28.
     *
     * IMPORTANT: `hash` _must_ be the result of a hash operation for the
     * verification to be secure: it is possible to craft signatures that
     * recover to arbitrary addresses for non-hashed data. A safe way to ensure
     * this is by receiving a hash of the original message (which may otherwise
     * be too long), and then calling {toEthSignedMessageHash} on it.
     */
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, signature);
        _throwError(error);
        return recovered;
    }

    /**
     * @dev Overload of {ECDSA-tryRecover} that receives the `r` and `vs` short-signature fields separately.
     *
     * See https://eips.ethereum.org/EIPS/eip-2098[EIP-2098 short signatures]
     *
     * _Available since v4.3._
     */
    function tryRecover(
        bytes32 hash,
        bytes32 r,
        bytes32 vs
    ) internal pure returns (address, RecoverError) {
        bytes32 s;
        uint8 v;
        assembly {
            s := and(vs, 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            v := add(shr(255, vs), 27)
        }
        return tryRecover(hash, v, r, s);
    }

    /**
     * @dev Overload of {ECDSA-recover} that receives the `r and `vs` short-signature fields separately.
     *
     * _Available since v4.2._
     */
    function recover(
        bytes32 hash,
        bytes32 r,
        bytes32 vs
    ) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, r, vs);
        _throwError(error);
        return recovered;
    }

    /**
     * @dev Overload of {ECDSA-tryRecover} that receives the `v`,
     * `r` and `s` signature fields separately.
     *
     * _Available since v4.3._
     */
    function tryRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address, RecoverError) {
        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (301): 0 < s < secp256k1n ÷ 2 + 1, and for v in (302): v ∈ {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return (address(0), RecoverError.InvalidSignatureS);
        }
        if (v != 27 && v != 28) {
            return (address(0), RecoverError.InvalidSignatureV);
        }

        // If the signature is valid (and not malleable), return the signer address
        address signer = ecrecover(hash, v, r, s);
        if (signer == address(0)) {
            return (address(0), RecoverError.InvalidSignature);
        }

        return (signer, RecoverError.NoError);
    }

    /**
     * @dev Overload of {ECDSA-recover} that receives the `v`,
     * `r` and `s` signature fields separately.
     */
    function recover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, v, r, s);
        _throwError(error);
        return recovered;
    }

    /**
     * @dev Returns an Ethereum Signed Message, created from a `hash`. This
     * produces hash corresponding to the one signed with the
     * https://eth.wiki/json-rpc/API#eth_sign[`eth_sign`]
     * JSON-RPC method as part of EIP-191.
     *
     * See {recover}.
     */
    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }

    /**
     * @dev Returns an Ethereum Signed Typed Data, created from a
     * `domainSeparator` and a `structHash`. This produces hash corresponding
     * to the one signed with the
     * https://eips.ethereum.org/EIPS/eip-712[`eth_signTypedData`]
     * JSON-RPC method as part of EIP-712.
     *
     * See {recover}.
     */
    function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ECDSA.sol";

/**
 * @dev https://eips.ethereum.org/EIPS/eip-712[EIP 712] is a standard for hashing and signing of typed structured data.
 *
 * The encoding specified in the EIP is very generic, and such a generic implementation in Solidity is not feasible,
 * thus this contract does not implement the encoding itself. Protocols need to implement the type-specific encoding
 * they need in their contracts using a combination of `abi.encode` and `keccak256`.
 *
 * This contract implements the EIP 712 domain separator ({_domainSeparatorV4}) that is used as part of the encoding
 * scheme, and the final step of the encoding to obtain the message digest that is then signed via ECDSA
 * ({_hashTypedDataV4}).
 *
 * The implementation of the domain separator was designed to be as efficient as possible while still properly updating
 * the chain id to protect against replay attacks on an eventual fork of the chain.
 *
 * NOTE: This contract implements the version of the encoding known as "v4", as implemented by the JSON RPC method
 * https://docs.metamask.io/guide/signing-data.html[`eth_signTypedDataV4` in MetaMask].
 *
 * _Available since v3.4._
 */
abstract contract EIP712 {
    /* solhint-disable var-name-mixedcase */
    // Cache the domain separator as an immutable value, but also store the chain id that it corresponds to, in order to
    // invalidate the cached domain separator if the chain id changes.
    bytes32 private immutable _CACHED_DOMAIN_SEPARATOR;
    uint256 private immutable _CACHED_CHAIN_ID;

    bytes32 private immutable _HASHED_NAME;
    bytes32 private immutable _HASHED_VERSION;
    bytes32 private immutable _TYPE_HASH;

    /* solhint-enable var-name-mixedcase */

    /**
     * @dev Initializes the domain separator and parameter caches.
     *
     * The meaning of `name` and `version` is specified in
     * https://eips.ethereum.org/EIPS/eip-712#definition-of-domainseparator[EIP 712]:
     *
     * - `name`: the user readable name of the signing domain, i.e. the name of the DApp or the protocol.
     * - `version`: the current major version of the signing domain.
     *
     * NOTE: These parameters cannot be changed except through a xref:learn::upgrading-smart-contracts.adoc[smart
     * contract upgrade].
     */
    constructor(string memory name, string memory version) {
        bytes32 hashedName = keccak256(bytes(name));
        bytes32 hashedVersion = keccak256(bytes(version));
        bytes32 typeHash = keccak256(
            "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
        );
        _HASHED_NAME = hashedName;
        _HASHED_VERSION = hashedVersion;
        _CACHED_CHAIN_ID = block.chainid;
        _CACHED_DOMAIN_SEPARATOR = _buildDomainSeparator(typeHash, hashedName, hashedVersion);
        _TYPE_HASH = typeHash;
    }

    /**
     * @dev Returns the domain separator for the current chain.
     */
    function _domainSeparatorV4() internal view returns (bytes32) {
        if (block.chainid == _CACHED_CHAIN_ID) {
            return _CACHED_DOMAIN_SEPARATOR;
        } else {
            return _buildDomainSeparator(_TYPE_HASH, _HASHED_NAME, _HASHED_VERSION);
        }
    }

    function _buildDomainSeparator(
        bytes32 typeHash,
        bytes32 nameHash,
        bytes32 versionHash
    ) private view returns (bytes32) {
        return keccak256(abi.encode(typeHash, nameHash, versionHash, block.chainid, address(this)));
    }

    /**
     * @dev Given an already https://eips.ethereum.org/EIPS/eip-712#definition-of-hashstruct[hashed struct], this
     * function returns the hash of the fully encoded EIP712 message for this domain.
     *
     * This hash can be used together with {ECDSA-recover} to obtain the signer of a message. For example:
     *
     * ```solidity
     * bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
     *     keccak256("Mail(address to,string contents)"),
     *     mailTo,
     *     keccak256(bytes(mailContents))
     * )));
     * address signer = ECDSA.recover(digest, signature);
     * ```
     */
    function _hashTypedDataV4(bytes32 structHash) internal view virtual returns (bytes32) {
        return ECDSA.toTypedDataHash(_domainSeparatorV4(), structHash);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 */
interface IERC20Permit {
    /**
     * @dev Sets `value` as the allowance of `spender` over ``owner``'s tokens,
     * given ``owner``'s signed approval.
     *
     * IMPORTANT: The same issues {IERC20-approve} has related to transaction
     * ordering also apply here.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `deadline` must be a timestamp in the future.
     * - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
     * over the EIP712-formatted function arguments.
     * - the signature must use ``owner``'s current nonce (see {nonces}).
     *
     * For more information on the signature format, see the
     * https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
     * section].
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /**
     * @dev Returns the current nonce for `owner`. This value must be
     * included whenever a signature is generated for {permit}.
     *
     * Every successful call to {permit} increases ``owner``'s nonce by one. This
     * prevents a signature from being used multiple times.
     */
    function nonces(address owner) external view returns (uint256);

    /**
     * @dev Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../IERC20.sol";

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 *
 * _Available since v4.1._
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}