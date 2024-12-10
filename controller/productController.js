const productModel = require("../model/productModel");
const columnRenamer = require('../middlewares/columnRenamer');
const getCurrentDateTime = require("../middlewares/getDate");
const { v4: uuidv4 } = require('uuid');
const { handleMultipleFileUpload } = require("../middlewares/multer");

class Controller {
    async getProducts(req, res) {
        productModel.get((error, result) => {
            if (error) {
                return res.status(500).json({ message: "Internal server error!" });
            }
            const products = columnRenamer(result);
            res.status(200).json({ products })
        })
    }

    async getProductsbyCategory(req, res) {
        try {
            const category = req.query.category || ''; // Read from query parameters
            const name = req.query.name || ''; // Read from query parameters
            const search = `%${category}%`;

            productModel.getProductsByCategory(search, `%${name}%`, (error, result) => {
                if (error) {
                    return res.status(500).json({ message: "Internal server error!", error });
                }

                if (result.length === 0) {
                    return res.status(404).json({ message: "No products found." });
                }

                const renamedResult = columnRenamer(result);
                res.status(200).json({ renamedResult });
            });
        } catch (error) {
            res.status(500).json({ message: "Internal server error!", error });
        }
    }



    async getProductsbySizeAndCategory(req, res) {
        const { size, category } = req.params;
        const data = [
            size, category
        ]
        productModel.getProductsBySizeAndCategory(data, (error, result) => {
            if (error) {
                return res.status(500).json({ message: "Internal server error!" });
            }
            const renamedResult = columnRenamer(result);
            res.status(200).json({ renamedResult })
        })
    }

    async insertProduct(req, res) {
        const {
            name,
            category,
            stock,
            // stockSmall,
            // stockMedium,
            // stockLarge,
            // stockXlarge,
            price,
            seller_id
        } = req.body;
        const files = req.files;
    
        if (!name || !category || !price) {
            return res.status(400).json({
                message: "Missing required fields: name, category, or price",
            });
        }
    
        if (!Array.isArray(files) || files.length === 0) {
            return res.status(400).json({
                message: "At least one valid image file is required",
            });
        }
    
        let images = [];
        files.forEach(file => {
            if (file.mimetype.startsWith('image/') && file.buffer) {
                const fileName = uuidv4() + path.extname(file.originalname);
                const uploadPath = path.join(__dirname, 'uploads');
                if (!fs.existsSync(uploadPath)) fs.mkdirSync(uploadPath, { recursive: true });
                fs.writeFileSync(path.join(uploadPath, fileName), file.buffer);
                images.push(fileName);
            } else {
                images.push(file.filename);
            }
        });
    
        let stockSmall = 0, stockMedium = 0, stockLarge = 0, stockXlarge = 0, stockColor = 'red';
        if (Array.isArray(stock)) {
            stock.value.forEach(item => {
                stockColor = item[0] || 'red';
                stockSmall = item[1] || stockSmall;
                stockMedium = item[2] || stockMedium;
                stockLarge = item[3] || stockLarge;
                stockXlarge = item[4] || stockXlarge;
            });
        }
    
        const sizeId = uuidv4();
        const productId = uuidv4();
    
        // Prepare data for insertion
        const insertData = [productId, uuidv4(), name, sizeId, images.join(','), seller_id];
        const stockInData = [sizeId, stockColor, stockSmall, stockMedium, stockLarge, stockXlarge, price, category];
    
        try {
            // const insertResult = await productModel.insert(insertData);
            const stockInResult = await productModel.stockIn(stockInData);
    
            if (insertResult && stockInResult) {
                res.status(200).json({
                    message: "Data successfully inserted",
                    data: { product: insertResult, stock: stockInResult },
                });
            } else {
                res.status(400).json({
                    message: "Failed to insert data",
                    details: { insertResult, stockInResult },
                });
            }
        } catch (error) {
            res.status(500).json({ message: 'Internal Server Error', error });
        }
    }
    

    async buyProduct(req, res) {
        const { id, quantity, size } = req.body;
        const data = [quantity, id];
        productModel.buyProduct(size, data, (error, result) => {
            if (error) {
                res.status(500).json({ message: "Internal Server Error!" })
            }
            res.status(200).json({ message: "Transaction Success!" });
        })
    }

    async cancelProduct(req, res) {
        const { id, quantity, size } = req.body;
        const data = [quantity, id];

        productModel.cancelOrder(size, data, (error, result) => {
            if (error) {
                return res.status(500).json({ message: "Internal Server Error!", error });
            }
            res.status(200).json({ message: "Transaction Success!", result });
        });
    }


    async deleteProduct(req, res) {
        const id = req.params.id;
        productModel.delete(id, (error, result) => {
            if (error) {
                return res.send({ messaege: "Internal Server Error!" })
            }
            res.send({ messaege: "Product data successfully deleted!" })
        })
    }

    async deleteAllProduct(req,res){
        const id = req.params.id;
        productModel.deleteAllProduct(id, (error, result) => {
            if (error) {
                return res.send({ messaege: "Internal Server Error!" })
            }
            res.send({ messaege: "Product data successfully deleted!" })
        })
    }
    async approveProduct(req, res) {
        const id = req.params.id;
        productModel.approve(id, (error, result) => {
            if (error) {
                return res.send({ messaege: "Internal Server Error!" })
            }
            res.send({ messaege: "Product Approved!" })
        })
    }
    async disapproveProduct(req, res) {
        const id = req.params.id;
        productModel.disapprove(id, (error, result) => {
            if (error) {
                return res.send({ messaege: "Internal Server Error!" })
            }
            res.send({ messaege: "Product Approved!" })
        })
    }

    async updateProduct(req, res) {
        const { SW_Name, SW_Small, SW_Medium, SW_Large, SW_X_large, SW_Category, SW_Price,SW_Discount } = req.body;
        const id = req.params.id;

        const data = [
            SW_Name, SW_Small, SW_Medium, SW_Large, SW_X_large, SW_Price, SW_Category,SW_Discount, id
        ];

        try {
            const result = await productModel.update(data);
            console.log(result);
            res.status(200).json({ message: "Product data successfully edited!" });
        } catch (error) {
            console.error(error);
            res.status(500).json({ message: "An error occurred while updating the product" });
        }
    }


}

module.exports = new Controller();