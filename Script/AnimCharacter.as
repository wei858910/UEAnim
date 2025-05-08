class AAnimCharacter : ACharacter
{

    UPROPERTY(DefaultComponent)
    UInputComponent InputComp;

    UPROPERTY(DefaultComponent)
    USpringArmComponent SpringArmComp;

    UPROPERTY(DefaultComponent, Attach = SpringArmComp)
    UCameraComponent PlayerCamera;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        InputComp.BindAxis(n"MoveRight", Delegate = FInputAxisHandlerDynamicSignature(this, n"MoveRight"));
        InputComp.BindAxis(n"MoveUp", Delegate = FInputAxisHandlerDynamicSignature(this, n"MoveUp"));
    }

    UFUNCTION()
    private void MoveRight(float32 AxisValue)
    {
        AddMovementInput(GetActorRightVector(), AxisValue);
    }

    UFUNCTION()
    private void MoveUp(float32 AxisValue)
    {
        AddMovementInput(GetActorForwardVector(), AxisValue);
    }
};