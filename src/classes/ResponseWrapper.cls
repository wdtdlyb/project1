public class ResponseWrapper{
    public Boolean success;
    public Integer timestamp;
    public String source;
    public Quotes quotes;

    public class Quotes {
        public Double USDEUR;
    }


    public static ResponseWrapper parse(String json) {
        return (ResponseWrapper) System.JSON.deserialize(json, ResponseWrapper.class);
    }
}