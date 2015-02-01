using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MapCrudStoredProcedures
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridAllProducts();
            }
        }

        protected void BindGridAllProducts()
        {
            using (StoreEntities entities = new StoreEntities())
            {
                grdAllProducts.DataSource = entities.GetAllProducts();
                grdAllProducts.DataBind();

                ddlProducts.DataSource = entities.Products.ToList();
                ddlProducts.DataTextField = "Name";
                ddlProducts.DataValueField = "ProductId";
                ddlProducts.DataBind();

                ddlEditProduct.Items.Clear();
                ddlEditProduct.DataSource = entities.Products.ToList();
                ddlEditProduct.DataTextField = "Name";
                ddlEditProduct.DataValueField = "ProductId";
                ddlEditProduct.Items.Insert(0, "Select Product..");
                ddlEditProduct.DataBind();

                txtNewProductId.Text = entities.Products.Max(p => p.ProductId + 1).ToString();
                txtNewProductId.Enabled = false;
            }
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (var context = new StoreEntities())
            {
                var productToDelete = context.Products.Find(Int32.Parse(ddlProducts.SelectedValue));
                if (productToDelete != null)
                {
                    context.Products.Remove(productToDelete);
                    context.SaveChanges();
                    BindGridAllProducts();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            using (var entities = new StoreEntities())
            {
                var product = entities.Products.Find(Int32.Parse(txtUpdateProductId.Text));
                product.Name = txtUpdateProductName.Text;
                product.Description = txtUpdateProductDescription.Text;
                product.Price = decimal.Parse(txtUpdateProductPrice.Text);

                entities.Entry(product).State = System.Data.EntityState.Modified;
                entities.SaveChanges();
                BindGridAllProducts();
            }

            pnlEditProduct.Visible = false;
        }

        protected void ddlEditProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEditProduct.SelectedValue != "Select Product..")
            {
                txtUpdateProductId.Text = ddlEditProduct.SelectedValue;
                txtUpdateProductId.Enabled = false;
                using (var entities = new StoreEntities())
                {
                    var product = entities.Products.Find(Int32.Parse(ddlEditProduct.SelectedValue));
                    txtUpdateProductName.Text = product.Name;
                    txtUpdateProductDescription.Text = product.Description;
                    txtUpdateProductPrice.Text = product.Price.ToString();
                }

                pnlEditProduct.Visible = true;
            }
            else
            {
                pnlEditProduct.Visible = false;
            }
        }

        protected void btnInsertNewProduct_Click(object sender, EventArgs e)
        {
            using (var context = new StoreEntities())
            {
                context.Products.Add(new Product
                {
                    ProductId = Int32.Parse(txtNewProductId.Text),
                    Name = txtNewProductName.Text,
                    Description = txtNewProductDescription.Text,
                    Price = decimal.Parse(txtNewProductPrice.Text)
                });

                context.SaveChanges();
                BindGridAllProducts();

                txtNewProductName.Text = "";
                txtNewProductDescription.Text = "";
                txtNewProductPrice.Text = "";

            }
        }
    }
}