using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_mypet_picturetest : System.Web.UI.Page
{
    private string fromRootToPhotos = @"C:\Users\游博翔\Documents\GitHub\pet\Photos\";
    string fileName;

    protected void Page_Load(object sender, EventArgs e)
    {
    
        if (!IsPostBack)
        {
            string photoFolder = Path.Combine(fromRootToPhotos, User.Identity.Name);

            if (Directory.Exists(photoFolder))
            {
                DisplayUploadedPhotos(photoFolder);
            }
        }
    }

    protected void Buttoncheck_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            if ((FileUpload1.PostedFile.ContentType == "image/jpeg") ||
                (FileUpload1.PostedFile.ContentType == "image/png") ||
                (FileUpload1.PostedFile.ContentType == "image/bmp") ||
                (FileUpload1.PostedFile.ContentType == "image/gif"))
            {
                if (Convert.ToInt64(FileUpload1.PostedFile.ContentLength) < 10000000)
                {

                    string photoFolder = Path.Combine(fromRootToPhotos, User.Identity.Name);

                    if (!Directory.Exists(photoFolder))
                        Directory.CreateDirectory(photoFolder);


                    string extension = Path.GetExtension(FileUpload1.FileName);//建一個黨名
                    string uniqueFileName = Path.ChangeExtension(FileUpload1.FileName, DateTime.Now.Ticks.ToString());//運用時間給予獨特黨名                    

                    //把兩個加起來變成不重複黨名
                    FileUpload1.SaveAs(Path.Combine(photoFolder, uniqueFileName + extension));

                    //加到Repeater裡面
                    DisplayUploadedPhotos(photoFolder);

                    Label1.Text = "<font color= 'green' >檔案上傳成功" + FileUpload1.FileName + "</font>";
                }
                else
                    Label1.Text = "檔案必須在10MB以下";
            }
            else
                Label1.Text = "檔案必須是 jpeg,png,bmp,gif ";
        }
        else
            Label1.Text = "沒有選擇檔案";
    }

    public void DisplayUploadedPhotos(string folder)
    {
        //
        //TODO:把圖片加進Repeater這個東東裡面
        //
        fileName = Path.Combine(fromRootToPhotos, User.Identity.Name);
        string[] allPhotoFiles = Directory.GetFiles(folder);
        IList<string> allPhotoPaths = new List<string>();

        foreach (string f in allPhotoFiles)
        {
            fileName = Path.GetFileName(f);      
            allPhotoPaths.Add("~/Photos/" + User.Identity.Name + "/" + fileName);
        }

        rptrUserPhotos.DataSource = allPhotoPaths;
        rptrUserPhotos.DataBind();
    }

    protected void imgUserPhoto_Command(object sender, CommandEventArgs e)
    {
        //
        //TODO:imgButton的事件點擊預覽完整圖片
        //

        StringBuilder script = new StringBuilder();

        script.Append("<script type='text/javascript'>");
        script.Append("var viewer = new PhotoViewer();");
        script.Append("viewer.setBorderWidth(0);");
        script.Append("viewer.disableToolbar();");
        script.Append("viewer.add('" + e.CommandArgument.ToString().Remove(0, 1) + "');");
        script.Append("viewer.show(0);");
        script.Append("</script>");

        ClientScript.RegisterStartupScript(GetType(), "viewer", script.ToString());
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        bool deletionOccurs = false;

        foreach (RepeaterItem ri in rptrUserPhotos.Items)
        {
            CheckBox cb = ri.FindControl("cbDelete") as CheckBox;

            if (cb.Checked)
            {
                string fromPhotosToExtension = cb.Attributes["special"];
                string fromRootToHome = @"C:\Users\游博翔\Documents\GitHub\pet\";
                string fileToDelete = Path.Combine(fromRootToHome, fromPhotosToExtension.Remove(0, 2));
                File.Delete(fileToDelete);

                Label1.Text = " < font color='Green'> Photo(s) successfully deleted.</font>";
                deletionOccurs = true;
            }
        }

        if (!deletionOccurs)
            Label1.Text = "沒有要刪除的選項";

        DisplayUploadedPhotos(Path.Combine(fromRootToPhotos, User.Identity.Name));
    }
}