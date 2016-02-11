public class SaveToPDF {

    public SaveToPDF(ApexPages.StandardController controller) {

    }

  public String renderAs { get; set; }
  public PageReference print() {
  renderAs = 'PDF';
  return null;
 }
}