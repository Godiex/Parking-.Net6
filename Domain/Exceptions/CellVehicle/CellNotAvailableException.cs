namespace Domain.Exception
{
    [Serializable]
    public class CellNotAvailableException : AppException
    {
        public CellNotAvailableException() { }
        public CellNotAvailableException(string message) : base(message) { }
        public CellNotAvailableException(string message, System.Exception inner) : base(message, inner) { }
        protected CellNotAvailableException(
            System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }
}
