import pandas as pd;

df = pd.read_csv('ecommerce_product_dataset2.csv')

# Criar coluna de receita líquida
df['RevenueNet'] = df['Price'] * (1 - df['Discount']) * df['Sales']

# Mostrar a nova coluna de receita líquida
print(df[['ProductName', 'RevenueNet']].head())

# Salvar o DataFrame atualizado em um novo arquivo CSV
df.to_csv('ecommerce_product_dataset_updated.csv', index=False) 