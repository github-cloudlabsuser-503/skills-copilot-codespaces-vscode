# Check if Az module is installed
if (-not (Get-Module -ListAvailable -Name Az)) {
    # Install Az module
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
}

# Login to Azure
Connect-AzAccount

# Set variables
$resourceGroupName = "myResourceGroup"
$location = "East US"
$storageAccountName = "mystorageaccount"

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
  -Name $storageAccountName `
  -Location $location `
  -SkuName Standard_GRS `
  -Kind StorageV2