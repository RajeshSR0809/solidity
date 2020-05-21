[
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "bytes32",
				"name": "itemIndex",
				"type": "bytes32"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "account",
				"type": "address"
			}
		],
		"name": "ChangeInPartOwner",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "bytes32",
				"name": "itemIndex",
				"type": "bytes32"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "account",
				"type": "address"
			}
		],
		"name": "changeInProductOwner",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "itemHash",
				"type": "bytes32"
			}
		],
		"name": "addProductToInventory",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "itemHash",
				"type": "bytes32"
			}
		],
		"name": "addSpareToInventory",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "createProduct",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "partName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "partType",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "uniqueNumber",
				"type": "string"
			}
		],
		"name": "createSpare",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"name": "spareParts",
		"outputs": [
			{
				"internalType": "string",
				"name": "partName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "partType",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "uniqueNumber",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "manufacturer",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "itemHash",
				"type": "bytes32"
			},
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			}
		],
		"name": "tranferSparePartRights",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]
