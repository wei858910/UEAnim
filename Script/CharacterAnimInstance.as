class UCharacterAnimInstance : UAnimInstance
{
    AAnimCharacter Owner;

    UPROPERTY(BlueprintReadOnly)
    bool bMoveing = false;

    UFUNCTION(BlueprintOverride)
    void BlueprintInitializeAnimation()
    {
        Owner = Cast<AAnimCharacter>(TryGetPawnOwner());
    }

    UFUNCTION(BlueprintOverride)
    void BlueprintUpdateAnimation(float DeltaTimeX)
    {
        if (IsValid(Owner))
        {
            bMoveing = Owner.GetVelocity().Size() > 0.;
        }
    }
};