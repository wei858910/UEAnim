class AAnimCharacter : ACharacter
{

    UPROPERTY(DefaultComponent)
    protected UInputComponent InputComp;

    UPROPERTY(DefaultComponent)
    protected USpringArmComponent SpringArmComp;

    UPROPERTY(DefaultComponent, Attach = SpringArmComp)
    protected UCameraComponent PlayerCamera;

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