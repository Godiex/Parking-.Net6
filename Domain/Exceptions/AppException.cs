namespace Domain.Exception
{
    [Serializable]
    public class AppException : System.Exception
    {
        public AppException() { }
        public AppException(string message) : base(message) { }
        public AppException(string message, System.Exception inner) : base(message, inner) { }
        protected AppException(
            System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }

    public class ResourceNotFoundException : AppException
    {

        public ResourceNotFoundException() { }
        public ResourceNotFoundException(string message) : base(message) { }
        public ResourceNotFoundException(string message, System.Exception inner) : base(message, inner) { }
        protected ResourceNotFoundException(
            System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }

}
