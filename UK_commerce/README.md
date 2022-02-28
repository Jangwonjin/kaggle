# UK Commerce Data Analysis
UK commerce 데이터를 활용하여 e-commerce 서비스 내에서 산출 가능한 다양한 지표에 대해 이해하고 시각화하는 것을 목표로 합니다.

## ⚡ Dataset
데이터는 [이곳](https://www.kaggle.com/carrie1/ecommerce-data)에서 다운받아 전처리 후에 사용했습니다.

## ⚡ Column 구성
데이터는 총 8개의 column으로 구성되어 있으며, 각 column의 이름과 설명은 다음과 같습니다.
|**Column**|**설명**|
|:---:|:---:|
|InvoiceNo|주문번호|
|StockCode|상품번호|
|Description|상품명|
|Quantity|구매 수량|
|UnitPrice|개당 판매가|
|CustomerID|고객 ID|
|Country|판매 국가|
|InvoiceDate|판매 일자|

## ⚡ 산출 지표
1. 국가별, 상품별 **구매자 수 및 매출액**
2. 특정 상품 구매자가 많이 구매한 상품
3. 국가별 **재구매율**
4. 국가별 첫 구매 후 **이탈**하는 고객의 **비율**
5. 판매 수량이 **20%이상 증가**한 상품 리스트 (연도기준)
6. 신규/기존 고객의 **2011년 월별 매출액**
7. 2011년 구매자의 **LTV**

## ⚡ Requirements
* Workbench 8.0
* MySQL
