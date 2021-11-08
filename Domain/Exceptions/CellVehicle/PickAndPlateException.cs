namespace Domain.Exception
{
    [Serializable]
    public class PickAndPlateException: AppException
    {
        public PickAndPlateException() { }
        public PickAndPlateException(string message) : base(message) { }
        public PickAndPlateException(string message, System.Exception inner) : base(message, inner) { }
        protected PickAndPlateException(
            System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }
}
