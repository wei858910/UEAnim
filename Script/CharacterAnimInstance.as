class UCharacterAnimInstance : UAnimInstance
{
    AAnimCharacter Owner;

    UPROPERTY()
    bool bMoving = false;

    UPROPERTY()
    float OwnerSpeed = 0.;

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
            bMoving = Owner.GetVelocity().Size() > 0.;
            OwnerSpeed = Owner.GetVelocity().Size2D();
            Print(f"{OwnerSpeed}");
        }
    }
};