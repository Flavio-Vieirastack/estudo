enum CompanySituationEntity {
  active('ACTIVE'),
  trial('TRIAL'),
  processingPayment('PROCESSINGPAYMENT'),
  expired('SUBSCRIPTIONEXPIRED');

  final String status;
  const CompanySituationEntity(this.status);

  static CompanySituationEntity getStatus(String value) {
    if (value == CompanySituationEntity.active.status) {
      return CompanySituationEntity.active;
    } else if (value == CompanySituationEntity.expired.status) {
      return CompanySituationEntity.expired;
    } else if (value == CompanySituationEntity.trial.status) {
      return CompanySituationEntity.trial;
    } else if (value == CompanySituationEntity.processingPayment.status) {
      return CompanySituationEntity.processingPayment;
    } else {
      return CompanySituationEntity.expired;
    }
  }
}
