class AAnimCharacter : ACharacter
{

    UPROPERTY(DefaultComponent)
    protected UInputComponent InputComp;

    UPROPERTY(DefaultComponent)
    protected USpringArmComponent SpringArmComp;
    default SpringArmComp.bUsePawnControlRotation = true;

    UPROPERTY(DefaultComponent, Attach = SpringArmComp)
    protected UCameraComponent PlayerCamera;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        InputComp.BindAxis(n"MoveRight", Delegate = FInputAxisHandlerDynamicSignature(this, n"MoveRight"));
        InputComp.BindAxis(n"MoveUp", Delegate = FInputAxisHandlerDynamicSignature(this, n"MoveUp"));
        InputComp.BindAxis(n"Turn", Delegate = FInputAxisHandlerDynamicSignature(this, n"Turn"));
        InputComp.BindAxis(n"Lookup", Delegate = FInputAxisHandlerDynamicSignature(this, n"Lookup"));
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

    UFUNCTION()
    private void Turn(float32 AxisValue)
    {
        AddControllerYawInput(AxisValue);
    }

    UFUNCTION()
    private void Lookup(float32 AxisValue)
    {
        AddControllerPitchInput(AxisValue);
    }
};