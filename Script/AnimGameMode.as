class AAnimGameMode : AGameMode
{
    UClass CharacterClass = Cast<UClass>(LoadObject(nullptr, "/Game/BP/BP_AnimCharacter.BP_AnimCharacter_C"));
    default DefaultPawnClass = CharacterClass;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
    }
};